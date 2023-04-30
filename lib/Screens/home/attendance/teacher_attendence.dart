import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sms/Services/common.dart';

class TeacherAttendence extends StatefulWidget {
  const TeacherAttendence({super.key});

  @override
  State<TeacherAttendence> createState() => _TeacherAttendenceState();
}

class _TeacherAttendenceState extends State<TeacherAttendence> {
  Future<List<String>> getList() async {
    List<String> list;
    list = (await Common().getTeachers()).classes!.toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<List<String>>(
              future: getList(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return const Text('Some Error');
                }
                if (snapshot.hasData) {
                  return DropdownButton<String>(
                    value: snapshot.data[0],
                    items: snapshot.data.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text('Class $value'),
                      );
                    }).toList(),
                    onChanged: ((value) => value),
                  );
                }
                return const CircularProgressIndicator();
              }),
        ],
      ),
    );
  }
}
