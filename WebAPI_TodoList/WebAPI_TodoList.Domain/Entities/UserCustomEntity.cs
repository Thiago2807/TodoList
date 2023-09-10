using Microsoft.AspNetCore.Identity;
using WebAPI_TodoList.Domain.Entities;

namespace WebAPI_TodoList.Infra.Data.Identity;

public sealed class UserCustomEntity : IdentityUser
{
    public string? Name { get; set; }
    public DateTime DtNascimento { get; set; }

    public List<Todo> Todos { get; set; }

}
