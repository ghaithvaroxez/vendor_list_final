import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_list/widgets/widgets.dart';

class SharedPreferenceHelper {
  ///keys
  //static SharedPreferences preferences = await SharedPreferences.getInstance();
  ///save data
static String tokenKey="TokenKey";
static String boolTokenKey="boolTokenKey";
static String languageKey="languagekey";


static saveLanguage(bool k)
async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  english=k;
  return preferences.setBool(languageKey, k);
}
static getLanguage()async
{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool(languageKey);
}
static Future<bool> firstTime()async
{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool(languageKey)==null?true:false;
}

//id
  static saveCompany(String id) async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("saved to database");
    return preferences.setBool(id, true);
  }
  static saveToken(String id) async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("saved to database");
    preferences.setBool(boolTokenKey, true);
    return preferences.setString(tokenKey, id);
  }
  static Future<String>getToken()async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("fetched to database");
    return preferences.getString(tokenKey);
  }
  static Future<bool> dontHaveToken()
  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(boolTokenKey)==null ?true:false;
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