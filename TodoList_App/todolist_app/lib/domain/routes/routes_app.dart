import 'package:flutter/material.dart';

import '../../presentation/screens/presentation/presentation_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';

Map<String, Widget Function(BuildContext)> get routesApp => {
  "/Presentation": (_) => const PresentationScreen(),
  "/Splash": (_) => const SplashScreen()
};