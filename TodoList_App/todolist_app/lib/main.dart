import 'package:flutter/material.dart';
import 'package:todolist_app/domain/routes/routes_app.dart';

import 'infra.ioc/dependecy_injection/dependency_injection.dart';

void main() {

  DependencyInjection.setupDependencyInjection();

  runApp(MyApp());
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
