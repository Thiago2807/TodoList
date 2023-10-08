import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_app/presentation/bloc/events/auth_events.dart';
import 'package:todolist_app/presentation/bloc/states/auth_states.dart';
import 'package:todolist_app/presentation/colors/colors.dart';
import 'package:todolist_app/presentation/fonts/fonts.dart';
import 'package:todolist_app/presentation/screens/auth/auth_bloc.dart';
import 'package:todolist_app/presentation/screens/auth/components/button.dart';
import 'package:todolist_app/presentation/screens/auth/components/input.dart';

import '../../../../domain/enum/type_button_auth.dart';
import 'message_initial.dart';

final GlobalKey _formKey = GlobalKey<FormState>();

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _nicknameEditingController =
      TextEditingController();

  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _nicknameEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blocAuth = context.read<AuthBloc>();
    final Size size = MediaQuery.sizeOf(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const MessageInitial(),
          SizedBox(height: size.height * .07),
          Input(
              textEditingController: _emailEditingController,
              labelInput: "Email",
              indexIcon: 0),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is StateAuth && !state.loginScreen) {
                return Column(
                  children: [
                    SizedBox(height: size.height * .03),
                    Input(
                        textEditingController: _nicknameEditingController,
                        labelInput: "Apelido",
                        indexIcon: 1),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
          SizedBox(height: size.height * .03),
          Input(
              textEditingController: _passwordEditingController,
              labelInput: "Senha",
              indexIcon: 2),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state is StateAuth && state.loginScreen) ...[
                  SizedBox(height: size.height * .03),
                  Text(
                    "Esqueceu a senha?",
                    textAlign: TextAlign.end,
                    style: FontGoogle.interFont(
                        color: Color(secondaryColor),
                        fontWeight: FontWeight.w500,
                        size: size.width * .035),
                  ),
                  SizedBox(height: size.width * .04),
                ] else ...[
                  SizedBox(height: size.width * .06),
                ]
              ],
            ),
          ),
          Button(
            typeButton: TypeButtonAuth.email,
            emailController: _emailEditingController,
            nicknameController: _nicknameEditingController,
            passwordController: _passwordEditingController,
          ),
          SizedBox(height: size.width * .05),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (state is StateAuth && state.loginScreen) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      SizedBox(width: size.width * .03),
                      Text(
                        "OU",
                        style: FontGoogle.interFont(
                            color: Colors.grey.shade500,
                            size: size.width * .035),
                      ),
                      SizedBox(width: size.width * .03),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.width * .05),
                  Button(
                    typeButton: TypeButtonAuth.google,
                    emailController: _emailEditingController,
                    nicknameController: _nicknameEditingController,
                    passwordController: _passwordEditingController,
                  ),
                  SizedBox(height: size.width * .1),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state is StateAuth && state.loginScreen
                          ? "Ainda não se registrou?"
                          : "Já tem uma conta?",
                      style: FontGoogle.interFont(
                          color: Colors.grey.shade500, size: size.width * .035),
                    ),
                    SizedBox(width: size.width * .02),
                    GestureDetector(
                      onTap: () => blocAuth.add(
                        UpdateLoginScreen(
                            loginScreen: state is StateAuth && state.loginScreen
                                ? false
                                : true),
                      ),
                      child: Text(
                        state is StateAuth && state.loginScreen
                            ? "Crie uma conta"
                            : "Acesse sua conta",
                        style: FontGoogle.interFont(
                            color: Color(secondaryColor),
                            fontWeight: FontWeight.w500,
                            size: size.width * .035),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
