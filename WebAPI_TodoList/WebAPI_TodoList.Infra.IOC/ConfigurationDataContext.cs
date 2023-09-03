using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;
using WebAPI_TodoList.Infra.Data;

namespace WebAPI_TodoList.Infra.IOC;

public static class ConfigurationDataContext
{
    public static IServiceCollection AddApplicationDataContext(this IServiceCollection services, IConfiguration configuration)
    {
        string? connectionString = configuration.GetConnectionString("DefaultConnection");

        if (string.IsNullOrEmpty(connectionString))
            throw new ArgumentException("Connection string is null.");

        services.AddDbContext<ApplicationDataContext>((options) => options.UseSqlServer(connectionString,
                b => b.MigrationsAssembly(typeof(ApplicationDataContext).Assembly.FullName)));

        return services;
    }
}
