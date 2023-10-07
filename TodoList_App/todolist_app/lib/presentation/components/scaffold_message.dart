import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/fonts/fonts.dart';

class ScaffoldMessageComponent {
  static scaffoldMessenger(BuildContext context, int color, String message) {
    final Size size = MediaQuery.sizeOf(context);

    ScaffoldMessenger.of(context).clearSnackBars();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        closeIconColor: Colors.white,
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * .01)
        ),
        content: Text(
          message,
          style: FontGoogle.interFont(),
        ),
        backgroundColor: Color(color),
      ),
    );
  }
}
