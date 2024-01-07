import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_common_dialog.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/font_style_utils.dart';
import 'package:wilatone_restaurant/utils/size_config_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/order_box.dart';
import 'widgets/transaction_row.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorUtils.white,
      appBar: customAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              SizeConfig.sH30(),
              TransactionRow(),
              SizeConfig.sH30(),
              OrderBox(
                title: VariablesUtils.allOrders,
                icon: AssetsUtils.allOrders,
                onTap: () {
                  willToneCommonDialog(VariablesUtils.theseAreTheEarning);
                },
              ),
              SizeConfig.sH30(),
              OrderBox(
                title: VariablesUtils.discountRates,
                icon: AssetsUtils.discountOrders,
                onTap: () {
                  willToneCommonDialog(
                      VariablesUtils.showsTotalOfAllOrdersForToday);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar customAppBar() {
    return AppBar(
      backgroundColor: ColorUtils.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.sp))),
      leading: GestureDetector(
        onTap: () {
          scaffoldKey.currentState!.openDrawer();
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(10.sp, 10.sp, 0, 10.sp),
          decoration: BoxDecoration(
              border: Border.all(color: ColorUtils.white),
              shape: BoxShape.circle),
          child: Image.asset(
            AssetsUtils.menu,
            scale: 2,
          ),
        ),
      ),
      title: WileToneTextWidget(
        title: VariablesUtils.zura,
        color: ColorUtils.white,
        fontSize: 24.sp,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10.sp),
          child: CircleAvatar(
            radius: 20.sp,
            child: WileToneTextWidget(
              title: 'A',
              fontWeight: FontWeightClass.bold,
              fontSize: 20.sp,
              color: ColorUtils.blueColor,
            ),
          ),
        )
      ],
    );
  }
}
