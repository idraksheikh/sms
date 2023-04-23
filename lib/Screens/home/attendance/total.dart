import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Total extends StatelessWidget {
  final String heading;
  final String subHeading;

  const Total(
      {Key? key,
        this.heading = 'Heading',
        this.subHeading = 'SubHeading'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // overlayColor: MaterialStateProperty.all(Colors.cyan),
      focusColor: Colors.white,
      borderRadius: BorderRadius.circular(24),
      splashColor: Colors.white,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.42,
          padding: const EdgeInsets.all(10),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  heading,
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      )
                  )
              ),
              Text(subHeading),
            ],
          ),
        ),
      ),
    );
  }
}
