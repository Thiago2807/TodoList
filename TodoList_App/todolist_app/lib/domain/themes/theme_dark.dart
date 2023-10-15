import 'package:flutter/material.dart';

import '../../presentation/colors/colors.dart';
import '../../presentation/fonts/fonts.dart';

ThemeData get customThemeDataDark => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Color(backgroundDarkScreenColor),

      // INICIO: Cores
      primaryColor: const Color(0xff48cae4),
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: Colors.white,
            tertiary: Color(secondaryAlterColor),
          ),
      // FIM: Cores

      // INICIO: Input
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: FontGoogle.interFont(
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      // FIM: Input

      // INICIO: ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
        ),
      ),
      // FIM: ElevatedButton

      // INICIO: Text
      textTheme: TextTheme(
        labelLarge: FontGoogle.interFont(
          // Fonte para botões
          fontWeight: FontWeight.w500,
          color: Color(blackColor),
        ),
        displaySmall: FontGoogle.interFont(
          color: Colors.white,
        ),
      ),
      // FIM: Text

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: Color(blackColor),
      ),
    );