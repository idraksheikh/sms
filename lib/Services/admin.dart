import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sms/Model/student.dart';

class AdminManagement {
  Future<bool> addStudent(
      String registration_id,
      String name,
      String address,
      String mobile,
      String standard,
      String yearofjoining,
      String dob,
      String password) async {
    try {
      int stds = await FirebaseFirestore.instance
          .collection("Students")
          .where('registration_id', isEqualTo: registration_id)
          .get()
          .then((value) => value.docs.toList().length);
      if (stds == 0) {
        FirebaseFirestore.instance
            .collection("Students")
            .doc(registration_id)
            .set({
          'registration_id': registration_id,
          'name': name,
          'address': address,
          'mobile': mobile,
          'standard': standard,
          'year_of_joining': yearofjoining,
          'dob': dob,
          'password': password,
        });
      } else {
        Fluttertoast.showToast(
            msg: "Student Exists with following Registration Id",
            backgroundColor: Colors.yellow.shade300);
        return false;
      }
       Fluttertoast.showToast(
          msg: "Student Added",
          backgroundColor: Colors.green.shade300);
      return true;
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: "Error occure",
          backgroundColor: Colors.red.shade300);
      return false;
    }
  }
}
