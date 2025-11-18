import 'package:stackfood_multivendor/util/app_constants.dart';
import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: AppConstants.fontFamily,
  primaryColor: const Color(0xFF25D368),
  secondaryHeaderColor: const Color(0x3325D368),
  disabledColor: const Color(0xFF9FA4AB),
  brightness: Brightness.light,
  hintColor: const Color(0xFF4A4F55),
  cardColor: Colors.white,
  shadowColor: Colors.black.withValues(alpha: 0.05),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFF25D368))),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF25D368),
    secondary: Color(0xFF25D368),
    tertiary: Color(0xFF000000),
    tertiaryContainer: Color(0xFFFFFFFF),
  ).copyWith(surface: const Color(0xFFF6F7FA)).copyWith(error: const Color(0xFFE84D4F),
  ),
  popupMenuTheme: const PopupMenuThemeData(color: Colors.white, surfaceTintColor: Colors.white),
  dialogTheme: const DialogThemeData(surfaceTintColor: Colors.white),
  floatingActionButtonTheme: FloatingActionButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500))),
  bottomAppBarTheme: const BottomAppBarThemeData(
    surfaceTintColor: Colors.white, height: 60,
    padding: EdgeInsets.symmetric(vertical: 5),
  ),
  dividerTheme: DividerThemeData(color: const Color(0xFFBABFC4).withValues(alpha: 0.25), thickness: 0.5),
  tabBarTheme: const TabBarThemeData(dividerColor: Colors.transparent),
);
