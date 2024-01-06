import 'package:todolist_app/presentation/screens/auth/state/auth_state.dart';
import 'package:todolist_app/domain/enum/type_button_auth.dart';
import 'package:todolist_app/presentation/colors/colors.dart';
import 'package:todolist_app/presentation/fonts/fonts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

import '../../../../application/interfaces/iauth_services.dart';

class Button extends StatelessWidget {
  Button(
      {Key? key,
      required this.typeButton,
      required this.emailController,
      required this.nicknameController,
      required this.passwordController})
      : super(key: key);

  final IAuthServices _authServices = GetIt.instance<IAuthServices>();

  final TypeButtonAuth typeButton;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nicknameController;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AuthState stateScreen = Provider.of<AuthState>(context);

    final Size size = MediaQuery.sizeOf(context);

    final buttonRadiusCustom = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(size.width * .025),
    );

    final buttonPaddingCustom =
        EdgeInsets.symmetric(vertical: size.height * .015);

    if (typeButton == TypeButtonAuth.email) {
      return Observer(
        builder: (context) => ElevatedButton(
          onPressed: () async {
            await stateScreen.alterLoadingScreen();

            if (context.mounted) {
              FocusScope.of(context).unfocus(); // Fechar o teclado antes do envio

              if (!stateScreen.loginScreen) {
                await _authServices.registerEmailUser(
                  email: emailController.text,
                  password: passwordController.text,
                  nickname: nicknameController.text,
                  context: context,
                );
              } else {
                await _authServices.authUser(
                  email: emailController.text,
                  password: passwordController.text,
                  context: context,
                );
              }
            }

            await stateScreen.alterLoadingScreen();
          },
          style: ElevatedButton.styleFrom(
            shape: buttonRadiusCustom,
            padding: buttonPaddingCustom,
          ),
          child: Observer(
            builder: (context) => Column(
              children: [
                if (!stateScreen.loadingScreenAuth) ...[
                  Text(
                    stateScreen.loginScreen ? "Acessar" : "Cadastre-se",
                    style: theme.textTheme.labelLarge,
                  ),
                ] else ...[
                  Transform.scale(
                    scaleX: size.width * .0022,
                    scaleY: size.height * .001,
                    child: CircularProgressIndicator(
                      strokeWidth: size.width * .006,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: buttonRadiusCustom,
          padding: buttonPaddingCustom,
          backgroundColor: Colors.grey.shade200,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: size.width * .09,
                right: size.width * .07,
              ),
              child: SvgPicture.asset(
                "images/google-original.svg",
                width: size.width * .055,
              ),
            ),
            Text(
              "Acessar com o Google",
              textAlign: TextAlign.center,
              style: FontGoogle.interFont(
                fontWeight: FontWeight.w500,
                color: Color(blackColor),
              ),
            ),
          ],
        ),
      );
    }
  }
}
