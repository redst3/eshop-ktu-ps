using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using persuasiveAPI.Auth;
using persuasiveAPI.Auth.Model;
using persuasiveAPI.Auth.Dtos;
using persuasiveAPI.Data.Repositories;

namespace persuasiveAPI.Controllers;

[ApiController]
[Route("api")]
public class AuthController : ControllerBase
{
    private readonly UserManager<User> _userManager;
    private readonly IJwtTokenService _jwtTokenService;
    private readonly IAuthorizationService _authorizationService;
    private readonly IWishlistRepository _wishlistRepository;

    public AuthController(UserManager<User> userManager, IJwtTokenService jwtTokenService,
        IAuthorizationService authService, IWishlistRepository wishlistRepository)
    {
        _userManager = userManager;
        _jwtTokenService = jwtTokenService;
        _authorizationService = authService;
        _wishlistRepository = wishlistRepository;
    }

    [HttpPost]
    [Route("register")]
    public async Task<IActionResult> Register(RegisterUserDto registerDto)
    {
        var user = await _userManager.FindByNameAsync(registerDto.UserName);
        if (user != null)
            return BadRequest("User already exists!");

        var newUser = new User
        {
            UserName = registerDto.UserName,
            Email = registerDto.Email,
        };
        var createUserResult = await _userManager.CreateAsync(newUser, registerDto.Password);

        if (!createUserResult.Succeeded)
        {
            return BadRequest(createUserResult.Errors);
        }
        await _userManager.AddToRoleAsync(newUser, UserRoles.User);
        await _wishlistRepository.CreateWishlist(newUser.Id);

        return CreatedAtAction(nameof(Register), new UserDto(newUser.Id, newUser.UserName, newUser.Email));


    }

    [HttpPost]
    [Route("login")]
    public async Task<IActionResult> Login(LoginUserDto loginDto)
    {
        var user = await _userManager.FindByNameAsync(loginDto.UserName);
        if (user == null)
            return BadRequest("Wrong password or username !");

        var isPasswordValid = await _userManager.CheckPasswordAsync(user, loginDto.Password);
        if (!isPasswordValid)
            return BadRequest("Wrong password or username!");

        // the user is valid at this point
        var shippingAddress = user.Country + "," + user.City + "," + user.Address + "," + user.PostalCode;
        var roles = await _userManager.GetRolesAsync(user);
        var accessToken = _jwtTokenService.CreateAccessToken(user.UserName, user.Id, roles, user.Email, shippingAddress);
        return Ok(new SuccessfulLoginDto(accessToken));

    }
    [HttpPut]
    [Route("shipping-address/{userId}")]
    public async Task<IActionResult> UpdateShippingAddress(string userId, [FromBody] UpdateShippingAddressDto updateShippingAddressDto)
    {
        var user = await _userManager.FindByIdAsync(userId);
        if (user == null)
            return BadRequest("User does not exist!");

        user.Country = updateShippingAddressDto.Country;
        user.City = updateShippingAddressDto.City;
        user.Address = updateShippingAddressDto.Address;
        user.PostalCode = updateShippingAddressDto.PostalCode;

        var updateUserResult = await _userManager.UpdateAsync(user);
        if (!updateUserResult.Succeeded)
        {
            return BadRequest(updateUserResult.Errors);
        }

        return Ok("Shipping address updated successfully!");
    }
}