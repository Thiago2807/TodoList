using WebAPI_TodoList.Infra.Data.Identity;
using Microsoft.AspNetCore.Identity;

namespace WebAPI_TodoList.Domain.Interfaces;

public interface IAuthRepository
{
    Task<UserCustomEntity?> GetUserByEmailAsync(string email);
    Task<UserCustomEntity> AuthUserAsync(string email, string password);
    Task<IdentityResult> AddUserAsync(UserCustomEntity user, string password);
}
