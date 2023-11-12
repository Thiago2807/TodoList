using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using System.Text;


namespace WebAPI_TodoList.Infra.IOC;

public static class ConfigurationTokenJWT
{

    public static IServiceCollection AddJWTBearerToken(this IServiceCollection services, IConfiguration configuration)
    {
        string keyToken = configuration.GetSection("JWT:SecretKey").Value ?? throw new Exception("Não foi possível recuperar a chave de segurança.");
        string issuer = configuration.GetSection("JWT:Issuer").Value ?? throw new Exception("Não foi possível recuperar o emissor do token.");

        byte[] key = Encoding.ASCII.GetBytes(keyToken ?? string.Empty);

        services.AddAuthentication(auth =>
        {
            auth.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
            auth.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
        }).AddJwtBearer(x =>
        {
            x.SaveToken = true;
            x.RequireHttpsMetadata = false;
            x.TokenValidationParameters = new()
            {
                ValidIssuer = issuer,
                ValidateIssuer = true,
                ValidateAudience = false,
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(key)
            };
        });

        return services;
    }

}
