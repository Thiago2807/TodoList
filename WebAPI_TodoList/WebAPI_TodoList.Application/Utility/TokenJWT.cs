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
        string keyToken = _configuration.GetSection("JWT:SecretKey").Value ?? throw new Exception("Não foi possível recuperar a chave de segurança.");
        string issuer = _configuration.GetSection("JWT:Issuer").Value ?? throw new Exception("Não foi possível recuperar o emissor do token.");

        byte[] key = Encoding.ASCII.GetBytes(keyToken);

        JwtSecurityTokenHandler tokenHandler = new();

        SecurityTokenDescriptor tokenDescription = new()
        {
            Issuer = issuer,
            Expires = DateTime.Now.AddHours(8),
            Subject = new ClaimsIdentity(new Claim[]
            {
                new Claim(ClaimTypes.NameIdentifier, user.Id),
                new Claim(ClaimTypes.Name, user.Email ?? string.Empty),
                new Claim(ClaimTypes.Surname, user.Name ?? string.Empty),

            }),
            SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature),
        };

        JwtSecurityToken token = tokenHandler.CreateJwtSecurityToken(tokenDescription);

        return tokenHandler.WriteToken(token);
    }

    public static IDictionary<string, string> GetTokenClaims(string token)
    {
        var handler = new JwtSecurityTokenHandler();
        var jwtToken = handler.ReadJwtToken(token);
        var claims = new Dictionary<string, string>();

        foreach (var claim in jwtToken.Claims)
        {
            claims.Add(claim.Type, claim.Value);
        }

        return claims;
    }

}
