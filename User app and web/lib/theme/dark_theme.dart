import 'package:stackfood_multivendor/util/app_constants.dart';
import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  fontFamily: AppConstants.fontFamily,
  primaryColor: const Color(0xFF25D368),
  secondaryHeaderColor: const Color(0x3325D368),
  disabledColor: const Color(0xFF6F7378),
  brightness: Brightness.dark,
  hintColor: const Color(0xFFB5B9BE),
  cardColor: const Color(0xFF101010),
  shadowColor: Colors.white.withValues(alpha: 0.04),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFF25D368))),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF25D368),
    secondary: Color(0xFF25D368),
    tertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFF000000),
  ).copyWith(surface: const Color(0xFF181818)).copyWith(error: const Color(0xFFdd3135),
  ),
  popupMenuTheme: const PopupMenuThemeData(color: Color(0xFF29292D), surfaceTintColor: Color(0xFF29292D)),
  dialogTheme: const DialogThemeData(surfaceTintColor: Colors.white10),
  floatingActionButtonTheme: FloatingActionButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500))),
  bottomAppBarTheme: const BottomAppBarThemeData(
    surfaceTintColor: Colors.black, height: 60,
    padding: EdgeInsets.symmetric(vertical: 5),
  ),
  dividerTheme: DividerThemeData(color: const Color(0xffa2a7ad).withValues(alpha: 0.25), thickness: 0.5),
  tabBarTheme: const TabBarThemeData(dividerColor: Colors.transparent),
);
