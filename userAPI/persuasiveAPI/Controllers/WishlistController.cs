
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using persuasiveAPI.Auth;
using persuasiveAPI.Data.Repositories;

namespace persuasiveAPI.Controllers;
[ApiController]
[Route("/api/wishlists")]
public class WishlistController: ControllerBase
{
    private readonly IWishlistRepository _wishlistRepository;
    private readonly IJwtTokenService _jwtTokenService;
    public WishlistController(IWishlistRepository wishlistRepository, IJwtTokenService jwtTokenService)
    {
        _wishlistRepository = wishlistRepository;
        _jwtTokenService = jwtTokenService;
    }
    [HttpGet]
    [Route("{userId}")]
    [Authorize(Roles = UserRoles.User)]
    public async Task<IActionResult> GetWishlist(string userId)
    {
        var token = Request.Headers["Authorization"].ToString().Substring(7);
        var isValid = _jwtTokenService.CheckAccessTokenWithUserId(token, userId);
        if(!isValid)
            return Unauthorized("Requested user id does not match token");

        var wishlist = await _wishlistRepository.GetWishlistByUserId(userId);
        return Ok(wishlist);
    }
    [HttpPut]
    [Route("{userId}/{productId}")]
    [Authorize(Roles = UserRoles.User)]
    public async Task<IActionResult> AddProduct(string userId, int productId)
    {
        var token = Request.Headers["Authorization"].ToString().Substring(7);
        var isValid = _jwtTokenService.CheckAccessTokenWithUserId(token, userId);
        if(!isValid)
            return Unauthorized("Requested user id does not match token");

        await _wishlistRepository.AddProductToWishlist(userId, productId);
        return Ok();
    }
    [HttpDelete]
    [Route("{userId}/{productId}")]
    [Authorize(Roles = UserRoles.User)]
    public async Task<IActionResult> RemoveProduct(string userId, int productId)
    {
        var token = Request.Headers["Authorization"].ToString().Substring(7);
        var isValid = _jwtTokenService.CheckAccessTokenWithUserId(token, userId);
        if(!isValid)
            return Unauthorized("Requested user id does not match token");

        await _wishlistRepository.RemoveProductFromWishlist(userId, productId);
        return Ok();
    }
}