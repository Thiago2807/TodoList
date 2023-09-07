namespace WebAPI_TodoList.Domain.Exceptions;

public class CustomException : Exception
{
    public int Type { get; set; }

    public CustomException(int type, string message) : base(message)
        => Type = type;
}
