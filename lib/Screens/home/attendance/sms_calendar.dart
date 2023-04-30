import 'package:flutter/material.dart';
import 'package:sms/Model/attendence.dart';
import 'package:sms/Services/attendence.dart';

import '../../styles/font.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key, required this.height, required this.width, required this.attendance})
      : super(key: key);
  final double height;
  final double width;
  final Map<String, bool>? attendance;
  @override
  State<Calendar> createState() => _CalendarState();
}


class _CalendarState extends State<Calendar> {
  List weekdays = ['Na', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  int startDay = 1;
  bool check = false;
  int addMoreDays = 0;
  final AttendenceManagement _attendee = AttendenceManagement();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetAttendenceResponse>(

        future: _attendee.getAttendence(),
        builder: (context, AsyncSnapshot<GetAttendenceResponse> snapshot) {
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
              return Scaffold(
                body: ListView(
                  children: <Widget>[
                    Text(DateTime.parse(widget.attendance!.keys.elementAt(0).toString()).toString()),
                    Container(
                      width: widget.width,
                      height: widget.height * 1 / 14.4,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue.shade700,
                              Colors.blue.shade500
                            ]),
                        // borderRadius: BorderRadius.only(
                        //     bottomRight: Radius.circular(30),
                        //     bottomLeft: Radius.circular(30))
                      ),
                      child: GridView.builder(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          shrinkWrap: true,
                          itemCount: 7,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7),
                          itemBuilder: (context, index) {
                            return Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                // margin: const EdgeInsets.only(left: 15, right: 15),
                                child: Center(
                                    child: Text(
                                      weekdays[DateTime
                                          .utc(2023, 5, index + 1)
                                          .weekday],
                                      style: ThemeFontStyle(
                                          fontSize: 16, height: 0).style,
                                    )));
                            //  AssignmentCard(icon: Icons.picture_as_pdf_outlined, url: pdfData[index]['url'], heading: pdfData[index]['name'],)
                          }),
                    ),
                    Container(
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
                          itemCount: DateTime
                              .utc(2023, 6, 1)
                              .weekday % 30 == 0
                              ? 31
                              : 30 + DateTime
                              .utc(2023, 6, 1)
                              .weekday,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7),
                          itemBuilder: (context, index) {
                            if (DateTime
                                .utc(2023, 6, index + 1)
                                .weekday > startDay &&
                                check == false) {
                              addMoreDays++;
                              // startDay = DateTime.utc(2023,6,index+1).weekday;
                              return Card(
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  // margin: const EdgeInsets.only(left: 15, right: 15),
                                  child: const Center(child: Text(' ')));
                            } else {
                              check = true;
                              // for (final elements in snapshot.data!.list_attendence!.keys){
                              //
                              // }
                              // if DateTime
                              //     .utc(
                              //     2023, 6, index - addMoreDays + 1)
                              //     .day == {
                              //
                              // }
                              return Card(
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  // margin: const EdgeInsets.only(left: 15, right: 15),
                                  child: Center(
                                      child: Text(
                                        DateTime
                                            .utc(
                                            2023, 6, index - addMoreDays + 1)
                                            .day
                                            .toString(),
                                        style: ThemeFontStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.normal,
                                            height: 0)
                                            .style,
                                      )));
                              //  AssignmentCard(icon: Icons.picture_as_pdf_outlined, url: pdfData[index]['url'], heading: pdfData[index]['name'],)
                            }
                          }),
                    ),
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
          }
        });
  }
}
