using System.ComponentModel.DataAnnotations;

namespace persuasiveAPI.Auth.Dtos;


public record RegisterUserDto([Required] string UserName, [EmailAddress][Required] string Email, [Required] string Password);

public record LoginUserDto(string UserName, string Password);

public record UserDto(string Id, string UserName, string Email);

public record SuccessfulLoginDto(string accessToken); 

public record UpdateShippingAddressDto(string Country, string City, string Address, string PostalCode);