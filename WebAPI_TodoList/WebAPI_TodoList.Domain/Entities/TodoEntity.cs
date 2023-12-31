﻿using WebAPI_TodoList.Infra.Data.Identity;
using WebAPI_TodoList.Domain.Enum;

namespace WebAPI_TodoList.Domain.Entities;

public sealed class TodoEntity
{
    public Guid TodoId { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public StatusTodoEnum StatusTodo { get; set; }
    public DateTime DhInicio { get; set; }

    public string UserId { get; set; }
    public UserCustomEntity UserCustom { get; set; }

}
