using Microsoft.Extensions.DependencyInjection;
using WebAPI_TodoList.Application.Mapper.MapperProfile;

namespace WebAPI_TodoList.Application.Mapper;

public static class ConfigurationAutoMapper
{
    public static IServiceCollection AddConfigurationAutoMapper(this IServiceCollection services)
    {
        services.AddAutoMapper(typeof(AuthProfile));
        services.AddAutoMapper(typeof(TodoProfile));

        return services;
    }
}
