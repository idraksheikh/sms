import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms/Screens/widgets/spacer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AttendanceCard extends StatelessWidget {
  final String routeName;
  final String imgSrc;
  final String heading;
  final String subHeading;

  const AttendanceCard(
      {Key? key,
      this.routeName = '/home',
      this.imgSrc = 'cards.png',
      this.heading = 'Heading',
      this.subHeading = 'SubHeading',
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.white,
      borderRadius: BorderRadius.circular(24),
      splashColor: Colors.white,
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Card(
        // elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.16,
          width: MediaQuery.of(context).size.width * 0.92,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            // color: const Color.fromRGBO(93, 122, 242, 1),
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(93, 122, 242, 1),
              Color.fromRGBO(105, 127, 245, 0.9),
              Color.fromRGBO(105, 129, 244, 0.8),
            ]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularStepProgressIndicator(
                totalSteps: 100,
                currentStep: 74,
                stepSize: 10,
                selectedColor: Colors.greenAccent,
                unselectedColor: Colors.grey[200],
                padding: 0,
                width: 80,
                height: 80,
                selectedStepSize: 11,
                // customColor: = const Color.fromRGBO(245, 248, 254, 1),
                roundedCap: (_, __) => true,
                child: Center(
                    child: Text(
                  '74%',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
              ),
              const Space(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Active percentage',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 22,
                        color: Color.fromRGBO(245, 248, 254, 1),
                      ),
                    ),
                  ),
                  const Space(height: 15),
                  const Text(
                    'Last updated - Sep. 10. 2023',
                    style: TextStyle(
                      color: Color.fromRGBO(154, 175, 255, 1),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
