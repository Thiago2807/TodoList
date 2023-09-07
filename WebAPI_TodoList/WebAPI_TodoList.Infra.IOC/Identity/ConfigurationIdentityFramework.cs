using Microsoft.Extensions.DependencyInjection;
using WebAPI_TodoList.Infra.Data.DataContext;
using WebAPI_TodoList.Infra.Data.Identity;
using Microsoft.AspNetCore.Identity;

namespace WebAPI_TodoList.Infra.IOC.Identity;

public static class ConfigurationIdentityFramework
{
    public static IServiceCollection AddConfigurationIdentityFramework(this IServiceCollection services)
    {
        services.AddIdentity<UserCustomEntity, IdentityRole>(options =>
        {
            options.Password.RequireNonAlphanumeric = false;
            options.Password.RequireLowercase = true;
            options.Password.RequireUppercase = true;
            options.Password.RequireDigit = true;
            options.Password.RequiredLength = 2;

        }).AddEntityFrameworkStores<ApplicationDataContext>()
            .AddErrorDescriber<ErrorConfigurationIdentity>()
            .AddDefaultTokenProviders();

        return services;
    }
}
