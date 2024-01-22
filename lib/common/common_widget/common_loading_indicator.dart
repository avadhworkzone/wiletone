/// KEY : circleIndicator
/// Desc. : Add Full Screen Circle Indicator And Only Circle Indicator
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wilatone_restaurant/utils/variables_utils.dart';

import '../../utils/color_utils.dart';

Container postDataLoadingIndicator({Color? color}) {
  return Container(
      height: Get.height,
      width: Get.width,
      // color: color ?? ColorUtils.greyE6,
      child: getDataLoadingIndicator());
}

Widget getDataLoadingIndicator() {
  // ignore: prefer_const_constructors
  return Center(
    child: const CircularProgressIndicator(
      // ignore: prefer_const_constructors
      valueColor: AlwaysStoppedAnimation<Color>(ColorUtils.skyBlue),
    ),
  );
}

Widget getDataErrorMsg() {
  return const Center(
    child: Text(VariablesUtils.somethingWentWrong),
  );
}

Widget getNotApplicableMsg({String? msg}) {
  return Center(
    child: Text(msg ?? VariablesUtils.notApplicable),
  );
}

Widget getFieldIsEmptyMsg() {
  return const Center(
    child: Text(VariablesUtils.fieldEmpty),
  );
}

Widget emptyMsg() {
  return const Center(
    child: Text(VariablesUtils.noData),
  );
}
