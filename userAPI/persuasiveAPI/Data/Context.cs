using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using persuasiveAPI.Auth.Model;


namespace persuasiveAPI.Data;

public class Context : IdentityDbContext<User>
{
    public Context() {}

    public Context(DbContextOptions<Context> options) : base(options)
    {
    }
}