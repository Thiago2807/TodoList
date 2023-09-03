using WebAPI_TodoList.Application.DTO.Auth;

namespace WebAPI_TodoList.Application.Interfaces;

public interface IAuthServices
{
    Task<RegisterOutputUser> AddNewUserAsync(RegisterInputUser user);
}
