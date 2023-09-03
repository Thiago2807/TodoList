using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using WebAPI_TodoList.Infra.Data.Identity;

namespace WebAPI_TodoList.Infra.Data;

public class ApplicationDataContext : IdentityDbContext<UserCustomEntity, IdentityRole, string>
{
    public ApplicationDataContext(DbContextOptions<ApplicationDataContext> options) : base (options) { }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);

        builder.ApplyConfigurationsFromAssembly(typeof(ApplicationDataContext).Assembly);
    }

}
