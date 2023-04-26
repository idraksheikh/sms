import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeFontStyle {
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double height;

  ThemeFontStyle({
    Key? key,
    required this.fontSize,
    this.color = const Color.fromRGBO(101, 103, 107, 1),
    this.height = 1,
    this.fontWeight = FontWeight.bold,
  });

  late TextStyle style = GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: 'Oswald',
    color: color,
    height: height,
  ));
}
