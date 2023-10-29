using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebAPI_TodoList.Application.DTO.Todo;
using WebAPI_TodoList.Application.Interfaces;
using WebAPI_TodoList.Application.Utility;
using WebAPI_TodoList.HandleCustomException;

namespace WebAPI_TodoList.Controllers;


[Authorize]
[ApiController]
[Route("v1/[controller]/[action]")]
public class TodoController : ControllerBase
{
    private readonly ITodoServices _todoServices;
    public TodoController(ITodoServices todoServices) => _todoServices = todoServices;

    [HttpPost]
    public async Task<IActionResult> AddNewTaskAsync([FromBody] AddNewTaskDTO todo)
    {
		try
		{
            string headerRequest = Request.Headers.Authorization.FirstOrDefault() ?? throw new Exception("Não foi possível obter o código do usuário, tente novamente mais tarde.");
            todo.UserId = TokenJWT.GetTokenClaims(headerRequest.Replace("Bearer ", ""))["nameid"];

            AddNewTaskDTO newTask = await _todoServices.AddNewTaskAsync(todo);

            return StatusCode(201, newTask);

        }
		catch (Exception ex) 
		{
            return new HandleDefaultException().HandleDefault(ex.Message);
        }
    }

    [HttpGet]
    public async Task<IActionResult> GetListTaskAsync()
    {
        try
        {
            string headerRequest = Request.Headers.Authorization.FirstOrDefault() ?? throw new Exception("Não foi possível obter o código do usuário, tente novamente mais tarde.");
            string userId = TokenJWT.GetTokenClaims(headerRequest.Replace("Bearer ", ""))["nameid"];

            IEnumerable<TodoDTO> listTodos = await _todoServices.GetListTodo(userId: userId);

            return Ok(listTodos);

        }
        catch (Exception ex)
        {
            return new HandleDefaultException().HandleDefault(ex.Message);
        }
    }

}
