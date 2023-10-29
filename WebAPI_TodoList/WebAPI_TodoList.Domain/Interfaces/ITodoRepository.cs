using WebAPI_TodoList.Domain.Entities;

namespace WebAPI_TodoList.Domain.Interfaces;

public interface ITodoRepository
{
    Task<TodoEntity> AddNewTaskAsync(TodoEntity todo);
}
