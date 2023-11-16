import 'package:android_project/core/res/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme({bool isDark = false}) => ThemeData(
        useMaterial3: true,
        //fontFamily: GoogleFonts.itim().fontFamily,
        dividerTheme: const DividerThemeData(space: 0),
        appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.white, centerTitle: true),
        colorScheme: isDark
            ? ColorScheme.dark(
                primary: AppColors.primarySwatch,
                secondary: AppColors.primarySwatch)
            : ColorScheme.light(
                primary: AppColors.primarySwatch,
                secondary: AppColors.primarySwatch),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primarySwatch,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primarySwatch,
          foregroundColor: Colors.white,
          elevation: 0,
          side: const BorderSide(
              width: 1, // the thickness
              color: Colors.black // the color of the border
              ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        )),
        inputDecorationTheme: InputDecorationTheme(
            errorMaxLines: 8,
            isDense: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(18))),
      );
}
