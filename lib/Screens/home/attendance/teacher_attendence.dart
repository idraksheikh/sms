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
  String? selectedClass;
  int count = 0;
  void updateValue(String val) {
    setState(() {
      selectedClass = val;
    });
  }

  Future<List<String>> getList() async {
    List<String> list;
    list = (await Common().getTeachers()).classes!.toList();
    if (count++ == 0) {
      setState(() {
        selectedClass = list[0];
      });
    }

    return list;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
           Center(
            child: Text(
              'Upload Attendence',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade900,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: FutureBuilder<List<String>>(
                future: getList(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Some Error');
                  }
                  if (snapshot.hasData) {
                    return DropdownButton<String>(
                      underline: Container(
                        height: 0,
                        color: Colors.transparent,
                      ),
                      isExpanded: true,
                      elevation: 8,
                      focusColor: Colors.teal.shade100,
                      dropdownColor: Colors.teal.shade50,
                      icon: Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.teal.shade600,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      hint: const Text("Select a Class"),
                      value: selectedClass,
                      onChanged: ((String? value) => updateValue(value!)),
                      items:
                          snapshot.data.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            'Class $value',
                            style: TextStyle(
                              color: Colors.teal.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
                  return const CircularProgressIndicator();
                }),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
