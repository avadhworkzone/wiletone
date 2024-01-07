import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/decoration_utils.dart';
import 'package:wilatone_restaurant/utils/font_style_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/earning_screen.dart';
import 'package:wilatone_restaurant/view/sales_screen.dart';

class TransactionModel {
  String title;
  String amount;

  TransactionModel({required this.title, required this.amount});
}

class TransactionRow extends StatelessWidget {
  TransactionRow({
    super.key,
  });

  List<TransactionModel> transactionList = [
    TransactionModel(
        title: VariablesUtils.totalSales,
        amount: VariablesUtils.totalSalesAmount),
    TransactionModel(
        title: VariablesUtils.totalEarnings,
        amount: VariablesUtils.totalEarningsAmount),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            transactionList.length,
            (index) => Expanded(
                  child: InkWell(
                    onTap: () {
                      if (index == 0) {
                        Get.to(() => SalesScreen());
                      } else {
                        Get.to(() => EarningScreen());
                      }
                    },
                    child: Container(
                      height: 100.h,
                      margin: EdgeInsets.only(
                          right: index == 0 ? 10.sp : 0,
                          left: index == 1 ? 10.sp : 0),
                      decoration: BoxDecoration(
                          color: ColorUtils.white,
                          boxShadow: [DecorationUtils.commonBoxShadow()],
                          borderRadius: BorderRadius.circular(8.sp)),
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              WileToneTextWidget(
                                title: transactionList[index].title,
                                color: ColorUtils.greenColor,
                                fontSize: 12.sp,
                              ),
                              const Spacer(),
                              Icon(
                                Icons.info_outline,
                                size: 15.w,
                                color: ColorUtils.grey,
                              ),
                            ],
                          ),
                          WileToneTextWidget(
                            title: transactionList[index].amount,
                            fontSize: 24.sp,
                            fontWeight: FontWeightClass.semiB,
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
