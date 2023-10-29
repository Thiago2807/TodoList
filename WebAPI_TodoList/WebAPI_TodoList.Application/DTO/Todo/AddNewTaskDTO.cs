using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using WebAPI_TodoList.Domain.Enum;

namespace WebAPI_TodoList.Application.DTO.Todo;

public class AddNewTaskDTO
{
    public Guid? TodoId { get; set; }

    [Required, MaxLength(50)]
    public string Title { get; set; }

    [Required, MaxLength(150)]
    public string Description { get; set; }

    [Required]
    public StatusTodoEnum StatusTodo { get; set; }

    [JsonIgnore]
    public string? UserId { get; set; }

}
