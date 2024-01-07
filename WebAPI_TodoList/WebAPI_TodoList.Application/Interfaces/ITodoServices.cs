using WebAPI_TodoList.Application.DTO.Todo;
using WebAPI_TodoList.Domain.Enum;

namespace WebAPI_TodoList.Application.Interfaces;

public interface ITodoServices
{
    Task DeleteTodoAsync(Guid id);
    Task UpdateTaskAsync(TodoDTO todo);
    Task<GetItemTodoDTO?> GetLastItemTodo(string userId);
    Task<AddNewTaskDTO> AddNewTaskAsync(AddNewTaskDTO todo);
    Task<IEnumerable<TodoDTO>> GetListTodo(string userId, StatusTodoEnum? status);
}
