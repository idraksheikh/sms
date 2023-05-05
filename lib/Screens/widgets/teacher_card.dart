import 'package:flutter/material.dart';
import 'package:sms/Screens/styles/font.dart';
import 'package:sms/Services/attendence.dart';

class TeacherCard extends StatelessWidget {
  final String routeName;
  final String imgSrc;
  final String heading;
  final String subHeading;

  const TeacherCard(
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
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width*1/2.4,
          // padding: const EdgeInsets.all(10),
          // margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            // gradient: RadialGradient(colors: const [Colors.transparent, Colors.purpleAccent]),
            image: DecorationImage(image: AssetImage('assets/images/$imgSrc'), fit: BoxFit.fitHeight, opacity: 0.6),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  heading,
                  style: ThemeFontStyle(fontSize: 24, color: Colors.black).style
              ),
              // Text(subHeading),
            ],
          ),
        ),
      ),
    );
  }
}
