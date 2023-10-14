import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../../../fonts/fonts.dart';

class InputAddTask extends StatelessWidget {
  const InputAddTask({
    super.key,
    required this.multiLines,
    required this.textInformation,
  });

  final bool multiLines;
  final String textInformation;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return TextField(
      maxLines: multiLines ? null : 1,
      expands: multiLines,
      maxLength: multiLines ? 150 : 50,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * .02),
          borderSide: BorderSide(
            color: Color(secondaryAlterColor),
          ),
        ),
        prefixIconColor: Colors.grey.shade500,
        contentPadding: EdgeInsets.symmetric(
          horizontal: size.width * .02,
        ),
        labelText: textInformation,
        labelStyle: FontGoogle.interFont(
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade400,
        ),
      ),
      style: FontGoogle.interFont(
        color: Color(blackColor),
      ),
    );
  }
}
