import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms/Screens/widgets/attendance_card.dart';
import 'package:sms/Screens/widgets/cards.dart';
import 'package:sms/Screens/widgets/profileimage.dart';
import 'package:sms/Screens/widgets/spacer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(245, 248, 254, 1),
            // image: DecorationImage(image: AssetImage('assets/images/home.jpg'), fit: BoxFit.fill, opacity: 0.7)
          ),
          child: ListView(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: Text(
                            'Welcome, Gurpreet',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(101, 103, 107, 1),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Your Attendance',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Space(height: 10),
                      ]),
                  const Space(width: 25,),
                  const ProfileCard(imgSrc: 'gurpreet_singh_bhatia.jpg', routeName: '/profile',),
                ],
              ),
              const Center(child: AttendanceCard(routeName: '/attendance')),
              const Space(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Explore categories",
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Text(
                    "...",
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Cards(
                    routeName: '/form',
                    imgSrc: 'form.jpg',
                    heading: 'Form',
                    subHeading: 'Student Entry Form',
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.025,
                  ),
                  const Cards(
                    // routeName: '/form',
                    imgSrc: 'assignment.jpg',
                    heading: 'Fee',
                    subHeading: 'View current assignments',
                    routeName: 'feeInfo',
                  ),
                ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Cards(
                    // routeName: '/form',
                    imgSrc: 'attendance.jpg',
                    heading: 'Assignment',
                    subHeading: 'View attendance',
                    routeName: '/assignment_class',
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.025,
                  ),
                  const Cards(
                    // routeName: '/form',
                    imgSrc: 'attendance_2.jpg',
                    heading: 'Dummy',
                    subHeading: 'View current assignments',
                  ),
                ]),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
