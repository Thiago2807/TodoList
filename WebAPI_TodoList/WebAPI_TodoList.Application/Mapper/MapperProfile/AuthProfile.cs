using AutoMapper;
using WebAPI_TodoList.Application.DTO.Auth;
using WebAPI_TodoList.Infra.Data.Identity;

namespace WebAPI_TodoList.Application.Mapper.MapperProfile;

public class AuthProfile : Profile
{
    public AuthProfile()
    {
        CreateMap<RegisterInputUserDTO, UserCustomEntity>()
            .ReverseMap()
            .ForMember(x => x.Email, map => map.MapFrom(src => src.Email))
            .ForMember(x => x.Surname, map => map.MapFrom(src => src.Name));


        CreateMap<RegisterOutputUserDTO, UserCustomEntity>()
            .ReverseMap()
            .ForMember(x => x.UserId, map => map.MapFrom(src => src.Id))
            .ForMember(x => x.Email, map => map.MapFrom(src => src.Email))
            .ForMember(x => x.UserName, map => map.MapFrom(src => src.UserName));

        CreateMap<AuthOutputUserDTO, UserCustomEntity>()
            .ReverseMap()
            .ForMember(x => x.Id, map => map.MapFrom(src => src.Id))
            .ForMember(x => x.Name, map => map.MapFrom(src => src.Name))
            .ForMember(x => x.Email, map => map.MapFrom(src => src.Email));
    }
}
