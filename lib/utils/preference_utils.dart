import 'package:get_storage/get_storage.dart';

class PreferenceManagerUtils {
  static final getStorage = GetStorage();

  static String dialCode = 'dialCode';
  static String countryCode = "countryCode";
  static String allCountryCurrency = "countryCode";
  static String countryName = "countryName";

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
