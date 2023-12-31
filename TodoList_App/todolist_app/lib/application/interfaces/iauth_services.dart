import 'package:flutter/material.dart';

abstract class IAuthServices {
  Future registerEmailUser({required String email, required String password, required String nickname, required BuildContext context});

  Future authUser({required String email, required String password, required BuildContext context});

}