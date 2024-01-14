using static WebAPI_TodoList.Domain.Exceptions.CustomExceptions;
using WebAPI_TodoList.Infra.Data.DataContext;
using WebAPI_TodoList.Infra.Data.Identity;
using WebAPI_TodoList.Domain.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace WebAPI_TodoList.Infra.Data.Repository;

public class AuthRepository : IAuthRepository
{
    private readonly ApplicationDataContext _context;
    private readonly UserManager<UserCustomEntity> _userManager;
    private readonly SignInManager<UserCustomEntity> _signInManager;

    public AuthRepository(ApplicationDataContext context, UserManager<UserCustomEntity> userManager, SignInManager<UserCustomEntity> signInManager)
    {
        _context = context;
        _userManager = userManager;
        _signInManager = signInManager;
    }

    public async Task<IdentityResult> AddUserAsync(UserCustomEntity user, string password) => await _userManager.CreateAsync(user, password);

    public async Task<UserCustomEntity> AuthUserAsync(string email, string password)
    {
        UserCustomEntity? user = await _context.Users.FirstOrDefaultAsync(x => x.Email == email) 
            ?? throw new NotFoundException("Não foi possível encontrar o usuário especificado, verifique e tente novamente.");

        SignInResult result =  await _signInManager.PasswordSignInAsync(user, password, false, true);

        if (result.Succeeded)
            return user;
        else
            throw new BadRequestException("Ocorreu um erro no momento de realizar o login.");
    }

    public async Task<UserCustomEntity?> GetUserByEmailAsync(string email) 
        => await _context.Users.AsNoTracking().FirstOrDefaultAsync(x => x.Email == email);

}
