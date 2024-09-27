import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
            fontFamily: 'Raleway',

  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
);

ThemeData darkTheme = ThemeData(
            fontFamily: 'Raleway',

  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.white,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
);
