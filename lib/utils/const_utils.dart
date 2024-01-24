import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/common_loading_indicator.dart';

void logs(String message) {
  if (kDebugMode) {
    print(message);
  }
}

class ConstUtils {
  static const kPasswordLength = 6;
  static const kPhoneNumberLength = 10;
  static const reportNotesList = 6;
  static int incomeTransactionAdsCount = 1;
  static int expensesTransactionAdsCount = 1;
  static String androidPhoneBrand = '';
  static String deviceId = "";
  static String appVersion = "";
  static String contentPolicies = "https://www.google.com/";
  static String privacyPolicy = "https://www.google.com/";
  static String termsOfService = "https://www.google.com/";
  static const String baseIconAssetsPath = "assets/icons/";

  static void showLoader() {
    Get.dialog(
      PopScope(canPop: false, child: postDataLoadingIndicator()),
      barrierDismissible: false,
    );
  }

  static void closeLoader() {
    Get.back();
  }

  static String formatHHMMSS(int seconds) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}
