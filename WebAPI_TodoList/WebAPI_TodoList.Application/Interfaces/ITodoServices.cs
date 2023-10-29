using WebAPI_TodoList.Application.DTO.Todo;

namespace WebAPI_TodoList.Application.Interfaces;

public interface ITodoServices
{
    Task<AddNewTaskDTO> AddNewTaskAsync(AddNewTaskDTO todo);
}
