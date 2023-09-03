using WebAPI_TodoList.Infra.Data.Identity;

namespace WebAPI_TodoList.Domain.Interfaces;

public interface IAuthRepository
{
    Task<UserCustomEntity> AddUserAsync(UserCustomEntity user, string password);
}
