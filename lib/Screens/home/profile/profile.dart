import 'package:flutter/material.dart';
import 'package:sms/Model/student.dart';
import 'package:sms/Screens/styles/font.dart';
import 'package:sms/Screens/widgets/spacer.dart';
import 'package:sms/Services/common.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Common _common = Common();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // alignment: Alignment.centerLeft,
                height: 20,
                width: 20,
                margin: const EdgeInsets.only(top: 20, left: 20),
                child: InkWell(
                  onTap: (() async {
                    Navigator.pop(context);
                  }),
                  child: const Image(
                    image: AssetImage('assets/images/leftarrow.png'),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  'Profile',
                  style: ThemeFontStyle(fontSize: 22, color: Colors.black).style,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                height: 20,
                width: 20,
                margin: const EdgeInsets.only(top: 20, right: 20),
                child: InkWell(
                  onTap: (() async {
                    await _common.logoutStudent();
                    Navigator.pushReplacementNamed(context, '/wrapper');
                  }),
                  child: const Image(
                    image: AssetImage('assets/images/logout.png'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          FutureBuilder<Students>(
              future: _common.getStudents(),
              builder: (context, AsyncSnapshot<Students> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Some Error occure");
                }
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Container(
                      //   alignment: Alignment.topLeft,
                      //   margin: const EdgeInsets.only(left: 40),
                      //   child: Text(
                      //     'PROFILE IMAGE',
                      //     style: TextStyle(
                      //       fontSize: 14,
                      //       color: Colors.grey.shade500,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   alignment: Alignment.center,
                      //   height: 150,
                      //   width: 150,
                      //   decoration: const BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(20)),
                      //     image: DecorationImage(
                      //         alignment: Alignment.center,
                      //         image: AssetImage("assets/images/icon.png")),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 40),
                        child: Text(
                          'STUDENT DETAILS',
                          style: ThemeFontStyle(fontSize: 17, color: Colors.grey.shade400).style
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      infoBox(context, 'Registration Id',
                          snapshot.data!.registration_id),
                      const SizedBox(
                        height: 10,
                      ),
                      infoBox(context, 'First Name', snapshot.data!.name!.split(' ')[0]),
                      const SizedBox(
                        height: 10,
                      ),
                      infoBox(context, 'Last Name', snapshot.data!.name!.split(' ')[1]),
                      const SizedBox(
                        height: 10,
                      ),
                      infoBox(context, 'Class', snapshot.data!.standard),
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
                      infoBox(context, 'Date of Birth', snapshot.data!.dob),
                      const SizedBox(
                        height: 10,
                      ),
                      infoBox(context, 'Year of joining',
                          snapshot.data!.year_of_joining),
                    ],
                  );
                }
                return const CircularProgressIndicator();
              }),
          
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
        color: Colors.grey.shade100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
