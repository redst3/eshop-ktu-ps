using Microsoft.AspNetCore.Identity;
using persuasiveAPI.Auth;
using persuasiveAPI.Auth.Model;
using persuasiveAPI.Data.Repositories;

namespace persuasiveAPI.Data;

public class AuthDbSeeder
{
    private readonly UserManager<User> _userManager;
    private readonly RoleManager<IdentityRole> _roleManager;
    private readonly IWishlistRepository _wishlistRepository;
    public AuthDbSeeder(UserManager<User> userManager, RoleManager<IdentityRole> roleManager, IWishlistRepository wishlistRepository)
    {
        _userManager = userManager;
        _roleManager = roleManager;
        _wishlistRepository = wishlistRepository;
    }

    public async Task SeedAsync()
    {
        await AddAdminUser();
        await AddDefaultRoles();
    }

    private async Task AddDefaultRoles()
    {
        var newAdmin = new User
        {
            UserName = "admin",
            Email = "admin@admin.com"
        };
        var adminExists = await _userManager.FindByNameAsync(newAdmin.UserName);
        if (adminExists == null)
        {
            var createAdminResult = await _userManager.CreateAsync(newAdmin, "Administratorius1!");
            if (createAdminResult.Succeeded)
            {
                await _userManager.AddToRolesAsync(newAdmin, UserRoles.All);
                await _wishlistRepository.CreateWishlist(newAdmin.Id);
            }
        }
    }

    private async Task AddAdminUser()
    {
        foreach (var role in UserRoles.All)
        {
            var roleExists = await _roleManager.RoleExistsAsync(role);
            if (!roleExists)
            {
                await _roleManager.CreateAsync(new IdentityRole(role));
            }
        }
    }
}