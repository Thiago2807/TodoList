using WebAPI_TodoList.Infra.IOC;
using WebAPI_TodoList.Application.Mapper;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddApplicationDataContext(builder.Configuration); // Configuration data context

builder.Services.AddConfigurationIdentityFramework(); // Configuration Identity Framework

builder.Services.AddDependencyInjection(); // Add Dependency Injection

builder.Services.AddConfigurationAutoMapper(); // Add Auto Mapper

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
