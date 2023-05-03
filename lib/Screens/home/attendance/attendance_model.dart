import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Attendence').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              final data = document.data()! as Map<String, dynamic>;
              print(data['dates']['27/04/2023']['attendence']);
              return ListTile(
                title: Text(data.toString()),
                // subtitle: Text(data['company']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}