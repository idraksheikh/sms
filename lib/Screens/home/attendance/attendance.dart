import 'package:calendar_agenda/calendar_agenda.dart';

import 'package:flutter/material.dart';
import 'package:sms/Screens/home/attendance/total.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Center(
                      child: Text(
                    'Attendance',
                    style:
                        ThemeFontStyle(fontSize: 22, color: Colors.black).style,
                  )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.blue, Colors.white]),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    // margin: const EdgeInsets.only(left: 15, right: 15),
                    child: CalendarAgenda(
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(const Duration(days: 140)),
                      lastDate: DateTime.now().add(const Duration(days: 4)),
                      padding: 15,
                      onDateSelected: (date) {
                        print(date);
                      },
                    )
                  ),
                ),
              ],
            ),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Total Working Days',
                      style: ThemeFontStyle(fontSize: 23, color: Colors.black)
                          .style,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.blue,
                    ),
                    child: Text(
                      '24',
                      style: ThemeFontStyle(fontSize: 18, color: Colors.black)
                          .style,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Total(
                    heading: 'Present',
                    colors: Color.fromRGBO(254, 58, 144, 1)),
                Total(
                    heading: 'Absent', colors: Color.fromRGBO(1, 214, 255, 1)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
