namespace persuasiveAPI.Auth;

public class UserRoles
{
    public const string Admin = nameof(Admin);
    public const string User = nameof(User);
    public const string Employee = nameof(Employee);

    public static readonly IReadOnlyCollection<string> All = new[] { Admin, User, Employee };
}