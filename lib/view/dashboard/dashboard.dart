import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/const_utils.dart';
import 'package:wilatone_restaurant/utils/extension_utils.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils.black,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(30.sp))),
        leading: Container(
          margin: EdgeInsets.all(5.sp),
          decoration: BoxDecoration(
              border: Border.all(color: ColorUtils.white),
              shape: BoxShape.circle),
          child: Image.asset(
            AssetsUtils.menu,
            scale: 2,
          ),
        ),
      ),
    );
  }
}
