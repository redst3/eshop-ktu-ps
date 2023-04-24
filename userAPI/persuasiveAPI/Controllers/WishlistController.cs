
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
        try
        {
            var token = Request.Headers["Authorization"].ToString().Substring(7);
            var isValid = _jwtTokenService.CheckAccessTokenWithUserId(token, userId);
            if (!isValid)
                return Unauthorized("Requested user id does not match token");
        }
        catch{}

        var wishlist = await _wishlistRepository.GetWishlistByUserId(userId);
        if (wishlist.Id == -1)
            return NotFound("Bad userId");

        return Ok(wishlist);
    }
    [HttpPut]
    [Route("{userId}/{productId}")]
    [Authorize(Roles = UserRoles.User)]
    public async Task<IActionResult> AddProduct(string userId, int productId)
    {
        try
        {
            var token = Request.Headers["Authorization"].ToString().Substring(7);
            var isValid = _jwtTokenService.CheckAccessTokenWithUserId(token, userId);
            if (!isValid)
                return Unauthorized("Requested user id does not match token");
        }
        catch{}
        var isAdded = await _wishlistRepository.AddProductToWishlist(userId, productId);
        if (isAdded) return Ok("Product added from wishlist");
        return NotFound("Product not found in wishlist");
    }
    [HttpDelete]
    [Route("{userId}/{productId}")]
    [Authorize(Roles = UserRoles.User)]
    public async Task<IActionResult> RemoveProduct(string userId, int productId)
    {
        try
        {
            var token = Request.Headers["Authorization"].ToString().Substring(7);
            var isValid = _jwtTokenService.CheckAccessTokenWithUserId(token, userId);
            if (!isValid)
                return Unauthorized("Requested user id does not match token");
        }
        catch{}
        var isRemoved = await _wishlistRepository.RemoveProductFromWishlist(userId, productId);
        if (isRemoved) return Ok("Product removed from wishlist");
        return NotFound("Product not found in wishlist");
    }
}