using WebAPI_TodoList.Application.Interfaces;
using WebAPI_TodoList.HandleCustomException;
using WebAPI_TodoList.Application.DTO.Auth;
using Microsoft.AspNetCore.Authorization;
using WebAPI_TodoList.Domain.Exceptions;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI_TodoList.Controllers;

[ApiController]
[Route("v1/[controller]/[action]")]
public class AuthController : ControllerBase
{
	private readonly IAuthServices _authServices;
    public AuthController(IAuthServices authServices)
		=> _authServices = authServices;

    [HttpPost]
    [AllowAnonymous]
    public async Task<IActionResult> AddNewUserAsync([FromBody] RegisterInputUserDTO user)
    {
		try
		{
			RegisterOutputUserDTO responseServer = await _authServices.AddNewUserAsync(user);

			return StatusCode(201, responseServer);
		}
		catch (Exception ex)
		{
            return new HandleDefaultException().HandleDefault(ex.Message);
        }
    }

	[HttpPost]
	[AllowAnonymous]
	public async Task<IActionResult> AuthUserAsync([FromBody] AuthInputUserDTO cred)
	{
        try
        {
            AuthOutputUserDTO responseServer = await _authServices.AuthUserAsync(cred);

            return Ok(responseServer);
        }
        catch (AuthNotFoundExceptions ex)
        {
            return new HandleNotFoundException().HandleNotFound(ex.Message);
        }
        catch (Exception ex)
        {
            return new HandleDefaultException().HandleDefault(ex.Message);
        }
    }

}
