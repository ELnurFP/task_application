import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_list_app/common/language_drop_down.dart';

class SharedPrefHelper {
  static late SharedPreferences sharedPref;
  static Future<void> init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<void> setLanguage(String language) {
    return sharedPref.setString('lang', language);
  }

  static AppLanguages? getLanguage() {
    final String? lang = sharedPref.getString('lang');

    if (lang != null) {
      for (AppLanguages lang in AppLanguages.values) {
        if (lang.getLangName == lang) {
          return lang;
        }
      }
    }
    return null;
  }
}
