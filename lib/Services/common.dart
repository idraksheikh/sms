import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms/Model/Admin.dart';
import 'package:sms/Model/student.dart';

import '../Model/teacher.dart';

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

  // Check the user is login or not...
  static Future<bool> checkUserLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString('registration_id') != '') return true;
    print("Not Login Or Logout.");
    return false;
  }

  // Check the User ...
  static Future<String> checkUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString('registration_id')!.startsWith('ST')) {
      return 'ST';
    } else if (preferences.getString('registration_id')!.startsWith('TA')) {
      return 'TA';
    }
    return 'AD';
  }

  // Set Student After Login...
  setStudents(Students? students) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('address', students!.address ?? '');
    preferences.setString('standard', students.standard ?? '');
    preferences.setString('dob', students.dob ?? '');
    preferences.setString('mobile', students.mobile ?? '');
    preferences.setString('name', students.name ?? '');
    preferences.setString('password', students.password ?? '');
    preferences.setString('registration_id', students.registration_id ?? '');
    preferences.setString('year_of_joining', students.year_of_joining ?? '');
  }

  // Set Teacher After Login...
  setTeachers(Teachers? teachrs) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('address', teachrs!.address ?? '');
    preferences.setString('subject', teachrs.subject ?? '');
    preferences.setString('mobile', teachrs.mobile ?? '');
    preferences.setString('name', teachrs.name ?? '');
    preferences.setString('password', teachrs.password ?? '');
    preferences.setString('registration_id', teachrs.registration_id ?? '');
    preferences.setString('year_of_joining', teachrs.year_of_joining ?? '');
    String tempClasses = "";
    if (teachrs.classes != null) {
      for (int i = 0; i < teachrs.classes!.length; i++) {
        tempClasses += "${teachrs.classes![i]} ";
      }
    }
    preferences.setString('classes', tempClasses.trimRight());
  }

  // Set Admin After Login...
  setAdmins(Admins? admins) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('registration_id', admins!.registration_id ?? '');
    preferences.setString('name', admins.name ?? '');
  }

  // Get Student...
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

  // Get Teacher...
  Future<Teachers> getTeachers() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Teachers teachers = Teachers();

    teachers.address = preferences.getString('address');
    teachers.subject = preferences.getString('subject');
    teachers.mobile = preferences.getString('mobile');
    teachers.name = preferences.getString('name');
    teachers.password = preferences.getString('password');
    teachers.registration_id = preferences.getString('registration_id');
    teachers.year_of_joining = preferences.getString('year_of_joining');
    List<String> clsses = <String>[];
    if (preferences.get('classes') != "") {
      String tempClasses = preferences.get('classes').toString();
      clsses.addAll(tempClasses.split(" ").toList().map((e) => e));
    }
    teachers.classes = clsses;
    return teachers;
  }

  // Get Admin...
  Future<Admins> getAdmins() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Admins admins = Admins();

    admins.registration_id = preferences.getString('registration_id');
    admins.name = preferences.getString('name');
    
    return admins;
  }

  // Logout...
  logoutStudent() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('address', '');
    preferences.setString('standard', '');
    preferences.setString('dob', '');
    preferences.setString('mobile', '');
    preferences.setString('name', '');
    preferences.setString('password', '');
    preferences.setString('registration_id', '');
    preferences.setString('year_of_joining', '');
  }
}
