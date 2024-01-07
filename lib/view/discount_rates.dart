import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/font_style_utils.dart';
import 'package:wilatone_restaurant/utils/size_config_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';

class DiscountRates extends StatelessWidget {
  DiscountRates({Key? key}) : super(key: key);

  List<String> tempList = [
    "07:00AM - 10:00AM",
    "10:00AM - 12:00AM",
    "12:00PM - 03:00PM",
    "03:00PM - 07:00PM",
    "07:00PM - 12:00PM",
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            height: 70,
            width: Get.width,
            color: Colors.grey,
          ),
          DataList(tempList: tempList),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: WileToneCustomButton(
              onPressed: () {},
              buttonName: VariablesUtils.update,
              fontSize: 16.sp,
              buttonWidth: Get.width,
              buttonHeight: 55.h,
              buttonRadius: 12.sp,
              fontWeight: FontWeightClass.medium,
            ),
          ),
          SizeConfig.sH20(),
        ],
      ),
    );
  }
}

class DataList extends StatelessWidget {
  const DataList({
    super.key,
    required this.tempList,
  });

  final List<String> tempList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: ListView.builder(
            itemCount: tempList.length,
            itemBuilder: (context, index) {
              return Container(
                height: 64.h,
                width: Get.width,
                margin: EdgeInsets.only(bottom: 20.h),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorUtils.grey),
                    borderRadius: BorderRadius.circular(8.sp)),
                padding:
                    EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
                child: Row(
                  children: [
                    WileToneTextWidget(
                      title: tempList[index],
                      color: ColorUtils.grey,
                      fontWeight: FontWeightClass.medium,
                      fontSize: 16.sp,
                    ),
                    const Spacer(),
                    WileToneTextWidget(
                      title: "10%",
                      fontWeight: FontWeightClass.medium,
                      fontSize: 16.sp,
                    ),
                    SizeConfig.sW10(),
                    Icon(
                      Icons.edit_outlined,
                      color: ColorUtils.greenColor,
                      size: 18.sp,
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
