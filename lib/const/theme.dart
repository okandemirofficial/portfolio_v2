import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const appColorsDark = ColorScheme.dark(
  background: Color(0XFF181A25),
  surface: Color(0XFF181A25),
  onSurface: Color(0XFFCED0DE),
  primary: Color(0XFFE07A5F),
  onPrimary: Color(0XFF552011),
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: appColorsDark,
  textTheme: GoogleFonts.interTextTheme().apply(
    displayColor: appColorsDark.onSurface,
    bodyColor: appColorsDark.onSurface,
    decorationColor: appColorsDark.onSurface,
  ),
);
