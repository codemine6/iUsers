import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 14),
    ),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF499BF7),
      brightness: Brightness.light,
      primary: const Color(0xFF499BF7),
      background: const Color(0xFFFFFFFF),
    ),
    scaffoldBackgroundColor: const Color(0xFFD4E6F1),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFD4E6F1)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Color(0xFFFFFFFF),
      backgroundColor: Color(0xFF499BF7),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 14),
    ),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF499BF7),
      brightness: Brightness.dark,
      primary: const Color(0xFF499BF7),
      background: const Color(0xFF43464B),
    ),
    scaffoldBackgroundColor: const Color(0xFF111112),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF111112)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Color(0xFF43464B),
      backgroundColor: Color(0xFF499BF7),
    ),
  );
}
