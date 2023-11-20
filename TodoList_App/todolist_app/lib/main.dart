import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:todolist_app/domain/routes/routes_app.dart';
import 'package:todolist_app/presentation/screens/auth/auth_bloc.dart';
import 'package:todolist_app/presentation/screens/default/default_bloc.dart';
import 'package:todolist_app/presentation/screens/list_tasks/list_tasks_screen_bloc.dart';

import 'domain/themes/theme_dark.dart';
import 'domain/themes/theme_light.dart';
import 'infra.ioc/dependecy_injection/dependency_injection.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  DependencyInjection.setupDependencyInjection();

  FlutterNativeSplash.remove();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(),
        ),
        BlocProvider(
          create: (_) => DefaultScreenBloc(),
        ),
        BlocProvider(
          create: (_) => ListTaskBloc(),
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
