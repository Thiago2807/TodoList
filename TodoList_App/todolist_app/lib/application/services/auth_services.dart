import 'package:email_validator/email_validator.dart';
import '../interfaces/iauth_services.dart';

class AuthServices extends IAuthServices {
  Future<bool> registerEmailUser({required String email, required String password}) async {
    await Future.delayed(Duration(seconds: 2));
    if (!EmailValidator.validate(email)) return false;

    return true;
  }
}