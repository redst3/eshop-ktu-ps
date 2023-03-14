using Microsoft.EntityFrameworkCore;
using persuasiveAPI.Data.Entities;
using System.Text.Json;
using System.Text.Json.Serialization;

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
        if(userWishlist == null)
            throw new ArgumentNullException(nameof(userWishlist));
        return userWishlist;
    }
    public async Task AddProductToWishlist(string userId, int productId)
    {
        if (userId.Length == 0)
            throw new ArgumentNullException(nameof(userId));
        if (productId == 0)
            throw new ArgumentNullException(nameof(productId));
        Wishlist? userWishlist = await _context.Wishlists.FirstOrDefaultAsync(w => w.UserId == userId);
        if(userWishlist == null)
            throw new ArgumentNullException(nameof(userWishlist));
        Console.WriteLine(userWishlist);
        var wishlist = JsonSerializer.Deserialize<List<int>>(userWishlist.ProductIds ?? "[]");
        if(wishlist == null)
            throw new ArgumentNullException(nameof(wishlist));
        if(wishlist.Contains(productId))
            return;

        wishlist.Add(productId);
        userWishlist.ProductIds = JsonSerializer.Serialize(wishlist);
        await _context.SaveChangesAsync();
    }
    public async Task RemoveProductFromWishlist(string userId, int productId)
    {
        if (userId.Length == 0)
            throw new ArgumentNullException(nameof(userId));
        if (productId == 0)
            throw new ArgumentNullException(nameof(productId));
        Wishlist? userWishlist = await _context.Wishlists.FirstOrDefaultAsync(w => w.UserId == userId);
        if(userWishlist == null)
            throw new ArgumentNullException(nameof(userWishlist));
        var wishlist = JsonSerializer.Deserialize<List<int>>(userWishlist.ProductIds ?? "[]");
        if(wishlist == null)
            throw new ArgumentNullException(nameof(wishlist));
        if(!wishlist.Contains(productId))
            return;

        wishlist.Remove(productId);
        userWishlist.ProductIds = JsonSerializer.Serialize(wishlist);
        await _context.SaveChangesAsync();
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
    Task AddProductToWishlist(string userId, int productId);
    Task RemoveProductFromWishlist(string userId, int productId);
    Task CreateWishlist(string userId);
}