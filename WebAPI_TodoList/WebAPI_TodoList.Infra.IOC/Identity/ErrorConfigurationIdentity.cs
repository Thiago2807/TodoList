using Microsoft.AspNetCore.Identity;

namespace WebAPI_TodoList.Infra.IOC.Identity;

public class ErrorConfigurationIdentity : IdentityErrorDescriber
{
    public override IdentityError DefaultError()
    => new()
    {
        Code = nameof(DefaultError),
        Description = "Oops! Encontramos um problema inesperado. Por favor, tente novamente mais tarde."
    };

    public override IdentityError InvalidEmail(string? email)
        => new()
        {
            Code = nameof(InvalidEmail),
            Description = "Parece que o formato do e-mail não está certo. Dê uma olhada e tente novamente."
        };

    public override IdentityError PasswordRequiresDigit()
        => new()
        {
            Code = nameof(PasswordRequiresDigit),
            Description = "Sua senha precisa ter pelo menos um número (0-9) para ser mais segura."
        };

    public override IdentityError PasswordRequiresUpper()
        => new()
        {
            Code = nameof(PasswordRequiresUpper),
            Description = "Que tal adicionar pelo menos uma letra maiúscula à sua senha? Ela vai ficar mais forte assim."
        };

    public override IdentityError PasswordTooShort(int length)
        => new()
        {
            Code = nameof(PasswordTooShort),
            Description = $"Para proteger sua conta, a senha deve ter no mínimo {length} caracteres."
        };

    public override IdentityError PasswordRequiresLower()
        => new()
        {
            Code = nameof(PasswordRequiresLower),
            Description = "Para sua senha ficar mais segura, inclua pelo menos uma letra minúscula nela."
        };

    public override IdentityError PasswordRequiresNonAlphanumeric()
        => new()
        {
            Code = nameof(PasswordRequiresLower),
            Description = "Uma senha forte inclui pelo menos um caractere especial. Que tal adicionar um?"
        };

    public IdentityError LockoutTooManyAttempts()
        => new()
        {
            Code = nameof(LockoutTooManyAttempts),
            Description = "Você fez várias tentativas de acesso. Sua conta está temporariamente bloqueada."
        };

    public IdentityError LockoutTimeSpanTooShort(TimeSpan timeSpan)
        => new()
        {
            Code = nameof(LockoutTimeSpanTooShort),
            Description = $"O tempo de bloqueio deve ser de pelo menos {timeSpan.TotalMinutes} minutos. Vamos manter sua conta segura!"
        };

    public override IdentityError DuplicateUserName(string? userName)
        => new()
        {
            Code = nameof(DuplicateUserName),
            Description = $"Ops! Parece que essa conta já foi cadastrada. Dê uma conferida e tente novamente, por favor."
        };
}
