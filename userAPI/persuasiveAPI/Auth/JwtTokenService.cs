using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace persuasiveAPI.Auth;

public interface IJwtTokenService
{
    string CreateAccessToken(string userName, string userID, IEnumerable<string> userRoles, string Email, string shippingAddress);
    bool CheckAccessTokenWithUserId(string token, string userId);
}

public class JwtTokenService : IJwtTokenService
{
    private string _audience;
    private string _issuer;
    private SymmetricSecurityKey _authKey;

    public JwtTokenService(IConfiguration configuration)
    {
        _authKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["JWT:Secret"]));
        _issuer = configuration["JWT:ValidIssuer"];
        _audience = configuration["JWT:ValidAudience"];
    }

    public string CreateAccessToken(string userName, string userId, IEnumerable<string> userRoles, string Email, string shippingAddress)
    {
        var authClaims = new List<Claim>
        {
            new (ClaimTypes.Name, userName),
            new (JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            new (JwtRegisteredClaimNames.Sub, userId),
            new ("email", Email),
            new ("shipping-address", shippingAddress)
        };

        authClaims.AddRange(userRoles.Select(userRole => new Claim(ClaimTypes.Role, userRole)));

        var accessToken = new JwtSecurityToken
        (
            issuer: _issuer,
            audience: _audience,
            expires: DateTime.UtcNow.AddHours(3),
            claims: authClaims,
            signingCredentials: new SigningCredentials(_authKey, SecurityAlgorithms.HmacSha256)
        );
        return new JwtSecurityTokenHandler().WriteToken(accessToken);
    }
    public bool CheckAccessTokenWithUserId(string token, string userId){
        var readtoken = new JwtSecurityTokenHandler().ReadJwtToken(token);
        var userIdFromToken = readtoken.Claims.First(x => x.Type == "sub").Value;
        if(userIdFromToken != userId)
            return false;
        return true;
    }
}