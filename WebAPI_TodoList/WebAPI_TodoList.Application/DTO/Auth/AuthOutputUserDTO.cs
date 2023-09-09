namespace WebAPI_TodoList.Application.DTO.Auth;

public class AuthOutputUserDTO
{
    public AuthOutputUserDTO()
    {
        Id = string.Empty;
        Name = string.Empty;
        Email = string.Empty;
        Token = string.Empty;
    }

    public string Id { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
    public string Token { get; set; }
}
