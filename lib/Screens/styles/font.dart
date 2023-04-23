import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeFontStyle {
  final double fontSize;
  final Color color;
  ThemeFontStyle({
    Key? key,
    required this.fontSize,
    this.color = const Color.fromRGBO(101, 103, 107, 1),
  });
  late TextStyle style = GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
    fontFamily: 'Oswald',
    color: color,
  ));
}
