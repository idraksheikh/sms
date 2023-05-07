import 'package:flutter/material.dart';

import '../../styles/font.dart';

class CalendarMonth extends StatefulWidget {
  final double height;
  final double width;
  final List<DateTime> presentDates;
  final List<DateTime> absentDates;
  final int month;

  const CalendarMonth(
      {Key? key,
      required this.height,
      required this.width,
      required this.month,
      required this.presentDates,
      required this.absentDates})
      : super(key: key);

  @override
  State<CalendarMonth> createState() => _CalendarMonthState();
}

class _CalendarMonthState extends State<CalendarMonth> {
  @override
  Widget build(BuildContext context) {
    int startDay = 1;
    bool check = false;
    int addMoreDays = 0;
    int present = 0;
    int absent = 0;
    int monthDay = DateTime(2023, widget.month, 1).weekday;
    var presentDates = widget.presentDates
        .where((element) => element.month == widget.month)
        .toList();
    var absentDates = widget.absentDates
        .where((element) => element.month == widget.month)
        .toList();
    return Container(
      width: widget.width,
      height: widget.height * 1 / 3.15,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.white]),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30))),
      child: GridView.builder(
          padding: const EdgeInsets.only(left: 10, right: 10),
          shrinkWrap: true,
          itemCount: (widget.month % 2 == 0 ? 29 : 30) + monthDay,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7),
          itemBuilder: (context, index) {
            if (monthDay > startDay && check == false) {
              monthDay = monthDay - 1;
              addMoreDays++;
              return Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(child: Text(' ')));
            } else {
              check = true;
              if (presentDates[present].day == (index - addMoreDays + 1)) {
                if (present < presentDates.length - 1){
                  present++;
                }
                return Card(
                    elevation: 3,
                    color: const Color.fromRGBO(254, 58, 144, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                      (index - addMoreDays + 1).toString(),
                      style: ThemeFontStyle(
                              fontSize: 11, color: Colors.white, height: 0)
                          .style,
                    )));

              }
              if (absentDates[absent].day == (index - addMoreDays + 1)) {
                if (absent < absentDates.length - 1){
                  absent++;
                }
                return Card(
                    elevation: 3,
                    color: const Color.fromRGBO(1, 214, 255, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    // margin: const EdgeInsets.only(left: 15, right: 15),
                    child: Center(
                        child: Text(
                      (index - addMoreDays + 1).toString(),
                      style: ThemeFontStyle(
                              fontSize: 11, color: Colors.white, height: 0)
                          .style,
                    )));
              } else {
                return Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                      (index - addMoreDays + 1).toString(),
                      style: ThemeFontStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                              height: 0)
                          .style,
                    )));
              }
            }
          }),
    );
  }
}
