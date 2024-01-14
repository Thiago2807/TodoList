using System.Net;

namespace WebAPI_TodoList.Application.DTO;

public class ResponseRequestDTO<T>
{
    public T? Value { get; set; }
    public HttpStatusCode StatusCode { get; set; }
    public string Msg { get; set; } = string.Empty;
}
