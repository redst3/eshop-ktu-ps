using Microsoft.AspNetCore.Identity;
using persuasiveAPI.Auth;
using persuasiveAPI.Auth.Model;

namespace persuasiveAPI.Data;

public class AuthDbSeeder
{
    private readonly UserManager<User> _userManager;
    private readonly RoleManager<IdentityRole> _roleManager;
    public AuthDbSeeder(UserManager<User> userManager, RoleManager<IdentityRole> roleManager)
    {
        _userManager = userManager;
        _roleManager = roleManager;
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