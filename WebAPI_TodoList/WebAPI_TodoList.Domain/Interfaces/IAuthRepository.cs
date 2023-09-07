using Microsoft.AspNetCore.Identity;
using WebAPI_TodoList.Infra.Data.Identity;

namespace WebAPI_TodoList.Domain.Interfaces;

public interface IAuthRepository
{
    Task<IdentityResult> AddUserAsync(UserCustomEntity user, string password);
}
