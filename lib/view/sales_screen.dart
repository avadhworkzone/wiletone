import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_image_widget.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              const SizedBox(height: 20),
              WileToneAppBar(title: VariablesUtils.totalSales),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    color: ColorUtils.grey,
                    borderRadius: BorderRadius.circular(34),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WileToneTextWidget(
                        title: VariablesUtils.lastWeek,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorUtils.greyShade1,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: ColorUtils.greyShade1,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // const WileToneImageWidget(
              //   image: 'assets/images/chart.png',
              //   imageType: ImageType.png,
              // ),
              BarChartSample1()
            ],
          ),
        ),
      ),
    );
  }
}
