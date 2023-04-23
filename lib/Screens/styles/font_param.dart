import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeFont extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const ThemeFont(
      {Key? key,
      required this.text,
      required this.fontWeight,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: 'Oswald',
          color: const Color.fromRGBO(101, 103, 107, 1),
        ),
      ),
    );
  }
}
