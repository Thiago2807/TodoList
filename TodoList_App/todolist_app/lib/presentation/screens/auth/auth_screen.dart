import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/screens/auth/components/body.dart';

import '../../../domain/enum/type_auth_enum.dart';
import 'components/message_initial.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key, required this.typeAuth}) : super(key: key);

  final TypeAuthEnum typeAuth;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade50,
          margin: EdgeInsets.only(top: size.height * .07),
          padding: EdgeInsets.symmetric(horizontal: size.width * .1),
          child: const Body(),
        ),
      ),
    );
  }
}
