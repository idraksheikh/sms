import 'package:flutter/material.dart';
import 'package:sms/Screens/home/assigments/assignment_upload.dart';
import 'package:sms/Screens/home/fees/fee_information.dart';
import 'package:sms/Screens/forms.dart';
import 'package:sms/Screens/home/home_page/home_page.dart';
import 'package:sms/Screens/home/attendance/attendance.dart';
import 'package:sms/Screens/home/profile/profile.dart';
import 'package:sms/Screens/intro/intro.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:sms/Screens/wrapper.dart';
import 'package:sms/Services/Common.dart';

import 'Screens/authentication/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SMS());
}

class SMS extends StatefulWidget {
  const SMS({super.key});

  @override
  State<SMS> createState() => _SMSState();
}

class _SMSState extends State<SMS> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder<bool>(
        future: Common.checkPreviousVisit(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
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
            if (snapshot.data!) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: const Wrapper(),
                routes: {
                  '/home': (context) => const MyHomePage(),
                  '/form': (context) => EntryForm(),
                  '/login': (context) => LoginPage(),
                  '/profile': (context) => const Profile(),
                  'feeInfo': (context) => const FeeInformation(),
                  '/assignment': (context) => const AssignmentUpload(),
                  '/attendance': (context) => const Attendance(),
                  '/wrapper': (context) => const Wrapper(),
                },
              );
            } else {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: const IntroPage(),
                routes: {
                  '/home': (context) => const MyHomePage(),
                  '/form': (context) => EntryForm(),
                  '/login': (context) => LoginPage(),
                  '/profile': (context) => const Profile(),
                  'feeInfo': (context) => const FeeInformation(),
                  '/assignment': (context) => const AssignmentUpload(),
                  '/attendance': (context) => const Attendance(),
                  '/wrapper': (context) => const Wrapper(),
                },
              );
            }
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
