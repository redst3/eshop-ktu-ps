using AutoFixture;
using Microsoft.AspNetCore.Mvc;
using Moq;
using persuasiveAPI.Auth;
using persuasiveAPI.Controllers;
using persuasiveAPI.Data.Entities;
using persuasiveAPI.Data.Repositories;

namespace persuasiveAPI_Tests;


[TestClass]
public class WishlistControllerTest
{
    private readonly Mock<IWishlistRepository> _wishlistRepository;
    private readonly Mock<IJwtTokenService> _jwtTokenService;
    private readonly Fixture _fixture;
    private WishlistController? _wishlistController;

    public WishlistControllerTest()
    {
        _fixture = new Fixture();
        _wishlistRepository = new Mock<IWishlistRepository>();
        _jwtTokenService = new Mock<IJwtTokenService>();
    }

    [TestMethod]
    public async Task WishlistController_GetWishlist_ReturnOK()
    {
        var wishlist = _fixture.Create<Wishlist>();
        _wishlistRepository.Setup(w => w.GetWishlistByUserId(It.IsAny<string>())).ReturnsAsync(wishlist);
        _wishlistController = new WishlistController(_wishlistRepository.Object, _jwtTokenService.Object);
        
        var result = await _wishlistController.GetWishlist(It.IsAny<string>());
        var obj = result as ObjectResult;
        Assert.AreEqual(200, obj?.StatusCode);
    }
    [TestMethod]
    public async Task WishlistController_GetWishlist_ReturnNotFound()
    {
        var wishlist = new Wishlist
        {
            Id = -1,
            ProductIds = null,
            UserId = "-1",
        };
        
        _wishlistRepository.Setup(w => w.GetWishlistByUserId(It.IsAny<string>())).ReturnsAsync(wishlist);
        _wishlistController = new WishlistController(_wishlistRepository.Object, _jwtTokenService.Object);
        
        var result = await _wishlistController.GetWishlist(It.IsAny<string>());
        var obj = result as ObjectResult;
        Assert.AreEqual(404, obj?.StatusCode);
    }

    [TestMethod]
    public async Task WishlistController_AddProduct_ReturnOk()
    {
        _wishlistRepository.Setup(w => w.AddProductToWishlist(It.IsAny<string>(), It.IsAny<int>())).ReturnsAsync(true);
        _wishlistController = new WishlistController(_wishlistRepository.Object, _jwtTokenService.Object);
        var result = await _wishlistController.AddProduct(It.IsAny<string>(), It.IsAny<int>());
        var obj = result as ObjectResult;
        Assert.AreEqual(200, obj?.StatusCode);
    }
    [TestMethod]
    public async Task WishlistController_AddProduct_ReturnNotFound()
    {
        _wishlistRepository.Setup(w => w.AddProductToWishlist(It.IsAny<string>(), It.IsAny<int>())).ReturnsAsync(false);
        _wishlistController = new WishlistController(_wishlistRepository.Object, _jwtTokenService.Object);
        var result = await _wishlistController.AddProduct(It.IsAny<string>(), It.IsAny<int>());
        var obj = result as ObjectResult;
        Assert.AreEqual(404, obj?.StatusCode);
    }
    [TestMethod]
    public async Task WishlistController_RemoveProduct_ReturnOk()
    {
        _wishlistRepository.Setup(w => w.RemoveProductFromWishlist(It.IsAny<string>(), It.IsAny<int>())).ReturnsAsync(true);
        _wishlistController = new WishlistController(_wishlistRepository.Object, _jwtTokenService.Object);
        var result = await _wishlistController.RemoveProduct(It.IsAny<string>(), It.IsAny<int>());
        var obj = result as ObjectResult;
        Assert.AreEqual(200, obj?.StatusCode);
    }
    [TestMethod]
    public async Task WishlistController_RemoveProduct_ReturnNotFound()
    {
        _wishlistRepository.Setup(w => w.RemoveProductFromWishlist(It.IsAny<string>(), It.IsAny<int>())).ReturnsAsync(false);
        _wishlistController = new WishlistController(_wishlistRepository.Object, _jwtTokenService.Object);
        var result = await _wishlistController.RemoveProduct(It.IsAny<string>(), It.IsAny<int>());
        var obj = result as ObjectResult;
        Assert.AreEqual(404, obj?.StatusCode);
    }
    
    


}