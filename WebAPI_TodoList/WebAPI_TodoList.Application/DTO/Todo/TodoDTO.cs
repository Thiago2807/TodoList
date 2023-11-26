using WebAPI_TodoList.Domain.Enum;

namespace WebAPI_TodoList.Application.DTO.Todo;

public sealed class TodoDTO
{
    public Guid TodoId { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public StatusTodoEnum StatusTodo { get; set; }
    public DateTime DhInicio { get; set; }
}
