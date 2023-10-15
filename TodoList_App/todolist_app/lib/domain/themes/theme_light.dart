import 'package:flutter/material.dart';

import '../../presentation/colors/colors.dart';
import '../../presentation/fonts/fonts.dart';

ThemeData get customThemeDataLight => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.grey.shade100,
      primaryColor: Color(primaryColor),
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: Color(secondaryColor),
            tertiary: Color(blackColor),
          ),
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
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Color(secondaryColor),
        ),
      ),
      textTheme: TextTheme(
        labelLarge: FontGoogle.interFont( // Fonte para botões
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        displaySmall: FontGoogle.interFont( // Fonte para inputs
          color: Color(blackColor),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
      ),
    );
