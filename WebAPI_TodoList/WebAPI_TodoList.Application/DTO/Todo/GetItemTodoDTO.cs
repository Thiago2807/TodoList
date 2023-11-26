namespace WebAPI_TodoList.Application.DTO.Todo;

public sealed class GetItemTodoDTO
{
    public string Title { get; set; }
    public string Description { get; set; }
    public DateTime DhInitial { get; set; }
}
