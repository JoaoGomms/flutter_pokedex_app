import 'package:flutter/material.dart';
import 'package:pokedex_app/app/theme/main.dart';

ThemeData appTheme = ThemeData(
  textTheme: appTextTheme,
  scaffoldBackgroundColor: Palette.primary,
  appBarTheme: appBarTheme,
);

AppBarTheme appBarTheme =
    const AppBarTheme(elevation: 0, backgroundColor: Palette.primary, scrolledUnderElevation: 0, centerTitle: false);

TextTheme appTextTheme = const TextTheme(
  titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Palette.white),
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
  titleSmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ),
  headlineSmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  ),
  bodyLarge: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ),
  bodyMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  ),
  bodySmall: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
  ),
  displayLarge: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
  displayMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
  displaySmall: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  ),
);
