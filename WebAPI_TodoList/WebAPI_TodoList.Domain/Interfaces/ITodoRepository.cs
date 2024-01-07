using WebAPI_TodoList.Domain.Entities;
using WebAPI_TodoList.Domain.Enum;

namespace WebAPI_TodoList.Domain.Interfaces;

public interface ITodoRepository
{
    Task<TodoEntity> GetTodoByIdAsync(Guid id);
    Task<bool> DeleteTodoAsync(TodoEntity todo);
    Task<TodoEntity?> GetTodoByUser(string userId);
    Task<TodoEntity> AddNewTaskAsync(TodoEntity todo);
    Task<IEnumerable<TodoEntity>> GetTodoListByUser(string userId, StatusTodoEnum? status);
}
