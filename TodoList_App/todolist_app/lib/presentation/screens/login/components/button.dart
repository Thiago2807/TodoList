import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/colors/colors.dart';
import 'package:todolist_app/presentation/fonts/fonts.dart';

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width),
        ),
        backgroundColor: Color(secondaryColor),
        padding: EdgeInsets.symmetric(vertical: size.height * .015),
      ),
      child: Text(
        "Acessar",
        style: FontGoogle.interFont(fontWeight: FontWeight.w500),
      ),
    );
  }
}
