﻿using WebAPI_TodoList.Application.Interfaces;
using WebAPI_TodoList.Application.DTO.Todo;
using WebAPI_TodoList.Domain.Interfaces;
using WebAPI_TodoList.Domain.Entities;
using WebAPI_TodoList.Domain.Enum;
using AutoMapper;
using static WebAPI_TodoList.Domain.Exceptions.CustomExceptions;

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

    public async Task DeleteTodoAsync(Guid id)
    {
        TodoEntity todo = await _todoRepository.GetTodoByIdAsync(id);

        bool responseDelete = await _todoRepository.DeleteTodoAsync(todo);

        if (!responseDelete)
            throw new InternetServerErrorException("Não foi possível remover a tarefa, tente novamente mais tarde.");
    }

    public async Task UpdateTaskAsync(TodoDTO todo)
    {
        TodoEntity entity = await _todoRepository.GetTodoByIdAsync(todo.TodoId);

        entity.Title = todo.Title;
        entity.DhInicio = todo.DhInicio;
        entity.StatusTodo = todo.StatusTodo;
        entity.Description = todo.Description;

        bool responseServer = await _todoRepository.UpdateTaskAsync(entity);

        if (!responseServer)
            throw new InternetServerErrorException("Não foi possível atualizar o tarefa, tente novamente mais tarde.");
    }

}
