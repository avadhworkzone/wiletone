import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../utils/color_utils.dart';

class SnackBarUtils {
  static fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        // backgroundColor: Appcolor.blackcolor,
        gravity: ToastGravity.BOTTOM);
  }

  static toastmessagecenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        // backgroundColor: Appcolor.blackcolor,
        gravity: ToastGravity.CENTER);
  }

  static snackBar({ required String message, Color? bgColor}){

    // Get.snackbar(title, message,snackPosition: SnackPosition.BOTTOM);
    Get.rawSnackbar(
      message: message,
      margin: const EdgeInsets.all(8.0),
      borderRadius: 8.0,
      forwardAnimationCurve: Curves.easeInOut,
      reverseAnimationCurve: Curves.easeInOut,
      duration: const Duration(seconds: 2),
      backgroundColor: bgColor ?? ColorUtils.greenColor,
    );
  }

}