import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static final getStorage = GetStorage();

  static String accessToken = 'ACCESS_TOKEN';
  static String ownerName = 'OWNER_NAME';
  static String ownerMobile = 'OWNER_MOBILE';

  /// ================== SET STRING VALUE ================== ///
  static Future<void> setString({required String key, required String value}) async {
    await getStorage.write(key, value);
  }

  static String getString(String key) {
    return getStorage.read(key) ?? "";
  }

  /// ================== SET BOOL VALUE ================== ///
  static Future<void> setBool({required String key, required bool value}) async {
    await getStorage.write(key, value);
  }

  static  bool getBool(String key) {
    return getStorage.read(key) ?? false;
  }

  static Future<void> clearData() async {
    await getStorage.erase();
  }
}
