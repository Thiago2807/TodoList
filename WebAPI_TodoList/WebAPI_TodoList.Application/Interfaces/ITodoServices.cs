using WebAPI_TodoList.Application.DTO.Todo;
using WebAPI_TodoList.Domain.Enum;

namespace WebAPI_TodoList.Application.Interfaces;

public interface ITodoServices
{
    Task<IEnumerable<TodoDTO>> GetListTodo(string userId, StatusTodoEnum? status);
    Task<AddNewTaskDTO> AddNewTaskAsync(AddNewTaskDTO todo);
}
