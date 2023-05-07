import 'package:flutter/material.dart';
import 'package:sms/Model/attendence.dart';
import 'package:sms/Screens/home/attendance/calendar.dart';
import 'package:sms/Services/attendence.dart';

import '../../styles/font.dart';

class Calendar extends StatefulWidget {
  const Calendar(
      {Key? key,
      required this.height,
      required this.width,
      required this.attendance})
      : super(key: key);
  final double height;
  final double width;
  final Map<String, bool>? attendance;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  int startDay = 1;
  bool check = false;
  int addMoreDays = 0;
  List<DateTime> presentDates = [];
  List<DateTime> absentDates = [];

  // Iterable<DateTime> presentMonthDates = [];
  // Iterable<DateTime> absentMonthDates = [];
  int present = 0;
  int month = 5;
  int absent = 0;
  int? monthDay;
  Color enabled = Colors.black;
  final AttendenceManagement _attendee = AttendenceManagement();

  void getDates() {
    if (widget.attendance != null) {
      widget.attendance?.forEach((key, value) {
        if (value == true) {
          presentDates.add(DateTime.parse(key));
        } else {
          absentDates.add(DateTime.parse(key));
        }
      });
    }
    presentDates.sort((a, b) => a.compareTo(b));
    absentDates.sort((a, b) => a.compareTo(b));
  }

  @override
  void initState() {
    getDates();
    month = presentDates.first.month;
    super.initState();
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
                    child: Text("Some error occurred"),
                  ),
                ));
          }
          if (snapshot.hasData) {
            return Scaffold(
              body: ListView(
                children: <Widget>[
                  // Month logic below
                  Container(
                    width: widget.width,
                    height: widget.height * 1 / 20.6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (presentDates.first.month < month) {
                                setState(() {
                                  month -= 1;
                                });
                              }
                            },
                            icon: const Icon(Icons.arrow_back_ios), color: enabled,),

                        Text(
                          months[month - 1],
                          style:
                              ThemeFontStyle(fontSize: 20, color: Colors.black)
                                  .style,
                        ),
                        IconButton(
                            onPressed: () {
                              if (presentDates.last.month > month) {
                                setState(() {
                                  month += 1;
                                });
                              }
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded)),
                      ],
                    ),
                  ),

                  // Weekday logic below
                  Container(
                    width: widget.width,
                    height: widget.height * 1 / 20.6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.blue.shade700, Colors.blue.shade500]),
                    ),
                    child: GridView.builder(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        shrinkWrap: true,
                        itemCount: 7,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 7),
                        itemBuilder: (context, index) {
                          return Center(
                              child: Text(
                            weekdays[index],
                            style: ThemeFontStyle(
                                    fontSize: 14.5,
                                    height: 0,
                                    color: Colors.black38)
                                .style,
                          ));
                        }),
                  ),

                  // Calendar logic below
                  CalendarMonth(
                      height: widget.height,
                      width: widget.width,
                      month: month,
                      presentDates: presentDates,
                      absentDates: absentDates)
                ],
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
