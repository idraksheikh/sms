import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms/Model/student.dart';

class Common {
  // Check the Visit...
  static Future<bool> checkPreviousVisit() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool('isVisited') != null) {
      if (preferences.getBool('isVisited')!) {
        return true;
      }
      return false;
    } else {
      preferences.setBool('isVisited', true);
      return false;
    }
  }

   setStudents(Students? students) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('address', students!.address ?? '');
    preferences.setString('standard', students.standard ?? '');
    preferences.setString('dob', students.dob ?? '');
    preferences.setString('mobile', students.mobile ?? '');
    preferences.setString('name', students.name ?? '');
    preferences.setString('password', students.password ?? '');
    preferences.setString('registration_id', students.registration_id ?? 'ST202301001');
    preferences.setString('year_of_joining', students.year_of_joining ?? '');
  }

   Future<Students> getStudents() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Students students = Students();

    students.address = preferences.getString('address');
    students.standard = preferences.getString('standard');
    students.dob = preferences.getString('dob');
    students.mobile = preferences.getString('mobile');
    students.name = preferences.getString('name');
    students.password = preferences.getString('password');
    students.registration_id = preferences.getString('registration_id');
    students.year_of_joining = preferences.getString('year_of_joining');
    return students;
  }
}
