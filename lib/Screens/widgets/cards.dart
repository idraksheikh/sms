import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms/Services/attendence.dart';

class Cards extends StatelessWidget {
  final String routeName;
  final String imgSrc;
  final String heading;
  final String subHeading;
 
  const Cards(
      {Key? key,
      this.routeName = '/home',
      this.imgSrc = 'cards.png',
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
      onTap: () {
        if(heading=="Dummy"){
           AttendenceManagement().getAttendence();
        }
        Navigator.pushNamed(context, routeName);
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.24,
          width: MediaQuery.of(context).size.width*1.7/2,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            // gradient: RadialGradient(colors: const [Colors.transparent, Colors.purpleAccent]),
            image: DecorationImage(image: AssetImage('assets/images/$imgSrc'), fit: BoxFit.fitWidth, opacity: 0.8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
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
              // Text(subHeading),
            ],
          ),
        ),
      ),
    );
  }
}
