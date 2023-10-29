﻿using WebAPI_TodoList.Infra.Data.DataContext;
using WebAPI_TodoList.Domain.Interfaces;
using WebAPI_TodoList.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace WebAPI_TodoList.Infra.Data.Repository;

public class TodoRepository : ITodoRepository
{
    private readonly ApplicationDataContext _context;
    public TodoRepository(ApplicationDataContext context) => _context = context;

    public async Task<TodoEntity> AddNewTaskAsync(TodoEntity todo)
    {
        await _context.Tasks.AddAsync(todo);
        await _context.SaveChangesAsync();

        return todo;
    }

    public async Task<IEnumerable<TodoEntity>> GetTodoListByUser(string userId)
        => await _context.Tasks.AsNoTracking().Where(x => x.UserId == userId).ToListAsync();

}