import 'package:flutter/material.dart';

import '../../presentation/colors/colors.dart';
import '../../presentation/fonts/fonts.dart';

ThemeData get customThemeDataDark => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Color(backgroundDarkScreenColor),

      appBarTheme: AppBarTheme(
        surfaceTintColor: Color(blackColor),
        color: Color(backgroundDarkScreenColor),
      ),



      // INICIO: Cores
      primaryColor: const Color(0xff48cae4),
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: Colors.white,
            tertiary: Color(secondaryAlterColor),
            outline: Colors.white,
            scrim: Color(blackItemColor),
            tertiaryContainer: Color(blackItemColor),
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
        titleMedium: FontGoogle.dosisFont(
          color: Colors.white,
          letterSpacing: .5,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: FontGoogle.robotoFont(
          color: Colors.white,
          letterSpacing: .3,
          fontWeight: FontWeight.w500,
        ),

        bodySmall: FontGoogle.interFont(
          color: Colors.grey.shade50,
        ),

      ),
      // FIM: Text

      iconTheme: const IconThemeData(color: Colors.white),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: Color(blackColor),
      ),

      cardColor: Color(blackColor),

    );
