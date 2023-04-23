import 'package:flutter/material.dart';
import 'package:sms/Services/common.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 40),
            child: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 40),
            child: Text(
              'PROFILE IMAGE',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage("assets/images/profile.jpg")),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 40),
            child: Text(
              'STUDENT DETAILS',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          infoBox(context, 'Registration Id', Common.student!.registration_id),
          const SizedBox(
            height: 10,
          ),
          infoBox(context, 'Full Name', Common.student!.name),
          const SizedBox(
            height: 10,
          ),
          infoBox(context, 'Class', Common.student!.standard),
          const SizedBox(
            height: 10,
          ),
          infoBox(context, 'Phone Number', Common.student!.mobile),
          const SizedBox(
            height: 10,
          ),
          infoBox(context, 'Address', Common.student!.address),
        ],
      ),
    );
  }
  Widget infoBox(BuildContext context,String? infokey, String? infovalue){
    return    Container(
            height: 60,
            width: 280,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.shade100,
            ),
            child: Column(
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
                  child:  Text(
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
