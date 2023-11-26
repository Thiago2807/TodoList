using WebAPI_TodoList.Application.Interfaces;
using WebAPI_TodoList.Application.DTO.Todo;
using WebAPI_TodoList.Domain.Interfaces;
using WebAPI_TodoList.Domain.Entities;
using WebAPI_TodoList.Domain.Enum;
using AutoMapper;

namespace WebAPI_TodoList.Application.Services;

public class TodoServices : ITodoServices
{
    private readonly IMapper _mapper;
    private readonly ITodoRepository _todoRepository;
    public TodoServices(ITodoRepository todoRepository, IMapper mapper)
    {
        _mapper = mapper;
        _todoRepository = todoRepository;
    }

    public async Task<AddNewTaskDTO> AddNewTaskAsync(AddNewTaskDTO todo)
    {

        TodoEntity newTodo = await _todoRepository.AddNewTaskAsync(_mapper.Map<TodoEntity>(todo));

        return _mapper.Map<AddNewTaskDTO>(newTodo);
    }

    public async Task<IEnumerable<TodoDTO>> GetListTodo(string userId, StatusTodoEnum? status)
        => _mapper.Map<IEnumerable<TodoDTO>>(await _todoRepository.GetTodoListByUser(userId, status));


    public async Task<GetItemTodoDTO?> GetLastItemTodo(string userId)
        => _mapper.Map<GetItemTodoDTO>(await _todoRepository.GetTodoByUser(userId));

}
