import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/font_style_utils.dart';
import 'package:wilatone_restaurant/utils/size_config_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 290.w,
      backgroundColor: ColorUtils.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizeConfig.sH30(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 20.sp,
                  backgroundColor: ColorUtils.blueColor.withOpacity(0.2),
                  child: WileToneTextWidget(
                    title: 'A',
                    fontWeight: FontWeightClass.bold,
                    fontSize: 20.sp,
                    color: ColorUtils.blueColor,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                title: WileToneTextWidget(
                  title: VariablesUtils.shubhamShinde,
                  color: ColorUtils.black,
                  fontWeight: FontWeightClass.semiB,
                  fontSize: 12.sp,
                ),
                subtitle: WileToneTextWidget(
                  title: VariablesUtils.userPhoneNumber,
                  color: ColorUtils.grey,
                  fontWeight: FontWeightClass.regular,
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizeConfig.sH35(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  WileToneTextWidget(
                    title: VariablesUtils.quickAction,
                    color: ColorUtils.grey,
                    fontWeight: FontWeightClass.medium,
                    fontSize: 12.sp,
                  ),
                  SizeConfig.sW10(),
                  const Expanded(
                      child: Divider(
                    color: ColorUtils.greyE6,
                  )),
                ],
              ),
            ),
            SizeConfig.sH30(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Image.asset(
                    AssetsUtils.allOrders,
                    scale: 2.5.sp,
                  ),
                  SizeConfig.sW10(),
                  WileToneTextWidget(
                    title: VariablesUtils.allOrders,
                    fontWeight: FontWeightClass.semiB,
                    fontSize: 15.sp,
                  ),
                ],
              ),
            ),
            SizeConfig.sH35(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Image.asset(
                    AssetsUtils.discountOrders,
                    scale: 2.5.sp,
                  ),
                  SizeConfig.sW10(),
                  WileToneTextWidget(
                    title: VariablesUtils.discountRates,
                    fontWeight: FontWeightClass.semiB,
                    fontSize: 15.sp,
                  ),
                ],
              ),
            ),
            Spacer(),
            WileToneCustomButton(
              onPressed: () {
                Get.back();
              },
              icon: Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: Icon(
                  Icons.logout,
                  color: ColorUtils.white,
                  size: 24.sp,
                ),
              ),
              buttonName: VariablesUtils.logout,
              fontSize: 12.sp,
              buttonWidth: 290.w,
              buttonHeight: 55.h,
              buttonRadius: 8.sp,
              fontWeight: FontWeightClass.semiB,
            ),
            SizeConfig.sH30(),
          ],
        ),
      ),
    );
  }
}
