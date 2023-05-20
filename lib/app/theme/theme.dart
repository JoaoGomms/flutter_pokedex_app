import 'package:flutter/material.dart';
import 'package:pokedex_app/app/theme/palette.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  textTheme: appTextTheme,
  scaffoldBackgroundColor: Palette.primary,
  appBarTheme: appBarTheme,
);

AppBarTheme appBarTheme =
    const AppBarTheme(elevation: 0, backgroundColor: Palette.primary, scrolledUnderElevation: 0, centerTitle: false);

TextTheme appTextTheme = const TextTheme(
  titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Palette.white),
  titleMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ),
  titleSmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  ),
  bodyLarge: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  ),
  bodyMedium: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
  ),
  bodySmall: TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.normal,
  ),
  displayLarge: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
  displayMedium: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  ),
  displaySmall: TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.w400,
  ),
);
