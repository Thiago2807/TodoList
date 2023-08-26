import 'package:flutter/material.dart';

import '../../../fonts/fonts.dart';

class MessageInitial extends StatelessWidget {
  const MessageInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: size.height * .02,
        horizontal: size.width * .02,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Bem-vindo(a) de volta!",
              textAlign: TextAlign.end,
              style: FontGoogle.robotoFont(
                  size: size.width * .06, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: size.height * .01),
            Text(
              "Estamos felizes em te ver!",
              textAlign: TextAlign.end,
              style: FontGoogle.robotoFont(
                size: size.width * .04,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
