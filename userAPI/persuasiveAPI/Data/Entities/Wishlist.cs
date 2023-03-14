using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace persuasiveAPI.Data.Entities;


public class Wishlist
{
    public int Id { get; set; }
    public string? ProductIds { get; set; }
    [Required]
    public string? UserId { get; set; }
    
}