import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../colors/colors.dart';
import '../../../fonts/fonts.dart';

class InputAddTask extends StatelessWidget {
  const InputAddTask({
    super.key,
    required this.multiLines,
    required this.textInformation,
    required this.textEditingController
  });

  final bool multiLines;
  final String textInformation;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData theme = Theme.of(context);

    return TextField(
      controller: textEditingController,
      maxLines: multiLines ? null : 1,
      expands: multiLines,
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
      style: theme.textTheme.displaySmall,
    );
  }
}
