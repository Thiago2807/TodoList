namespace WebAPI_TodoList.Application.DTO;

public class ResponseServerErrorDTO
{
    public ResponseServerErrorDTO()
        => DescError = string.Empty;

    public int CodError { get; set; }
    public string DescError { get; set; }
}
