import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms/Services/common.dart';

import '../../widgets/spacer.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({super.key});

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  Common _common=Common();
  String? name=' ';
  void getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('name');
      name=name!.split(' ')[0];
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
                  Container(
                alignment: Alignment.centerRight,
                height: 20,
                width: 20,
                margin: const EdgeInsets.only(top: 40,right: 20),
                child:  InkWell(
                  onTap: (() async{
                    await _common.logoutStudent();
                    Navigator.pushNamed(context, '/wrapper');
                  }),
                  child: const Image(
                    image: AssetImage('assets/images/logout.png'),
                  ),
                ),
              ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  
  }
}