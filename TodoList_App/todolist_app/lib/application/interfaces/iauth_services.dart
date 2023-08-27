abstract class IAuthServices {
  Future<bool> registerEmailUser({required String email, required String password});
}