using WebAPI_TodoList.Application.DTO.Auth;

namespace WebAPI_TodoList.Application.Interfaces;

public interface IAuthServices
{
    Task<AuthOutputUserDTO> AuthUserAsync(AuthInputUserDTO cred);
    Task<RegisterOutputUserDTO> AddNewUserAsync(RegisterInputUserDTO user);
}
