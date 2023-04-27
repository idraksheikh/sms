import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sms/Screens/home/home_page/home_page.dart';
import 'package:sms/Screens/home/home_page/home_page_wrapper.dart';
import 'package:sms/Services/common.dart';
import 'authentication/login_page.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
          future: Common.checkUserLogin(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Some Error Occure'),
              );
            }
            if (snapshot.hasData) {
              return snapshot.data ? const WrapperHomePage() : LoginPage();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
