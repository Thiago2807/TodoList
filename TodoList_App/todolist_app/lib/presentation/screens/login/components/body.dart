import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/colors/colors.dart';
import 'package:todolist_app/presentation/fonts/fonts.dart';
import 'package:todolist_app/presentation/screens/login/components/button.dart';
import 'package:todolist_app/presentation/screens/login/components/input.dart';
import 'package:todolist_app/presentation/screens/login/components/remember_me.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  bool valueMe = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Input(
            textEditingController: _emailEditingController,
            labelInput: "Email"),
        SizedBox(height: size.height * .03),
        Input(
            textEditingController: _passwordEditingController,
            labelInput: "Senha"),
        SizedBox(height: size.height * .01),

        const RememberMe(),
        SizedBox(height: size.width * .1),
        const Button(),
      ],
    );
  }
}
