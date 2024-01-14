using static WebAPI_TodoList.Domain.Exceptions.CustomExceptions;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Builder;
using System.Net;

namespace WebAPI_TodoList.Infra.IOC;

public static class MiddlewareException
{
    public static IApplicationBuilder AddMiddlewareException(this IApplicationBuilder app)
    {
        return app.UseExceptionHandler(builder =>
        {
            builder.Run(async context =>
            {
                context.Response.ContentType = "application/json";
                context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;

                IExceptionHandlerFeature? error = context.Features.Get<IExceptionHandlerFeature>();

                if (error != null)
                {
                    if (error.Error is BadRequestException)
                        context.Response.StatusCode = (int)HttpStatusCode.BadRequest;

                    if (error.Error is NotFoundException)
                        context.Response.StatusCode = (int)HttpStatusCode.NotFound;

                    if (error.Error is InternetServerErrorException)
                        context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;

                }
            });
        });
    }
}
