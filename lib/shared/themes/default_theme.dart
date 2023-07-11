import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData defaultTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: reddishColor,
    onPrimary: whiteColor,
    secondary: lightReddishColor,
    onSecondary: whiteColor,
    error: redColor,
    onError: whiteColor,
    background: greyishColor,
    onBackground: whiteColor,
    surface: greyishColor,
    onSurface: whiteColor,
  ),
  chipTheme: const ChipThemeData(
    selectedColor: whiteColor,
    backgroundColor: greyishColor,
  ),
  textTheme: GoogleFonts.playfairDisplayTextTheme(),
  scaffoldBackgroundColor: greyishColor,
);
