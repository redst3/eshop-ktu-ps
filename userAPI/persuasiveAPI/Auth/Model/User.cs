using Microsoft.AspNetCore.Identity;

namespace persuasiveAPI.Auth.Model;

public class User : IdentityUser
{
    public string? Address { get; set; }
    public string? City { get; set; }
    public string? Country { get; set; }
    public string? PostalCode { get; set; }
}