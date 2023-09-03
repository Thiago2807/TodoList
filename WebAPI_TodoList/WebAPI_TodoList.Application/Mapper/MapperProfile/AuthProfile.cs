using AutoMapper;
using WebAPI_TodoList.Application.DTO.Auth;
using WebAPI_TodoList.Infra.Data.Identity;

namespace WebAPI_TodoList.Application.Mapper.MapperProfile;

public class AuthProfile : Profile
{
    public AuthProfile()
    {
        CreateMap<RegisterInputUser, UserCustomEntity>()
            .ReverseMap()
            .ForMember(x => x.Email, map => map.MapFrom(src => src.Email))
            .ForMember(x => x.Surname, map => map.MapFrom(src => src.Name));


        CreateMap<RegisterOutputUser, UserCustomEntity>()
            .ReverseMap()
            .ForMember(x => x.UserId, map => map.MapFrom(src => src.Id))
            .ForMember(x => x.Email, map => map.MapFrom(src => src.Email))
            .ForMember(x => x.UserName, map => map.MapFrom(src => src.UserName));
    }
}
