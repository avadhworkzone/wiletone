import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';

import '../../utils/font_style_utils.dart';
import '../../utils/size_config_utils.dart';
import '../../utils/variables_utils.dart';

Future<dynamic> willToneCommonDialog(String title) async {
  return await Get.dialog(Dialog(
    backgroundColor: ColorUtils.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.w)),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: ColorUtils.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(40.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WileToneTextWidget(
              title: title,
              fontSize: 14.sp,
              textAlign: TextAlign.center,
            ),
            SizeConfig.sH10(),
            WileToneCustomButton(
              onPressed: () {
                Get.back();
              },
              isBorderShape: true,
              buttonName: VariablesUtils.ok,
              fontSize: 10.sp,
              buttonColor: ColorUtils.grey,
              buttonWidth: 64.w,
              buttonHeight: 34.h,
              buttonRadius: 4.sp,
              elevation: 0,
              fontWeight: FontWeightClass.regular,
            )
          ],
        ),
      ),
    ),
  ));
}
