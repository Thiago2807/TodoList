import 'package:flutter/material.dart';

import '../../presentation/colors/colors.dart';
import '../../presentation/fonts/fonts.dart';

ThemeData get customThemeDataLight => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.grey.shade100,
      appBarTheme: AppBarTheme(
        color: Colors.grey.shade100,
        surfaceTintColor: Colors.grey.shade100,
      ),

      // INICIO: Cores
      primaryColor: Color(primaryColor),
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: Color(secondaryColor),
            tertiary: Color(blackColor),
            outline: Color(blackColor),
            tertiaryContainer: Colors.white,
            scrim: Colors.white,
          ),
      // FIM: Cores

      // INICIO: Input
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
        labelStyle: FontGoogle.interFont(
          fontWeight: FontWeight.w400,
          color: Color(blackColor),
        ),
      ),
      // FIM: Input

      // INICIO: ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Color(secondaryColor),
        ),
      ),
      // FIM: ElevatedButton

      // INICIO: Text
      textTheme: TextTheme(
        labelLarge: FontGoogle.interFont(
          // Fonte para botões
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        bodyLarge: FontGoogle.interFont(
          color: Color(secondaryAlterColor),
        ),
        displaySmall: FontGoogle.interFont(
          // Fonte para inputs
          color: Color(blackColor),
        ),
        titleMedium: FontGoogle.dosisFont(
          color: Color(secondaryAlterColor),
          letterSpacing: .5,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: FontGoogle.robotoFont(
          color: Color(secondaryColor),
          letterSpacing: .3,
          fontWeight: FontWeight.w500,
        ),

        bodySmall: FontGoogle.interFont(
          color: Colors.black26,
        ),

      ),
      // FIM: Text

      iconTheme: IconThemeData(
        color: Color(secondaryAlterColor),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Colors.grey.shade200,
      ),
      cardColor: Colors.white,
    );
