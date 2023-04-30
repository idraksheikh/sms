import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms/Model/teacher.dart';
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
                            'Your Details',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontSize: 20,
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
                alignment: Alignment.topRight,
                height: 20,
                width: 20,
                margin: const EdgeInsets.only(right: 20),
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
              FutureBuilder<Teachers>(
              future: _common.getTeachers(),
              builder: (context, AsyncSnapshot<Teachers> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Some Error occure");
                }
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      
                      infoBox(context, 'Registration Id',
                          snapshot.data!.registration_id),
                      const SizedBox(
                        height: 10,
                      ),
                      infoBox(context, 'Full Name', snapshot.data!.name),
                      const SizedBox(
                        height: 10,
                      ),
                      infoBox(context, 'Class', snapshot.data!.subject),
                      const SizedBox(
                        height: 10,
                      ),
                      infoBox(context, 'Phone Number', snapshot.data!.mobile),
                      const SizedBox(
                        height: 10,
                      ),
                      infoBox(context, 'Address', snapshot.data!.address),
                      const SizedBox(
                        height: 10,
                      ),
                      infoBox(context, 'Classes Alloted', snapshot.data!.classes?.map((e) => e).toString() ?? ""),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: (() {
                          Navigator.pushNamed(context, '/teacher_attendence');
                        }),
                        child: infoBox(context, 'Add Attendance', ""),
                      )
                      
                    ],
                  );
                }
                return const CircularProgressIndicator();
              }),
            ],
          ),
        ),
      ),
    );
  
  }
    Widget infoBox(BuildContext context, String? infokey, String? infovalue) {
    return Container(
      height: 60,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.grey.shade100,
      ),
      child: 
      infovalue==""?
      Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              infokey!,
              style: TextStyle(
                fontSize: 26,
                color: Colors.grey.shade600,
              ),
            ),
          )
      :
      
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              infokey!,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              infovalue!,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
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