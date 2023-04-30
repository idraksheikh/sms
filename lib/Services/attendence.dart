import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms/Model/attendence.dart';
import 'package:sms/Screens/home/attendance/attendance.dart';

class AttendenceManagement {
  Future<Map<String, bool>> getAttendence() async {
    Map<String, bool> StudentAttendence = <String, bool>{};

    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? registration_id = preferences.getString('registration_id');
      Attendence classAtt=await FirebaseFirestore.instance.collection('Attendence').get().then(((value) =>
        
     Attendence.fromJson(value.docs[0].data())
      ));
      print("hello");

      

      
      classAtt.dates?.forEach((key, value) {
        if (value.attendence?.containsKey(registration_id) ?? false) {
          StudentAttendence.putIfAbsent(
              key, () => value.attendence?[registration_id] ?? false);
        }
      });
      print(StudentAttendence);
    } catch (e) {
      print("Error");
      print(e);
    }

    return StudentAttendence;
  }
}
