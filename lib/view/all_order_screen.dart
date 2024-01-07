import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_image_widget.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';

class AllOrderScreen extends StatelessWidget {
  const AllOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  WileToneAppBar(title: VariablesUtils.allOrders),
                  const SizedBox(height: 20),
                  filterSectionWidget(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(child: transactionListWidget()),
          ],
        ),
      ),
    );
  }

  /// Transaction List Widget
  Widget transactionListWidget() {
    return Container(
      color: ColorUtils.greyEC,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: List.generate(2, (index) {
            return Container(
              decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.symmetric(vertical: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
              child: Column(
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WileToneTextWidget(
                            title: VariablesUtils.transactionID,
                            fontSize: 12,
                            color: ColorUtils.greyShade1,
                            fontWeight: FontWeight.w500,
                          ),
                          WileToneTextWidget(
                            title: "ZUR10203884",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      WileToneTextWidget(
                        title: "₹500",
                        fontSize: 16,
                        color: ColorUtils.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: ColorUtils.grey)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.w),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            WileToneImageWidget(
                              image: 'assets/icons/rupeeIcon.png',
                              height: 34,
                              width: 34,
                              imageType: ImageType.png,
                            ),
                            SizedBox(width: 10),
                            WileToneTextWidget(
                              title: VariablesUtils.discount,
                              fontSize: 12,
                              color: ColorUtils.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        WileToneTextWidget(
                          title: "₹50",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: WileToneTextWidget(
                      title: "12 Nov 2023 at 2:00PM",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: ColorUtils.greyShade1,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  /// Filter Section Widget
  Widget filterSectionWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          /// Sort
          Container(
            height: 35,
            decoration: BoxDecoration(
              border: Border.all(color: ColorUtils.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.tune, size: 13),
                WileToneTextWidget(
                  title: VariablesUtils.sort,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          const SizedBox(width: 10),

          /// Date
          Container(
            height: 35,
            decoration: BoxDecoration(
              border: Border.all(color: ColorUtils.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            alignment: Alignment.center,
            child: const WileToneTextWidget(
              title: VariablesUtils.date,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 10),

          /// Discount
          Container(
            height: 35,
            decoration: BoxDecoration(
              border: Border.all(color: ColorUtils.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            alignment: Alignment.center,
            child: const WileToneTextWidget(
              title: VariablesUtils.discount,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 10),

          /// Timing
          Container(
            height: 35,
            decoration: BoxDecoration(
              border: Border.all(color: ColorUtils.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WileToneTextWidget(
                  title: VariablesUtils.timing,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
