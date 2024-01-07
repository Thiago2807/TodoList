using WebAPI_TodoList.Infra.Data.DataContext;
using WebAPI_TodoList.Domain.Interfaces;
using WebAPI_TodoList.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using WebAPI_TodoList.Domain.Enum;

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

    public async Task<IEnumerable<TodoEntity>> GetTodoListByUser(string userId, StatusTodoEnum? status)
    {
        IQueryable<TodoEntity> query = _context.Tasks.AsNoTracking().Where(x => x.UserId == userId);

        if (status.HasValue)
            query = query.Where(x => x.StatusTodo == status);

        return await query.ToListAsync();
    }

    public async Task<TodoEntity?> GetTodoByUser(string userId)
        => await _context.Tasks.AsNoTracking().OrderBy(x => x.DhInicio).FirstOrDefaultAsync(x => x.UserId == userId);

    public async Task<TodoEntity> GetTodoByIdAsync(Guid id)
        => await _context.Tasks.FirstOrDefaultAsync(x => x.TodoId == id)
            ?? throw new Exception("Não foi possível localizar a tarefa especificada.");

    public async Task<bool> DeleteTodoAsync(TodoEntity todo)
    {
        _context.Tasks.Remove(todo);

        return await _context.SaveChangesAsync() > 0;
    }

    public async Task<bool> UpdateTaskAsync(TodoEntity todo)
    {
        _context.Tasks.Update(todo);

        return await _context.SaveChangesAsync() > 0;
    }

}
