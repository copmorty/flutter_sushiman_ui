import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData defaultTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: reddishColor,
    onPrimary: Colors.white,
    secondary: Colors.white,
    onSecondary: greyColor,
    error: Colors.red,
    onError: Colors.white,
    background: greyColor,
    onBackground: Colors.white,
    surface: greyColor,
    onSurface: Colors.white,
  ),
  textTheme: GoogleFonts.playfairDisplayTextTheme(),
  scaffoldBackgroundColor: greyColor,
);
