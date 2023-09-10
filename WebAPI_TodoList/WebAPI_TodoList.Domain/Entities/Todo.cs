using WebAPI_TodoList.Infra.Data.Identity;
using WebAPI_TodoList.Domain.Enum;

namespace WebAPI_TodoList.Domain.Entities;

public sealed class Todo
{
    public Guid TodoId { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public DateTime DtTodoFinal { get; set; }
    public DateTime DtTodoInitial { get; set; }
    public StatusTodoEnum StatusTodo { get; set; }

    public string UserId { get; set; }
    public UserCustomEntity UserCustom { get; set; }

}
