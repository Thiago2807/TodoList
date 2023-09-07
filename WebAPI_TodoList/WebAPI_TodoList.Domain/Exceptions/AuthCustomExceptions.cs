namespace WebAPI_TodoList.Domain.Exceptions;

public class AuthCustomExceptions : CustomException
{
    public AuthCustomExceptions(string message) : base(1, message) {}
}
