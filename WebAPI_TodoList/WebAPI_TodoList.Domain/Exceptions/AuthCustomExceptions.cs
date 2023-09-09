namespace WebAPI_TodoList.Domain.Exceptions;

public class AuthCustomExceptions : CustomException
{
    public AuthCustomExceptions(string message) : base(1, message) {}
}

public class AuthNotFoundExceptions : CustomException
{
    public AuthNotFoundExceptions() : base(1, "Não foi possível encontrar o usuário especificado.") { }
}
