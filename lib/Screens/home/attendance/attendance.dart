
import 'package:flutter/material.dart';
import 'package:sms/Screens/home/attendance/sms_calendar.dart';
import 'package:sms/Screens/home/attendance/total.dart';
import '../../../Model/attendence.dart';
import '../../../Services/attendence.dart';
import '../../styles/font.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  // DateRange? selectedDateRange;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final AttendenceManagement attendee = AttendenceManagement();
    return FutureBuilder<GetAttendenceResponse>(

        future: attendee.getAttendence(),
        builder: (context, AsyncSnapshot<GetAttendenceResponse> snapshot)
        {
      {
        if (snapshot.hasError) {
          return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Text("Some error occure"),
                ),
              ));
        }
        if (snapshot.hasData) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Attendance'),
                centerTitle: true,
              ),
              body: ListView(
                children: <Widget>[
                  SizedBox(
                      height: height * 1 / 2.4,
                      child: Calendar(
                        height: height,
                        width: width,
                        attendance: snapshot.data!.list_attendence,
                      )),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Total Working Days',
                            style: ThemeFontStyle(fontSize: 23, color: Colors
                                .black)
                                .style,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(12),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.blue.shade300,
                          ),
                          child: Text(
                            snapshot.data!.working_days.toString(),
                            style: ThemeFontStyle(fontSize: 20, color: Colors
                                .white)
                                .style,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Total(
                          heading: 'Present',
                          days: snapshot.data!.total_present.toString(),
                          colors: const Color.fromRGBO(254, 58, 144, 1)),
                      Total(
                          heading: 'Absent',
                          days: snapshot.data!.total_absent.toString(),
                          colors: const Color.fromRGBO(1, 214, 255, 1)),
                    ],
                  ),
                ],
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
                    // Text("Processing"),
                  ],
                ),
              ),
            ));
      }
  });
  }
}
