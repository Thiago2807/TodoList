using Microsoft.AspNetCore.Identity;

namespace WebAPI_TodoList.Infra.Data.Identity;

public class UserCustomEntity : IdentityUser
{
    public string? Name { get; set; }
    public DateTime DtNascimento { get; set; }

}
