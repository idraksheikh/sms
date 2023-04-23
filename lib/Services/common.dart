import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Admin.dart';
import '../Model/student.dart';
import '../Model/teacher.dart';

class Common{
   static Students? student;
   static Teachers? teacher;
   static Admins? admin;
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
}