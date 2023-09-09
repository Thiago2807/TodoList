using Microsoft.AspNetCore.Mvc;
using WebAPI_TodoList.Application.DTO;

namespace WebAPI_TodoList.HandleCustomException;

public class HandleDefaultException : ControllerBase
{
    public IActionResult HandleDefault(string message) => BadRequest(new ResponseServerErrorDTO()
    {
        CodError = 1,
        DescError = message
    });
}

public class HandleNotFoundException : ControllerBase
{
    public IActionResult HandleNotFound(string message) => NotFound(new ResponseServerErrorDTO()
    {
        CodError = 1,
        DescError = message
    });
}
