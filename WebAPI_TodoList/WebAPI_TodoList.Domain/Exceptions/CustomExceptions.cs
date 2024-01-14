namespace WebAPI_TodoList.Domain.Exceptions;

public static class CustomExceptions
{
    public class BadRequestException : Exception
    {
        public BadRequestException(string message) : base(message) { }
    }

    public class NotFoundException : Exception
    {
        public NotFoundException(string message) : base(message) { }
    }

    public class InternetServerErrorException : Exception
    {
        public InternetServerErrorException(string message) : base(message) { }
    }

}
