import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/screens/auth/components/body.dart';

import '../../../domain/enum/type_auth_enum.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key, required this.typeAuth}) : super(key: key);

  final TypeAuthEnum typeAuth;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * .1),
          margin: EdgeInsets.only(top: size.height * .07),
          color: Colors.grey.shade50,
          child: const Body(),
        ),
      ),
    );
  }
}
