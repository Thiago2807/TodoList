import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontGoogle {
  static TextStyle interFont({
    double size = 15,
    double letterSpacing = 0,
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return GoogleFonts.inter(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle robotoFont({
    double size = 15,
    double letterSpacing = 0,
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return GoogleFonts.roboto(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle dosisFont({
    double size = 15,
    double letterSpacing = 0,
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return GoogleFonts.dosis(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }

}
