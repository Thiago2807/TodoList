using System.ComponentModel.DataAnnotations;

namespace WebAPI_TodoList.Application.DTO.Auth;

public class RegisterInputUserDTO
{
    [EmailAddress(ErrorMessage = "E-mail inválido.")]
    public string? Email { get; set; }
    public string? Surname { get; set; }
    public string? Password { get; set; }
}
