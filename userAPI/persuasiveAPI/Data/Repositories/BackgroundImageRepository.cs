using Microsoft.EntityFrameworkCore;
using persuasiveAPI.Data.Entities;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace persuasiveAPI.Data.Repositories;

public class BackgroundImageRepository : IBackgroundImageRepository
{
    private readonly Context _context;
    public BackgroundImageRepository(Context context)
    {
        _context = context;
    }
    public async Task<BackgroundImage> GetBackgroundByUserId(string userId)
    {
        var background = await _context.BackgroundImages.FirstOrDefaultAsync(b => b.UserId == userId);
        if(background == null)
        {
            background = new BackgroundImage
            {
                UserId = userId,
                ImageUrl = null,
                px_to_cm = 100
            };
            await _context.BackgroundImages.AddAsync(background);
            await _context.SaveChangesAsync();
        }
        return background;
    }
    public async Task<BackgroundImage> UpdateBackgroundImage(BackgroundImage background)
    {
        _context.BackgroundImages.Update(background);
        await _context.SaveChangesAsync();
        return background;
    }
}

public interface IBackgroundImageRepository
{
    Task<BackgroundImage> GetBackgroundByUserId(string userId);
    Task<BackgroundImage> UpdateBackgroundImage(BackgroundImage background);
}