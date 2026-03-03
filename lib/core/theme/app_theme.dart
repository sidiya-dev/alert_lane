import 'package:flutter/material.dart';

class AppTheme {
  // Shared
  static final _inputDecorationTheme = InputDecorationTheme().copyWith(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30)
    ),
  );
  static final  darkTheme = ThemeData.dark().copyWith(
    inputDecorationTheme: _inputDecorationTheme,
  );
  static final lightTheme = ThemeData.light().copyWith(
    inputDecorationTheme: _inputDecorationTheme,
  );
}