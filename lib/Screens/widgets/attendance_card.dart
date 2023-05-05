import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms/Screens/widgets/spacer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../Model/attendence.dart';
import '../../Services/attendence.dart';

class AttendanceCard extends StatefulWidget {
  final String routeName;
  final String imgSrc;
  final String heading;
  final String? present;
  final String? absent;


  const AttendanceCard({
    Key? key,
    this.routeName = '/home',
    this.imgSrc = 'cards.png',
    this.heading = 'Heading',
    this.absent = '1',
    this.present = '2',
  }) : super(key: key);

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  final AttendenceManagement _attendee = AttendenceManagement();

  double? tPresent;
  double? tAbsent;
  double? totalAttendancePercentage;

  @override
  void initState() {
   attendancePercentage();
    super.initState();
  }

  Future attendancePercentage() async {
  tAbsent = double.tryParse(widget.absent ?? '1');
  tPresent = double.parse(widget.present ?? '2');
  totalAttendancePercentage = tPresent!/(tPresent!+tAbsent!) * 100;
  return totalAttendancePercentage;
}

  @override
  Widget build(BuildContext context) {
    attendancePercentage();
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
            return InkWell(
              focusColor: Colors.white,
              borderRadius: BorderRadius.circular(24),
              splashColor: Colors.white,
              onTap: () {
                Navigator.pushNamed(context, widget.routeName);
              },
              child: Card(
                // elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.16,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.92,
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
                        currentStep: totalAttendancePercentage!.toInt(),
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
                              "${totalAttendancePercentage!.toInt()}%",
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
                            'Last updated - April. 30. 2023',
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
