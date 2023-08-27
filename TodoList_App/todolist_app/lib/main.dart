import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/domain/routes/routes_app.dart';

import 'application/provider/auth_provider.dart';
import 'infra.ioc/dependecy_injection/dependency_injection.dart';

void main() {
  DependencyInjection.setupDependencyInjection();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        )
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
    );
  }
}
