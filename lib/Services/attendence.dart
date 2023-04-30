import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms/Model/attendence.dart';

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
    } catch (e) {
      print(e);
    }
    print(StudentAttendence.working_days);
    print(StudentAttendence.total_absent);
    print(StudentAttendence.total_present);
    print(StudentAttendence.list_attendence);
    return StudentAttendence;
  }
}
