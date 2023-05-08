import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms/Services/common.dart';

import '../../../Model/Admin.dart';
import '../../styles/font.dart';
import '../../widgets/cards.dart';
import '../../widgets/spacer.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final Common _common = Common();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Welcome, Gurpreet',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(101, 103, 107, 1),
                      ),
                    ),
                  ),
                  Text(
                    'Your Details',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Space(height: 10),
                ]),
                const Space(
                  width: 25,
                ),
                Container(
                  alignment: Alignment.topRight,
                  height: 20,
                  // width: 20,
                  // margin: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: (() async {
                      SharedPreferences preference =
                          await SharedPreferences.getInstance();
                      preference.setString('registration_id', '');
                      preference.setString('password', '');
                      Navigator.pushNamed(context, '/wrapper');
                    }),
                    child: const Image(
                      image: AssetImage('assets/images/logout.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<Admins>(
              future: _common.getAdmins(),
              builder: (context, AsyncSnapshot<Admins> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Some Error occure");
                }
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        infoBox(context, 'Registration Id',
                            snapshot.data!.registration_id),
                        const Space(
                          height: 10,
                        ),
                        infoBox(context, 'Full Name', snapshot.data!.name),
                        const Space(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                }
                return const CircularProgressIndicator();
              }),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.025,
            ),
            const Cards(
              // routeName: '/form',
              imgSrc: 'student.jpg',
              heading: 'Student',
              subHeading: 'Add Student',
              routeName: 'feeInfo',
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Cards(
              // routeName: '/form',
              imgSrc: 'teacher.jpg',
              heading: 'Teacher',
              subHeading: 'Add Teacher',
              routeName: '/student_upload',
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.025,
            ),
          ]),
        ],
      ),
    );
  }

  Widget infoBox(BuildContext context, String? infokey, String? infovalue) {
    return Container(
      height: 60,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.green.shade50,
      ),
      child: infovalue == ""
          ? Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                infokey!,
                style: ThemeFontStyle(fontSize: 26).style,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child:
                      Text(infokey!, style: ThemeFontStyle(fontSize: 12,color: const Color.fromARGB(255, 7, 0, 0)).style),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    infovalue!,
                    style: ThemeFontStyle(
                            fontSize: 14, fontWeight: FontWeight.normal,color: const Color.fromARGB(255, 7, 0, 0))
                        .style,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
    );
  }
  
}
