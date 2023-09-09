using System.ComponentModel.DataAnnotations;

namespace WebAPI_TodoList.Application.DTO.Auth;

public sealed class AuthInputUserDTO
{
    public AuthInputUserDTO()
    {
        Email = string.Empty;
        Password = string.Empty;
    }

    [EmailAddress]
    public string Email { get; set; }
    public string Password { get; set; }
}
