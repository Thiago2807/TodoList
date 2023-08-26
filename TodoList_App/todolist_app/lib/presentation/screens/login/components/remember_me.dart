import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../../../fonts/fonts.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {
          },
          checkColor: Colors.white,
          activeColor: Color(secondaryColor),
          side: BorderSide(
              style: BorderStyle.solid,
              color: Color(blackColor),
              strokeAlign: 1),
          shape: CircleBorder(),
        ),
        SizedBox(width: size.width * .02),
        Expanded(
          child: Text(
            "Lembre-se de mim",
            style: FontGoogle.interFont(
                color: Colors.grey.shade500,
                size: size.width * .035
            ),
          ),
        ),
        Expanded(
          child: Text(
            "Esqueceu a senha?",
            textAlign: TextAlign.end,
            style: FontGoogle.interFont(
                color: Color(secondaryColor),
                fontWeight: FontWeight.w500,
                size: size.width * .035
            ),
          ),
        ),
      ],
    );
  }
}
