abstract class AuthEvents {}

class UpdateLoginScreen extends AuthEvents {
  final bool loginScreen;

  UpdateLoginScreen({required this.loginScreen});
}

class UpdateLoadingAuth extends AuthEvents {
  final bool loadingScreen;

  UpdateLoadingAuth({required this.loadingScreen});
}

class UpdateViewPasswords extends AuthEvents {
  final bool viewPassword;

  UpdateViewPasswords({required this.viewPassword});
}
