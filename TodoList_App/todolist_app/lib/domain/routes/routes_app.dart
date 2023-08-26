import 'package:flutter/material.dart';

import '../../presentation/screens/login/login_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';

Map<String, Widget Function(BuildContext)> get routesApp => {
  "/Login": (_) => const LoginScreen(),
  "/Splash": (_) => const SplashScreen()
};