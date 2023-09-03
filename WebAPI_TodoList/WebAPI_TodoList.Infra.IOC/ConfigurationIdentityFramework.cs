using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using WebAPI_TodoList.Infra.Data;
using WebAPI_TodoList.Infra.Data.Identity;

namespace WebAPI_TodoList.Infra.IOC;

public static class ConfigurationIdentityFramework
{
    public static IServiceCollection AddConfigurationIdentityFramework(this IServiceCollection services)
    {
        services.AddIdentity<UserCustomEntity, IdentityRole>()
            .AddEntityFrameworkStores<ApplicationDataContext>()
            .AddDefaultTokenProviders();
        //.AddErrorDescriber<CustomIdentityErrorDescriber>()

        return services;
    }
}
