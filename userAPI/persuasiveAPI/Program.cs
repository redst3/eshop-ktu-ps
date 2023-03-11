using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore; 
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using persuasiveAPI.Auth;
using persuasiveAPI.Auth.Model;
using persuasiveAPI.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
var connString = builder.Configuration.GetConnectionString("DefaultConnection");

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
builder.Services.AddScoped<AuthDbSeeder>();
var app = builder.Build();


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.MapControllers();
app.UseAuthorization();
app.UseAuthentication();
app.Services.CreateScope().ServiceProvider.GetRequiredService<AuthDbSeeder>().SeedAsync().Wait();

app.Run();