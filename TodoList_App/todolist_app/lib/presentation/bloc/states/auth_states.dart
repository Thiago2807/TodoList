abstract class AuthState {}

// Variaveis que você quer que seja monitorada
class StateAuth extends AuthState {
  final bool loginScreen;
  final bool viewPassword;
  final bool loadingScreenAuth;

  StateAuth({
    required this.loginScreen,
    required this.viewPassword,
    required this.loadingScreenAuth,
  });
}
