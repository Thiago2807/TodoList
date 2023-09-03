using AutoMapper;
using WebAPI_TodoList.Application.DTO.Auth;
using WebAPI_TodoList.Application.Interfaces;
using WebAPI_TodoList.Domain.Interfaces;
using WebAPI_TodoList.Infra.Data.Identity;

namespace WebAPI_TodoList.Application.Services;

public class AuthServices : IAuthServices
{
    private readonly IMapper _mapper;
    private readonly IAuthRepository _authRepository;

    public AuthServices(IAuthRepository authRepository, IMapper mapper)
    {
        _mapper = mapper;
        _authRepository = authRepository;
    }

    public async Task<RegisterOutputUser> AddNewUserAsync(RegisterInputUser user)
    {
        if (string.IsNullOrEmpty(user.Password))
            throw new ArgumentNullException($"{nameof(user.Password)} inválido.");

        UserCustomEntity userEntity = _mapper.Map<UserCustomEntity>(user);
        userEntity.UserName = user.Email;
        userEntity.Name = user.Surname;

        userEntity = await _authRepository.AddUserAsync(userEntity, user.Password);

        return _mapper.Map<RegisterOutputUser>(userEntity);
    }

}
