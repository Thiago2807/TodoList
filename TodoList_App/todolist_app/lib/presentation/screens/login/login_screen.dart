import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/colors/colors.dart';
import 'package:todolist_app/presentation/screens/login/components/body.dart';

import '../../fonts/fonts.dart';
import 'components/message_initial.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Radius radiusSize = Radius.circular(size.width * .1);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset("images/imageDefault.jpg"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(color: Colors.transparent),
            ),
          ),
          const MessageInitial(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: size.height * .15),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  topRight: radiusSize,
                  topLeft: radiusSize,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * .025),
                      child: Text(
                        "Digite suas credenciais",
                        style: FontGoogle.dosisFont(
                            size: size.width * .05,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * .08),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 6,
                            offset: Offset(1, 10),
                            color: Color(0xff1c1c1c))
                      ],
                      borderRadius: BorderRadius.only(
                        topRight: radiusSize,
                        topLeft: radiusSize,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: size.height * .15),
                    padding: EdgeInsets.symmetric(horizontal: size.width * .07),
                    child: const Body(),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
