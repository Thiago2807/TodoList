import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../domain/keys/keys.dart';
import '../dto/auth_output_user_dto.dart';
import '../interfaces/iauth_services.dart';
import '../interfaces/isplash_services.dart';
import '../preferences/auth_preferences.dart';

class SplashServices implements ISplashServices {
  final IAuthServices _authRepository = GetIt.instance<IAuthServices>();

  @override
  Future<void> splashInitialApp(BuildContext context) async {

    bool userAuth = await AuthPreferences.checkDataAsync(credentialsUser);

    if (context.mounted) {
      if (!userAuth) {
        Navigator.of(context).pushNamedAndRemoveUntil("/Login", (route) => false);
      }
      else {
        AuthOutputUserDTO userCredential = await AuthPreferences.getUserObject();

        if (context.mounted) {
          await _authRepository.authUser(email: userCredential.email, password: userCredential.password, context: context);
        }
      }
    }

  }
}