import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms/Model/attendence.dart';
import 'package:sms/Model/student.dart';

class AttendenceManagement {
  Future<GetAttendenceResponse> getAttendence() async {
    GetAttendenceResponse StudentAttendence = GetAttendenceResponse();
    int working_days = 0;
    int total_absent = 0;
    int total_present = 0;
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? registration_id = preferences.getString('registration_id');
      Attendence classAtt = await FirebaseFirestore.instance
          .collection('Attendence')
          .get()
          .then(((value) => Attendence.fromJson(value.docs[0].data())));

      classAtt.dates?.forEach((key, value) {
        if (value.attendence?[registration_id] != null) {
          if (value.attendence?.containsKey(registration_id) ?? false) {
            StudentAttendence.list_attendence?.putIfAbsent(
                key, () => value.attendence?[registration_id] ?? false);

            if (value.attendence?[registration_id] ?? false) {
              total_present++;
            } else {
              total_absent++;
            }
          }
          working_days++;
        }
      });
      StudentAttendence.working_days = working_days.toString();
      StudentAttendence.total_present = total_present.toString();
      StudentAttendence.total_absent = total_absent.toString();
    } catch (e) {}
    return StudentAttendence;
  }

  Future<List<StudentList>> getStudentList(String? standard) async {
    List<StudentList> stdList = <StudentList>[];
    List<Students> stds = <Students>[];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("Students").get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      dynamic a = querySnapshot.docs[i].data();
      stds.add(Students.fromJson(a));
    }

    stds.forEach((element) {
      if (element.standard == standard) {
        StudentList st = StudentList();
        st.studentsRegId = element.registration_id;
        st.present = false;
        stdList.add(st);
      }
    });

    return stdList;
  }

  Future<String> submitAttendence(
      String date, List<StudentList> stdList) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? registration_id = preferences.getString('registration_id');
      Attendence classAtt = await FirebaseFirestore.instance
          .collection('Attendence')
          .get()
          .then(((value) => Attendence.fromJson(value.docs[0].data())));

      Dates dates = Dates();
      if (registration_id != null) {
        dates.teacher_id = registration_id;
        dates.attendence = <String, bool>{};

        for (var element in stdList) {
          dates.attendence!.putIfAbsent(
              element.studentsRegId ?? 'empty', () => element.present ?? false);
        }
        print(date);
        classAtt.dates!.putIfAbsent(date, () => dates);
        FirebaseFirestore.instance
            .collection('Attendence')
            .doc('class1')
            .set(classAtt.toJson());

        return "Sucessfull";
      }
      return 'error';
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
