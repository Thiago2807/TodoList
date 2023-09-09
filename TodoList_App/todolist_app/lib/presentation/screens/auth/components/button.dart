import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/application/provider/auth_provider.dart';
import 'package:todolist_app/domain/enum/type_button_auth.dart';
import 'package:todolist_app/presentation/colors/colors.dart';
import 'package:todolist_app/presentation/fonts/fonts.dart';

import '../../../../application/interfaces/iauth_services.dart';

class Button extends StatelessWidget {
  Button(
      {Key? key,
      required this.typeButton,
      required this.email,
      required this.nickname,
      required this.password})
      : super(key: key);

  final IAuthServices _authServices = GetIt.instance<IAuthServices>();

  final String email;
  final String password;
  final String nickname;
  final TypeButtonAuth typeButton;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (typeButton == TypeButtonAuth.email) {
      return Consumer<AuthProvider>(
        builder: (context, value, child) => ElevatedButton(
          onPressed: () async {
            value.loadingAuth = true;

            if (!value.loginScreen) {
              await _authServices.registerEmailUser(
                email: email,
                password: password,
                nickname: nickname,
                context: context,
              );
            } else {
              await _authServices.authUser(
                email: email,
                password: password,
                context: context,
              );
            }

            value.loadingAuth = false;
          },
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size.width * .025),
            ),
            backgroundColor: Color(secondaryColor),
            padding: EdgeInsets.symmetric(vertical: size.height * .015),
          ),
          child: Column(
            children: [
              if (!value.loadingAuth) ...[
                Text(
                  value.loginScreen ? "Acessar" : "Cadastre-se",
                  style: FontGoogle.interFont(fontWeight: FontWeight.w500),
                ),
              ] else ...[
                Transform.scale(
                  scaleX: size.width * .0022,
                  scaleY: size.height * .001,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: size.width * .006,
                  ),
                ),
              ]
            ],
          ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width * .025),
          ),
          backgroundColor: Colors.grey.shade300,
          padding: EdgeInsets.symmetric(vertical: size.height * .015),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: size.width * .09, right: size.width * .07),
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
