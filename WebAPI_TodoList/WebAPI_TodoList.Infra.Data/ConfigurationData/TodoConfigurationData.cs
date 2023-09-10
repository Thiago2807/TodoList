using Microsoft.EntityFrameworkCore.Metadata.Builders;
using WebAPI_TodoList.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace WebAPI_TodoList.Infra.Data.ConfigurationData;

public class TodoConfigurationData : IEntityTypeConfiguration<Todo>
{
    public void Configure(EntityTypeBuilder<Todo> builder)
    {
        builder.HasKey(pk => pk.TodoId);

        builder.Property(prop => prop.Title)
            .HasColumnType("VARCHAR(100)")
            .IsRequired();

        builder.Property(prop => prop.Description)
            .HasColumnType("VARCHAR(250)")
            .IsRequired();

        builder.Property(prop => prop.StatusTodo)
            .HasColumnType("INT")
            .IsRequired();

        builder.Property(prop => prop.DtTodoInitial)
            .IsRequired();

        builder.Property(prop => prop.DtTodoFinal)
            .IsRequired();

        builder.HasIndex(x => x.DtTodoInitial)
            .IsClustered(false)
            .IsUnique(false);

        builder.HasIndex(x => x.DtTodoFinal)
            .IsClustered(false)
            .IsUnique(false);

    }
}
