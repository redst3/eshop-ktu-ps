using Microsoft.EntityFrameworkCore;
using persuasiveAPI.Data.Entities;
using System.Text.Json;
using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;

namespace persuasiveAPI.Data.Repositories;

public class WishlistRepository : IWishlistRepository
{
    private readonly Context _context;
    public WishlistRepository(Context context)
    {
        _context = context;
    }
    public async Task<Wishlist> GetWishlistByUserId(string userId)
    {
        if (userId.Length == 0)
            throw new ArgumentNullException(nameof(userId));
        var userWishlist = await _context.Wishlists.FirstOrDefaultAsync(w => w.UserId == userId);
        if (userWishlist == null)
            return new Wishlist
            {
                Id = -1,
                ProductIds = null,
                UserId = "-1",
            };
        return userWishlist;
    }
    public async Task<bool> AddProductToWishlist(string userId, int productId)
    {
        if (userId.Length == 0)
            return false;
        if (productId == 0)
            return false;
        Wishlist? userWishlist = await _context.Wishlists.FirstOrDefaultAsync(w => w.UserId == userId);
        if(userWishlist == null)
            return false;
        Console.WriteLine(userWishlist);
        var wishlist = JsonSerializer.Deserialize<List<int>>(userWishlist.ProductIds ?? "[]");
        if(wishlist == null)
            return false;
        if (wishlist.Contains(productId))
            return false;

        wishlist.Add(productId);
        userWishlist.ProductIds = JsonSerializer.Serialize(wishlist);
        await _context.SaveChangesAsync();
        return true;
    }
    public async Task<bool> RemoveProductFromWishlist(string userId, int productId)
    {
        if (userId.Length == 0)
            return false;
        if (productId == 0)
            return false;
        Wishlist? userWishlist = await _context.Wishlists.FirstOrDefaultAsync(w => w.UserId == userId);
        if (userWishlist == null)
            return false;
        var wishlist = JsonSerializer.Deserialize<List<int>>(userWishlist.ProductIds ?? "[]");
        if (wishlist == null)
            return false;
        if (!wishlist.Contains(productId))
            return false;

        wishlist.Remove(productId);
        userWishlist.ProductIds = JsonSerializer.Serialize(wishlist);
        await _context.SaveChangesAsync();
        return true;
    }
    public async Task CreateWishlist(string userId)
    {
        if (userId.Length == 0)
            throw new ArgumentNullException(nameof(userId));
        var userWishlist = new Wishlist
        {
            UserId = userId,
            ProductIds = JsonSerializer.Serialize(Array.Empty<int>())
        };
        await _context.Wishlists.AddAsync(userWishlist);
        await _context.SaveChangesAsync();
    }
}

public interface IWishlistRepository
{
    Task<Wishlist> GetWishlistByUserId(string userId);
    Task<bool> AddProductToWishlist(string userId, int productId);
    Task<bool> RemoveProductFromWishlist(string userId, int productId);
    Task CreateWishlist(string userId);
}