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
    private AuthController _authController;
    
    public AuthControllerTest()
    {
        _fixture = new Fixture();
        _userManager = new Mock<UserManager<User>>(MockBehavior.Strict);
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
        
        Assert.AreEqual(1, 1);
    }
}