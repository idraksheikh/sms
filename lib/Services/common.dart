import 'package:shared_preferences/shared_preferences.dart';

class Common{
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