using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using persuasiveAPI.Auth.Model;
using persuasiveAPI.Data.Entities;


namespace persuasiveAPI.Data;

public class Context : IdentityDbContext<User>
{
    public Context() {}

    public Context(DbContextOptions<Context> options) : base(options){} 
    public DbSet<Wishlist> Wishlists { get; set; }
}