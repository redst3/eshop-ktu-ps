using AutoFixture;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using Moq;
using persuasiveAPI.Auth;
using persuasiveAPI.Auth.Dtos;
using persuasiveAPI.Auth.Model;
using persuasiveAPI.Controllers;
using persuasiveAPI.Data.Repositories;

namespace persuasiveAPI_Tests;

[TestClass]
public class AuthControllerTest
{
    private readonly Mock<UserManager<User>> _userManager;
    private readonly Mock<IJwtTokenService> _jwtTokenService;
    private readonly Mock<IAuthorizationService> _authorizationService;
    private readonly Mock<IWishlistRepository> _wishlistRepository;
    private readonly Fixture _fixture;
    private AuthController? _authController;
    
    public AuthControllerTest()
    {
        _fixture = new Fixture();
        _userManager = new(Mock.Of<IUserStore<User>>(), null, null, null, null, null, null, null, null); 
        _jwtTokenService = new Mock<IJwtTokenService>();
        _authorizationService = new Mock<IAuthorizationService>();
        _wishlistRepository = new Mock<IWishlistRepository>();
    }
    [TestMethod]
    public async Task AuthController_Register_ReturnUserExists()
    {
        var user = new User
        {
            UserName = "username",
            Email = "email",
        };
        _userManager.Setup(u => u.FindByNameAsync(It.IsAny<string>())).ReturnsAsync(user);
        _authController = new AuthController(_userManager.Object, _jwtTokenService.Object, _authorizationService.Object, _wishlistRepository.Object);
        var result = await _authController.Register(_fixture.Create<RegisterUserDto>());
        var obj = result as ObjectResult;
        

        Assert.AreEqual(400, obj?.StatusCode);
    }
    
    [TestMethod]
    public async Task AuthController_Register_ReturnUserPasswordWeak()
    {
        _userManager.Setup(u => u.FindByNameAsync(It.IsAny<string>())).ReturnsAsync(null as User);
        _userManager.Setup(u => u.CreateAsync(It.IsAny<User>(), It.IsAny<string>())).ReturnsAsync(IdentityResult.Failed(new IdentityError {Description = "Password too weak"}));
        _authController = new AuthController(_userManager.Object, _jwtTokenService.Object, _authorizationService.Object, _wishlistRepository.Object);
        var result = await _authController.Register(_fixture.Create<RegisterUserDto>());
        var obj = result as ObjectResult;
        

        Assert.AreEqual(400, obj?.StatusCode);
    }
    [TestMethod]
    public async Task AuthController_Register_ReturnUserCreatedAtAction()
    {
        _userManager.Setup(u => u.FindByNameAsync(It.IsAny<string>())).ReturnsAsync(null as User);
        _userManager.Setup(u => u.CreateAsync(It.IsAny<User>(), It.IsAny<string>())).ReturnsAsync(IdentityResult.Success);
        _authController = new AuthController(_userManager.Object, _jwtTokenService.Object, _authorizationService.Object, _wishlistRepository.Object);
        var result = await _authController.Register(_fixture.Create<RegisterUserDto>());
        var obj = result as ObjectResult;
        

        Assert.AreEqual(201, obj?.StatusCode);
    }
    [TestMethod]
    public async Task AuthController_Login_ReturnBadRequestBadUserName()
    {
        _userManager.Setup(u => u.FindByNameAsync(It.IsAny<string>())).ReturnsAsync(null as User);
        _authController = new AuthController(_userManager.Object, _jwtTokenService.Object, _authorizationService.Object, _wishlistRepository.Object);
        var result = await _authController.Login(_fixture.Create<LoginUserDto>());
        var obj = result as ObjectResult;
        
        
        Assert.AreEqual(400, obj?.StatusCode);
    }
    [TestMethod]
    public async Task AuthController_Login_ReturnBadRequestBadPassword()
    {
        _userManager.Setup(u => u.FindByNameAsync(It.IsAny<string>())).ReturnsAsync(new User());
        _userManager.Setup(u => u.CheckPasswordAsync(It.IsAny<User>(), It.IsAny<string>())).ReturnsAsync(false);
        _authController = new AuthController(_userManager.Object, _jwtTokenService.Object, _authorizationService.Object, _wishlistRepository.Object);
        var result = await _authController.Login(_fixture.Create<LoginUserDto>());
        var obj = result as ObjectResult;
        
        
        Assert.AreEqual(400, obj?.StatusCode);
    }
    
    [TestMethod]
    public async Task AuthController_Login_ReturnOk()
    {
        _userManager.Setup(u => u.FindByNameAsync(It.IsAny<string>())).ReturnsAsync(new User());
        _userManager.Setup(u => u.CheckPasswordAsync(It.IsAny<User>(), It.IsAny<string>())).ReturnsAsync(true);
        _jwtTokenService.Setup(j => j.CreateAccessToken(It.IsAny<string>(), It.IsAny<string>(),
            It.IsAny<IEnumerable<string>>(), It.IsAny<string>(), It.IsAny<string>())).Returns("token");
        
        _authController = new AuthController(_userManager.Object, _jwtTokenService.Object, _authorizationService.Object, _wishlistRepository.Object);
        var result = await _authController.Login(_fixture.Create<LoginUserDto>());
        var obj = result as ObjectResult;
        
        
        Assert.AreEqual(200, obj?.StatusCode);
    }
    [TestMethod]
    public async Task AuthController_UpdateShippingAddress_ReturnBadRequestNoUser()
    {
        _userManager.Setup(u => u.FindByIdAsync(It.IsAny<string>())).ReturnsAsync(null as User);
        _authController = new AuthController(_userManager.Object, _jwtTokenService.Object, _authorizationService.Object, _wishlistRepository.Object);
        var result = await _authController.UpdateShippingAddress("123" ,_fixture.Create<UpdateShippingAddressDto>());
        var obj = result as ObjectResult;
        
        
        Assert.AreEqual(400, obj?.StatusCode);
    }
    [TestMethod]
    public async Task AuthController_UpdateShippingAddress_ReturnBadRequestFailedUpdate()
    {
        _userManager.Setup(u => u.FindByIdAsync(It.IsAny<string>())).ReturnsAsync(new User());
        _userManager.Setup(u => u.UpdateAsync(It.IsAny<User>())).ReturnsAsync(IdentityResult.Failed(new IdentityError {Description = "Failed"}));
        _authController = new AuthController(_userManager.Object, _jwtTokenService.Object, _authorizationService.Object, _wishlistRepository.Object);
        var result = await _authController.UpdateShippingAddress("123" ,_fixture.Create<UpdateShippingAddressDto>());
        var obj = result as ObjectResult;
        
        
        Assert.AreEqual(400, obj?.StatusCode);
    }
    [TestMethod]
    public async Task AuthController_UpdateShippingAddress_ReturnOk()
    {
        _userManager.Setup(u => u.FindByIdAsync(It.IsAny<string>())).ReturnsAsync(new User());
        _userManager.Setup(u => u.UpdateAsync(It.IsAny<User>())).ReturnsAsync(IdentityResult.Success);
        _authController = new AuthController(_userManager.Object, _jwtTokenService.Object, _authorizationService.Object, _wishlistRepository.Object);
        var result = await _authController.UpdateShippingAddress("123" ,_fixture.Create<UpdateShippingAddressDto>());
        var obj = result as ObjectResult;
        
        
        Assert.AreEqual(200, obj?.StatusCode);
    }
    
}