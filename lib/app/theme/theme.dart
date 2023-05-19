import 'package:flutter/material.dart';
import 'package:pokedex_app/app/theme/palette.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  textTheme: appTextTheme,
  scaffoldBackgroundColor: Palette.primary,
  appBarTheme: appBarTheme,
);

AppBarTheme appBarTheme = const AppBarTheme(elevation: 0, backgroundColor: Palette.primary, scrolledUnderElevation: 0);

TextTheme appTextTheme = const TextTheme(
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Palette.white),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ));
