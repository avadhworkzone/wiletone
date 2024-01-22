import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManagerUtils {
  static final getStorage = GetStorage();
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }
  static String dialCode = 'dialCode';
  static String countryCode = "countryCode";
  static String allCountryCurrency = "countryCode";
  static String countryName = "countryName";
  static String userToken = "userToken";

  static Future<void> initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  ///setUserToken
  static Future<void> setUserToken(String value) async {
    await _preferences.setString(userToken, value);
  }

  static String? getUserToken() {
    return _preferences.getString(userToken) ;
  }

  ///setCountryName
  static Future setCountryName(String value) async {
    await getStorage.write(countryName, value);
  }

  static String getCountryName() {
    return getStorage.read(countryName) ?? "IN";
  }

  ///setCountryCode
  static Future setCountryCode(String value) async {
    await getStorage.write(countryCode, value);
  }

  static String getCountryCode() {
    return getStorage.read(countryCode) ?? "91";
  }
}
