using System.IdentityModel.Tokens.Jwt;
using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore; 
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using persuasiveAPI.Auth;
using persuasiveAPI.Auth.Model;
using persuasiveAPI.Data;
using persuasiveAPI.Data.Repositories;

public class Program
{
    public static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);
        JwtSecurityTokenHandler.DefaultInboundClaimTypeMap.Clear();

        builder.Services.AddControllers();
        var connString = builder.Configuration.GetConnectionString("AzureConnectionString");

        builder.Services.AddIdentity<User, IdentityRole>()
            .AddEntityFrameworkStores<Context>()
            .AddDefaultTokenProviders();
        builder.Services.AddDbContext<Context>(options =>
        {
            options.UseMySql(connString, ServerVersion.AutoDetect(connString));
        });
        builder.Services.AddAuthentication(options =>
        {
            options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
            options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;

        }).AddJwtBearer(options =>
        {
            options.TokenValidationParameters.ValidAudience = builder.Configuration["JWT:ValidAudience"];
            options.TokenValidationParameters.ValidIssuer = builder.Configuration["JWT:ValidIssuer"];
            options.TokenValidationParameters.IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["JWT:Secret"] ?? throw new InvalidOperationException()));

        });
        builder.Services.AddTransient<IJwtTokenService, JwtTokenService>();
        builder.Services.AddTransient<IWishlistRepository, WishlistRepository>();
        builder.Services.AddTransient<IBackgroundImageRepository, BackgroundImageRepository>();
        builder.Services.AddScoped<AuthDbSeeder>();
        builder.Services.AddCors();
        var app = builder.Build();
        app.UseCors(x => x.AllowAnyMethod().AllowAnyHeader().SetIsOriginAllowed(origin => true).AllowCredentials());

        app.UseHttpsRedirection();
        app.MapControllers();
        app.UseAuthentication();
        app.UseAuthorization();
        app.UseStaticFiles();
        app.Services.CreateScope().ServiceProvider.GetRequiredService<AuthDbSeeder>().SeedAsync().Wait();

        app.Run();
    }
}