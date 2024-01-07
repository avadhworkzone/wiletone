import 'package:get_storage/get_storage.dart';

class PreferenceManagerUtils {
  static final getStorage = GetStorage();

  static String lang = 'lang';

  ///Language
  static Future setLang(String value) async {
    await getStorage.write(lang, value);
  }

  static String getLang() {
    return getStorage.read(lang) ?? "en";
  }
}
