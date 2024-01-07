namespace WebAPI_TodoList.Application.DTO.Todo;

public sealed class GetItemTodoDTO
{
    public Guid TodoId { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public DateTime dhInicio { get; set; }
}
