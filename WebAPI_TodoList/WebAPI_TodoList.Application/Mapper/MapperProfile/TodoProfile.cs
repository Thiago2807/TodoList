﻿using WebAPI_TodoList.Application.DTO.Todo;
using WebAPI_TodoList.Domain.Entities;
using AutoMapper;

namespace WebAPI_TodoList.Application.Mapper.MapperProfile;

public class TodoProfile : Profile
{
    public TodoProfile()
    {
        CreateMap<AddNewTaskDTO, TodoEntity>()
            .ReverseMap();
    }
}
