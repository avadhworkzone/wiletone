import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/decoration_utils.dart';
import 'package:wilatone_restaurant/utils/font_style_utils.dart';
import 'package:wilatone_restaurant/utils/size_config_utils.dart';

class OrderBox extends StatelessWidget {
  const OrderBox({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: 78.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            color: ColorUtils.white,
            boxShadow: [DecorationUtils.commonBoxShadow()]),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            Image.asset(
              icon,
              scale: 2.5.sp,
            ),
            SizedBox(
              width: 10.w,
            ),
            WileToneTextWidget(
              title: title,
              fontWeight: FontWeightClass.semiB,
              fontSize: 15.sp,
            ),
          ],
        ),
      ),
    );
  }
}
