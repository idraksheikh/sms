import 'package:flutter/material.dart';
import 'package:sms/Screens/home/home_page/teacher_home_page.dart';
import 'package:sms/Services/common.dart';

import '../../authentication/login_page.dart';
import 'home_page.dart';

class WrapperHomePage extends StatefulWidget {
  const WrapperHomePage({super.key});

  @override
  State<WrapperHomePage> createState() => _WrapperHomePageState();
}

class _WrapperHomePageState extends State<WrapperHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
          future: Common.checkUser(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Some Error Occure'),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data == 'ST') {
                return const MyHomePage();
              }
              if (snapshot.data == 'TA') {
                return const TeacherHomePage();
              }
              return const TeacherHomePage();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
