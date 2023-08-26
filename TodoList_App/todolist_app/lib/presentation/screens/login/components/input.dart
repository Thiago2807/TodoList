import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/colors/colors.dart';
import 'package:todolist_app/presentation/fonts/fonts.dart';

class Input extends StatelessWidget {
  const Input(
      {Key? key, required this.textEditingController, required this.labelInput})
      : super(key: key);

  final TextEditingController textEditingController;
  final String labelInput;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Radius radiusSize = Radius.circular(size.width * .03);

    return TextFormField(
      cursorColor: const Color(0xff1c1c1c),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.all(radiusSize)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(radiusSize * .6),
          borderSide: BorderSide(
            color: Color(primaryColor),
          ),
        ),
        labelText: labelInput,
        labelStyle: FontGoogle.interFont(
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }
}
