import 'package:todolist_app/presentation/screens/auth/components/button.dart';
import 'package:todolist_app/presentation/screens/auth/components/input.dart';
import 'package:todolist_app/presentation/fonts/fonts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../../../domain/enum/type_button_auth.dart';
import '../state/auth_state.dart';
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
    final AuthState stateScreen = Provider.of<AuthState>(context);
    final ThemeData theme = Theme.of(context);
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
            indexIcon: 0,
            labelInput: "Email",
            textEditingController: _emailEditingController,
          ),
          Observer(
            builder: (_) {
              if (!stateScreen.loginScreen) {
                return Column(
                  children: [
                    SizedBox(height: size.height * .03),
                    Input(
                      indexIcon: 1,
                      labelInput: "Apelido",
                      textEditingController: _nicknameEditingController,
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
          SizedBox(height: size.height * .03),
          Input(
            indexIcon: 2,
            labelInput: "Senha",
            textEditingController: _passwordEditingController,
          ),
          Observer(
            builder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (stateScreen.loginScreen) ...[
                  SizedBox(height: size.height * .03),
                  Text(
                    "Esqueceu a senha?",
                    textAlign: TextAlign.end,
                    style: FontGoogle.interFont(
                      size: size.width * .035,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.secondary,
                    ),
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
          Observer(
            builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (stateScreen.loginScreen) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: Divider(color: Colors.grey.shade500)),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * .03),
                        child: Text(
                          "OU",
                          style: FontGoogle.interFont(
                              color: Colors.grey.shade500,
                              size: size.width * .035),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey.shade500)),
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
                      stateScreen.loginScreen
                          ? "Ainda não se registrou?"
                          : "Já tem uma conta?",
                      style: FontGoogle.interFont(
                        size: size.width * .035,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(width: size.width * .02),
                    GestureDetector(
                      onTap: () => stateScreen.alterLoginScreen(),
                      child: Text(
                        stateScreen.loginScreen
                            ? "Crie uma conta"
                            : "Acesse sua conta",
                        style: FontGoogle.interFont(
                          size: size.width * .035,
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.secondary,
                        ),
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
