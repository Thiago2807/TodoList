using WebAPI_TodoList.Application.Interfaces;
using WebAPI_TodoList.Application.DTO.Auth;
using WebAPI_TodoList.Infra.Data.Identity;
using WebAPI_TodoList.Application.Utility;
using Microsoft.Extensions.Configuration;
using WebAPI_TodoList.Domain.Exceptions;
using WebAPI_TodoList.Domain.Interfaces;
using Microsoft.AspNetCore.Identity;
using AutoMapper;

namespace WebAPI_TodoList.Application.Services;

public class AuthServices : IAuthServices
{
    private readonly IMapper _mapper;
    private readonly IAuthRepository _authRepository;
    private readonly IConfiguration _configuration;

    public AuthServices(IConfiguration configuration, IAuthRepository authRepository, IMapper mapper)
    {
        _mapper = mapper;
        _configuration = configuration;
        _authRepository = authRepository;
    }

    public async Task<RegisterOutputUserDTO> AddNewUserAsync(RegisterInputUserDTO user)
    {
        if (string.IsNullOrEmpty(user.Password))
            throw new ArgumentNullException($"{nameof(user.Password)} inválido.");

        UserCustomEntity userEntity = _mapper.Map<UserCustomEntity>(user);
        userEntity.UserName = user.Email;
        userEntity.Name = user.Surname;

        IdentityResult responseServer = await _authRepository.AddUserAsync(userEntity, user.Password);

        if (!responseServer.Succeeded)
            throw new AuthCustomExceptions(responseServer.Errors.First().Description);

        return _mapper.Map<RegisterOutputUserDTO>(userEntity);
    }

    public async Task<AuthOutputUserDTO> AuthUserAsync(AuthInputUserDTO cred)
    {
         UserCustomEntity user = await _authRepository.AuthUserAsync(cred.Email, cred.Password);

        AuthOutputUserDTO authOutput = _mapper.Map<AuthOutputUserDTO>(user);

        authOutput.Token = new TokenJWT(_configuration).GenerateTokenJWT(user);

        return authOutput;
    }

}
