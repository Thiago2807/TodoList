import 'package:flutter/material.dart';
import 'package:todolist_app/domain/enum/type_auth_enum.dart';
import 'package:todolist_app/presentation/screens/home/home_screen.dart';

import '../../presentation/screens/auth/auth_screen.dart';
import '../../presentation/screens/error/splash_screen.dart';
import '../../presentation/screens/list_tasks/list_tasks_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';

Map<String, Widget Function(BuildContext)> get routesApp => {
  "/Login": (_) => const AuthScreen(typeAuth: TypeAuthEnum.login),
  "/Splash": (_) => const SplashScreen(),
  "/Home": (_) => const HomeScreen(),
  "/ErrorSplash": (_) => const ErrorSplashScreen(),
  "/ListTasks": (_) => const ListTaskScreen()
};