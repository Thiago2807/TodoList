using WebAPI_TodoList.Infra.Data.Identity;
using WebAPI_TodoList.Domain.Interfaces;
using Microsoft.AspNetCore.Identity;

namespace WebAPI_TodoList.Infra.Data.Repository;

public class AuthRepository : IAuthRepository
{
    private readonly SignInManager<UserCustomEntity> _signInManager;
    private readonly UserManager<UserCustomEntity> _userManager;
    public AuthRepository(UserManager<UserCustomEntity> userManager, SignInManager<UserCustomEntity> signInManager)
    {
        _userManager = userManager;
        _signInManager = signInManager;

    }

    public async Task<UserCustomEntity> AddUserAsync(UserCustomEntity user, string password)
    {
        await _userManager.CreateAsync(user, password);

        return user;
    }

}
