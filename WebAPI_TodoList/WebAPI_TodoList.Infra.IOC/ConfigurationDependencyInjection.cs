using Microsoft.Extensions.DependencyInjection;
using WebAPI_TodoList.Infra.Data.Repository;
using WebAPI_TodoList.Domain.Interfaces;
using WebAPI_TodoList.Application.Interfaces;
using WebAPI_TodoList.Application.Services;

namespace WebAPI_TodoList.Infra.IOC;

public static class ConfigurationDependencyInjection
{
    public static IServiceCollection AddDependencyInjection(this IServiceCollection services)
    {
        #region Repository
        services.AddScoped<IAuthRepository, AuthRepository>();
        services.AddScoped<ITodoRepository, TodoRepository>();
        #endregion

        #region Application
        services.AddScoped<IAuthServices, AuthServices>();
        services.AddScoped<ITodoServices, TodoServices>();
        #endregion

        return services;
    }
}
