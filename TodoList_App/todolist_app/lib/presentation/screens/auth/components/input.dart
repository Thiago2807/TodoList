import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/presentation/colors/colors.dart';
import 'package:todolist_app/presentation/fonts/fonts.dart';

import '../../../../application/provider/auth_provider.dart';

class Input extends StatelessWidget {
  Input(
      {Key? key,
      required this.textEditingController,
      required this.labelInput,
      required this.indexIcon})
      : super(key: key);

  final int indexIcon;
  final String labelInput;
  final TextEditingController textEditingController;

  final List<IconData> icons = [
    Icons.alternate_email_rounded,
    Icons.face_unlock_rounded,
    Icons.lock_rounded
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Radius radiusSize = Radius.circular(size.width * .03);

    return Consumer<AuthProvider>(
      builder: (context, value, child) => TextFormField(
        controller: textEditingController,
        cursorColor: const Color(0xff1c1c1c),
        obscureText: indexIcon == 2 && value.viewPassword,
        decoration: InputDecoration(
          suffixIcon: indexIcon == 2
              ? value.viewPassword
                  ? GestureDetector(
                      onTap: () => value.viewPassword = false,
                      child: Icon(
                        CupertinoIcons.eye_solid,
                        size: size.width * .05,
                        color: Colors.grey.shade400,
                      ),
                    )
                  : GestureDetector(
                      onTap: () => value.viewPassword = true,
                      child: Icon(
                        CupertinoIcons.eye_slash_fill,
                        size: size.width * .05,
                        color: Colors.grey.shade400,
                      ),
                    )
              : null,
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.all(radiusSize)),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.all(radiusSize * .6),
            borderSide: BorderSide(
              color: Color(primaryColor),
            ),
          ),
          prefixIcon: Icon(
            icons[indexIcon],
            size: size.width * .05,
          ),
          prefixIconColor: Colors.grey.shade400,
          labelText: labelInput,
          labelStyle: FontGoogle.interFont(
            fontWeight: FontWeight.w400,
            color: Color(blackColor),
          ),
        ),
        style: FontGoogle.interFont(color: Color(blackColor)),
      ),
    );
  }
}
