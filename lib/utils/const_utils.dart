import 'dart:io';

import 'package:flutter/foundation.dart';

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
}
