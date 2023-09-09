using WebAPI_TodoList.Infra.Data.Identity;
using Microsoft.Extensions.Configuration;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using System.Text;

namespace WebAPI_TodoList.Application.Utility;

public class TokenJWT
{
    private readonly IConfiguration _configuration;
    public TokenJWT(IConfiguration configuration) => _configuration = configuration;

    public string GenerateTokenJWT(UserCustomEntity user)
    {
        string keyToken = _configuration.GetSection("SecretKey:Key").Value ?? string.Empty;
        byte[] key = Encoding.ASCII.GetBytes(keyToken);

        JwtSecurityTokenHandler tokenHandler = new();

        SecurityTokenDescriptor tokenDescription = new()
        {
            Expires = DateTime.Now.AddDays(1),
            SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature),
            Subject = new ClaimsIdentity(new Claim[]
            {
                new Claim(ClaimTypes.NameIdentifier, user.Id),
                new Claim(ClaimTypes.Name, user.Email ?? string.Empty),
                new Claim(ClaimTypes.Surname, user.Name ?? string.Empty),

            })
        };

        JwtSecurityToken token = tokenHandler.CreateJwtSecurityToken(tokenDescription);

        return tokenHandler.WriteToken(token);
    }
}
