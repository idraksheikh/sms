import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/spacer.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top:30,left: 15, right: 15),
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
    );
  }
}
