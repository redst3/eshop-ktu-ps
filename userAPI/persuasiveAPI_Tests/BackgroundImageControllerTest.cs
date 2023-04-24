using Moq;
using AutoFixture;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using persuasiveAPI.Auth;
using persuasiveAPI.Controllers;
using persuasiveAPI.Data.Entities;
using persuasiveAPI.Data.Repositories;

namespace persuasiveAPI_Tests;

[TestClass]
public class BackgroundImageControllerTest
{
    private readonly Mock<IBackgroundImageRepository> _backgroundImageRepository;
    private readonly Mock<IJwtTokenService> _jwtTokenService;
    private readonly Fixture _fixture;
    private BackgroundImageController _backgroundImageController;
    
    public BackgroundImageControllerTest()
    {
        _fixture = new Fixture();
        _backgroundImageRepository = new Mock<IBackgroundImageRepository>();
        _jwtTokenService = new Mock<IJwtTokenService>();
    }
    
    [TestMethod]
    public async Task BackgroundImageController_GetBackgroundImage_ReturnNoContent()
    {
        var background = new BackgroundImage
        {
            ImageUrl = null,
            px_to_cm = 100,
            UserId = "1"
        };
        _backgroundImageRepository.Setup(b => b.GetBackgroundByUserId(It.IsAny<string>())).ReturnsAsync(background);
        _backgroundImageController = new BackgroundImageController(_backgroundImageRepository.Object, _jwtTokenService.Object);
        
        var result = await _backgroundImageController.GetBackgroundImage(It.IsAny<string>());
        Assert.IsInstanceOfType(result, typeof(NoContentResult));
    }
    
    [TestMethod]
    public async Task BackgroundImageController_GetBackgroundImage_ReturnNotFound()
    {
        var background = _fixture.Create<BackgroundImage>();
        _backgroundImageRepository.Setup(b => b.GetBackgroundByUserId(It.IsAny<string>())).ReturnsAsync(background);
        _backgroundImageController = new BackgroundImageController(_backgroundImageRepository.Object, _jwtTokenService.Object);
        
        var result = await _backgroundImageController.GetBackgroundImage(It.IsAny<string>());
        var obj = result as ObjectResult;
        Assert.AreEqual(404, obj?.StatusCode);
    }

    [TestMethod]
    public async Task BackgroundImageController_GetBackgroundImage_ReturnOk()
    {
        var background = new BackgroundImage
        {
            ImageUrl = "userAPI/persuasiveAPI_Tests/Images/test_background.jpg",
            px_to_cm = 100,
            UserId = "1"
        };
        _backgroundImageRepository.Setup(b => b.GetBackgroundByUserId(It.IsAny<string>())).ReturnsAsync(background);
        _backgroundImageController = new BackgroundImageController(_backgroundImageRepository.Object, _jwtTokenService.Object);
        
        var result = await _backgroundImageController.GetBackgroundImage(It.IsAny<string>());
        var obj = result as ObjectResult;
        Assert.AreEqual(404, obj?.StatusCode);
    }

    [TestMethod]
    public async Task BackgroundImageController_ImportBackgroundImage_ReturnBadRequest()
    {
        _backgroundImageController = new BackgroundImageController(_backgroundImageRepository.Object, _jwtTokenService.Object);
        var result = await _backgroundImageController.ImportBackgroundImage("1", null, 0);
        var obj = result as ObjectResult;
        Assert.AreEqual(400, obj?.StatusCode);
    }
    [TestMethod]
    public async Task BackgroundImageController_ImportBackgroundImage_ReturnOk()
    {
        var background = new BackgroundImage
        {
            ImageUrl = "userAPI/persuasiveAPI_Tests/Images/test_background.jpg",
            px_to_cm = 100,
            UserId = "1"
        };
        _backgroundImageRepository.Setup(b => b.GetBackgroundByUserId(It.IsAny<string>())).ReturnsAsync(background);
        
        _backgroundImageController = new BackgroundImageController(_backgroundImageRepository.Object, _jwtTokenService.Object);
        
        var result = await _backgroundImageController.ImportBackgroundImage("1", null, 0.45);
        var obj = result as ObjectResult;
        Assert.AreEqual(200, obj?.StatusCode);
        
    }
}