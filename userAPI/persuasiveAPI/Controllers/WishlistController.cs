
using Microsoft.AspNetCore.Mvc;
using persuasiveAPI.Data.Repositories;

namespace persuasiveAPI.Controllers;
[ApiController]
[Route("/api/wishlists")]
public class WishlistController: ControllerBase
{
    private readonly IWishlistRepository _wishlistRepository;
    public WishlistController(IWishlistRepository wishlistRepository)
    {
        _wishlistRepository = wishlistRepository;
    }
    [HttpGet]
    [Route("{userId}")]
    public async Task<IActionResult> GetWishlist(string userId)
    {
        var wishlist = await _wishlistRepository.GetWishlistByUserId(userId);
        return Ok(wishlist);
    }
    [HttpPut]
    [Route("{userId}/{productId}")]
    public async Task<IActionResult> AddProduct(string userId, int productId)
    {
        await _wishlistRepository.AddProductToWishlist(userId, productId);
        return Ok();
    }
    [HttpDelete]
    [Route("{userId}/{productId}")]
    public async Task<IActionResult> RemoveProduct(string userId, int productId)
    {
        await _wishlistRepository.RemoveProductFromWishlist(userId, productId);
        return Ok();
    }
}