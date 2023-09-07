using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebAPI_TodoList.Application.DTO.Auth;
using WebAPI_TodoList.Application.Interfaces;
using WebAPI_TodoList.HandleCustomException;

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
    public async Task<IActionResult> AddNewUserAsync([FromBody] RegisterInputUser user)
    {
		try
		{
			RegisterOutputUser responseServer = await _authServices.AddNewUserAsync(user);

			return StatusCode(201, responseServer);
		}
		catch (Exception ex)
		{
            return new HandleDefaultException().HandleDefault(ex.Message);
        }
    }
}
