import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms/Model/Admin.dart';
import 'package:sms/Model/student.dart';
import 'package:sms/Model/teacher.dart';
import 'package:sms/Services/common.dart';

class Authentication {
  Common _common=Common();
  Future<bool> login(String registrationId, String password) async {
    try {
      //Registration for Students...
      if (registrationId.startsWith('ST')) {
        Students? students = await FirebaseFirestore.instance
            .collection('Students')
            .where('registration_id', isEqualTo: registrationId)
            .get()
            .then((value) => value.docs.isNotEmpty
                ? Students.fromJson(value.docs[0].data())
                : null);
        if (students != null) {
          if (students.password == password) {
                await _common.setStudents(students);
            Fluttertoast.showToast(msg: "Login Successfull");
            return true;
          } else {
            Fluttertoast.showToast(msg: "Wrong Password.");
            return false;
          }
        }
        Fluttertoast.showToast(msg: "Student not found.");
        return false;
      }

      //Registration for Teachers...
      if (registrationId.startsWith('TA')) {
        Teachers? teachers = await FirebaseFirestore.instance
            .collection('Teachers')
            .where('registration_id', isEqualTo: registrationId)
            .get()
            .then((value) => value.docs.isNotEmpty
                ? Teachers.fromJson(value.docs[0].data())
                : null);
        if (teachers != null) {
          if (teachers.password == password) {
                await _common.setTeachers(teachers);
            Fluttertoast.showToast(msg: "Login Successfull");
            return true;
          } else {
            Fluttertoast.showToast(msg: "Wrong Password.");
            return false;
          }
        }
        Fluttertoast.showToast(msg: "Teacher not found.");
        return false;
      }
      //Registration for Admins...
      if (registrationId.startsWith('AD')) {
        Admins? admins = await FirebaseFirestore.instance
            .collection('Admins')
            .where('registration_id', isEqualTo: registrationId)
            .get()
            .then((value) => value.docs.isNotEmpty
                ? Admins.fromJson(value.docs[0].data())
                : null);
        if (admins != null) {
          if (admins.password == password) {
            SharedPreferences preference =
                await SharedPreferences.getInstance();
            preference.setString('registrationId', admins.registration_id!);
            preference.setString('password', admins.password!);
            Fluttertoast.showToast(msg: "Login Successfull");
            return true;
          } else {
            Fluttertoast.showToast(msg: "Wrong Password.");
            return false;
          }
        }
        Fluttertoast.showToast(msg: "Admin not found.");
        return false;
      }
      Fluttertoast.showToast(msg: "Not Done.");
      return false;
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
  }
}
