import 'package:todolist_app/presentation/screens/home/state/home_screen_state.dart';
import 'package:todolist_app/presentation/screens/list_tasks/state/list_task_state.dart';
import 'package:todolist_app/presentation/screens/add_task/state/add_task_state.dart';
import 'package:todolist_app/presentation/screens/auth/state/auth_state.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:todolist_app/domain/routes/routes_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'infra.ioc/dependecy_injection/dependency_injection.dart';
import 'domain/themes/theme_light.dart';
import 'domain/themes/theme_dark.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  DependencyInjection.setupDependencyInjection();

  FlutterNativeSplash.remove();

  runApp(
    MultiProvider(
      providers: <Provider>[
        Provider<AuthState>(
          create: (_) => AuthState(),
        ),
        Provider<ListTaskState>(
          create: (_) => ListTaskState(),
        ),
        Provider<AddTaskState>(
          create: (_) => AddTaskState(),
        ),
        Provider<HomeScreenState>(
          create: (_) => HomeScreenState(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/Splash",
      routes: routesApp,
      theme: customThemeDataLight,
      darkTheme: customThemeDataDark,
      themeMode: ThemeMode.system,
    );
  }
}
