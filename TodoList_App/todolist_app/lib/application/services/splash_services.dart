import 'package:flutter/cupertino.dart';

import '../interfaces/isplash_services.dart';

class SplashServices extends ISplashServices {
  @override
  Future<void> splashInitialApp(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));

    if (context.mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil("/Login", (route) => false);
    }
  }
}