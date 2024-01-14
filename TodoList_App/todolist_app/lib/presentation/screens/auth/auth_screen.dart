import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/screens/auth/components/body.dart';

import '../../../domain/enum/type_auth_enum.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key, required this.typeAuth}) : super(key: key);

  final TypeAuthEnum typeAuth;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addStatusListener((status) => setState(() {}));

    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * .1),
          margin: EdgeInsets.only(top: size.height * .07),
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: animationController.value,
            child: const Body(),
          ),
        ),
      ),
    );
  }
}
