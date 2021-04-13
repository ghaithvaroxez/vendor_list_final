import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  ///keys
  //static SharedPreferences preferences = await SharedPreferences.getInstance();
  ///save data

//id
  static saveCompany(String id) async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("saved to database");
    return preferences.setBool(id, true);
  }
  static Future<List<String>> getStoredData() async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getKeys().toList();
  }
  //realName
  static unSaveCompany(String id) async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("removed to database");
    return preferences.remove(id);
  }

//displayName
  static Future<bool> isSaved(String id) async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // return preferences.getKeys() == null ? false : true;
    return preferences.get(id) == null ? false : true;
  }
}