import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManagerUtils {
  static final getStorage = GetStorage();

  static String dialCode = 'dialCode';
  static String countryCode = "countryCode";
  static String allCountryCurrency = "countryCode";
  static String countryName = "countryName";


  static String token = 'token';
  static String login = 'login';

  ///Check UserLogin
  static Future setIsLogin(bool val) async {
    await getStorage.write(login, val);
  }

  static bool getIsLogin() {
    return getStorage.read(login) ?? false;
  }

  ///Get Token
  static Future setToken(String val) async {
    await getStorage.write(token, val);
  }

  static getToken() {
    return getStorage.read(token) ?? '';
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

  static Future<void> clearData() async {
    await getStorage.erase();
  }
}
