import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/application/provider/auth_provider.dart';

import '../../../colors/colors.dart';
import '../../../fonts/fonts.dart';

class MessageInitial extends StatelessWidget {
  const MessageInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      child: SafeArea(
        child: Consumer<AuthProvider>(
          builder: (context, value, child) {
            if (value.loginScreen) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // SvgPicture.asset(
                  //   "images/register.svg",
                  //   height: size.height * .2,
                  // ),
                  Text(
                    "Acesse sua conta",
                    textAlign: TextAlign.start,
                    style: FontGoogle.interFont(
                      size: size.width * .065,
                      fontWeight: FontWeight.w600,
                      color: Color(secondaryColor),
                    ),
                  ),
                  Text(
                    "Faça login na sua conta com facilidade!",
                    textAlign: TextAlign.start,
                    style: FontGoogle.interFont(
                      size: size.width * .03,
                      fontWeight: FontWeight.w500,
                      color: Color(secondaryColor),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Crie sua conta agora!",
                    textAlign: TextAlign.start,
                    style: FontGoogle.interFont(
                      size: size.width * .065,
                      fontWeight: FontWeight.w600,
                      color: Color(secondaryColor),
                    ),
                  ),
                  Text(
                    "Crie sua conta e aproveite nossos benefícios!",
                    textAlign: TextAlign.start,
                    style: FontGoogle.interFont(
                      size: size.width * .03,
                      fontWeight: FontWeight.w500,
                      color: Color(secondaryColor),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
