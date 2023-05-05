import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms/Screens/widgets/attendance_card.dart';
import 'package:sms/Screens/widgets/cards.dart';
import 'package:sms/Screens/widgets/profileimage.dart';
import 'package:sms/Screens/widgets/spacer.dart';

import '../../../Model/attendence.dart';
import '../../../Services/attendence.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? name = ' ';

  final AttendenceManagement _attendee = AttendenceManagement();

  void getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('name');
      name = name!.split(' ')[0];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetAttendenceResponse>(
        future: _attendee.getAttendence(),
        builder: (context, AsyncSnapshot<GetAttendenceResponse> snapshot) {
          if (snapshot.hasError) {
            return const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: Text("Some error occured"),
                  ),
                ));
          }
          if (snapshot.hasData) {
            return Scaffold(
              body: SafeArea(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(245, 248, 254, 1),
                    // image: DecorationImage(image: AssetImage('assets/images/home.jpg'), fit: BoxFit.fill, opacity: 0.7)
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 15),
                                  child: Text(
                                    'Welcome, $name',
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
                          const Space(
                            width: 25,
                          ),
                          const ProfileCard(
                            imgSrc: 'icon.png',
                            routeName: '/profile',
                          ),
                        ],
                      ),
                      Center(
                          child: AttendanceCard(
                        routeName: '/attendance',
                        absent: snapshot.data!.total_absent,
                        present: snapshot.data!.total_present,
                      )),
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
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // const Cards(
                                  //   routeName: '/form',
                                  //   imgSrc: 'form.jpg',
                                  //   heading: 'Form',
                                  //   subHeading: 'Student Entry Form',
                                  // ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.025,
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
                              height:
                                  MediaQuery.of(context).size.height * 0.015,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Cards(
                                    // routeName: '/form',
                                    imgSrc: 'attendance.jpg',
                                    heading: 'Assignment',
                                    subHeading: 'View attendance',
                                    routeName: '/student_upload',
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.025,
                                  ),
                                  // const Cards(
                                  //   // routeName: '/form',
                                  //   imgSrc: 'attendance_2.jpg',
                                  //   heading: 'Dummy',
                                  //   subHeading: 'View current assignments',
                                  //   routeName: '/attendance_data',
                                  // ),
                                ]),
                          ]),
                    ],
                  ),
                ),
              ),
            );
          }
          return MaterialApp(
              home: Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text("Processing"),
                    ],
                  ),
                ),
              ));
        });
  }
}
