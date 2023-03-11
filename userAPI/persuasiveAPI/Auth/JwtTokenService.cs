using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace persuasiveAPI.Auth;

public interface IJwtTokenService
{
    string CreateAccessToken(string userName, string userID, IEnumerable<string> userRoles);
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

    public string CreateAccessToken(string userName, string userId, IEnumerable<string> userRoles)
    {
        var authClaims = new List<Claim>
        {
            new (ClaimTypes.Name, userName),
            new (JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            new (JwtRegisteredClaimNames.Sub, userId)
        };

        authClaims.AddRange(userRoles.Select(userRole => new Claim(ClaimTypes.Role, userRole)));

        var accessToken = new JwtSecurityToken
        (
            issuer: _issuer,
            audience: _audience,
            expires: DateTime.UtcNow.AddHours(5), // TODO: Fix this to be shorter after jwt update is done
            claims: authClaims,
            signingCredentials: new SigningCredentials(_authKey, SecurityAlgorithms.HmacSha256)
        );
        return new JwtSecurityTokenHandler().WriteToken(accessToken);
    }
}