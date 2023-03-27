using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace persuasiveAPI.Data.Entities;


public class BackgroundImage
{
    [Key]
    public string UserId { get; set; }
    public string? ImageUrl { get; set; }
    public double px_to_cm { get; set; }
    
}