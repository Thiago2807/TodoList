using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using WebAPI_TodoList.Infra.Data.DataContext;

namespace WebAPI_TodoList.Infra.IOC;

public static class ConfigurationTokenJWT
{

    public static IServiceCollection AddJWTBearerToken(this IServiceCollection services, IConfiguration configuration)
    {
        string? keyToken = configuration.GetSection("SecretKey:Key").Value;

        byte[] key = Encoding.ASCII.GetBytes(keyToken ?? string.Empty);

        services.AddAuthentication(auth =>
        {
            auth.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
            auth.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
        }).AddJwtBearer(x =>
        {
            x.RequireHttpsMetadata = false;
            x.SaveToken = true;
            x.TokenValidationParameters = new()
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(key),
                ValidateIssuer = true,
                ValidateAudience = false
            };
        });

        return services;
    }

}
