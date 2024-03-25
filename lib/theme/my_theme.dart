import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

class MyTheme {
  /// Dark Theme
  static ThemeData get darkTheme => ThemeData(
      primaryColor: accent,
      primaryColorDark: bgColorDarkModeAlt,
      scaffoldBackgroundColor: bgColorDarkMode,
      iconTheme: const IconThemeData(color: textWhite300),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: accent, foregroundColor: textWhite700),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: accent, backgroundColor: Colors.transparent)),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              backgroundColor: accent, foregroundColor: textWhite500)),
      textSelectionTheme: const TextSelectionThemeData(cursorColor: accent),
      inputDecorationTheme: const InputDecorationTheme(
          iconColor: accent,
          prefixIconColor: textWhite300,
          suffixIconColor: textWhite300,
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: accent))),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: bgColorDarkMode,
        elevation: 0,
        dragHandleColor: textWhite500,
        showDragHandle: true,
        surfaceTintColor: bgColorDarkMode,
        modalBackgroundColor: bgColorDarkMode,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      ),
      useMaterial3: true,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        bodySmall: TextStyle(
            fontSize: 11, fontWeight: FontWeight.w500, color: textWhite500),
        bodyMedium: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: textWhite500),
        bodyLarge: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: textWhite700),
        titleSmall: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: textWhite700),
        titleMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: textWhite900),
        titleLarge: TextStyle(
            fontSize: 26, fontWeight: FontWeight.bold, color: textWhite900),
      ));
}
