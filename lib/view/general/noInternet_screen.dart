// ignore_for_file: file_names

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';

import '../../common/common_widget/wiletone_text_widget.dart';

class NoInterNetConnected extends StatelessWidget {
  const NoInterNetConnected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorUtils.white,
      child: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WileToneTextWidget(
                title: VariablesUtils.or,
                fontSize: 16.sp,
                textAlign: TextAlign.center,
                color: Theme.of(context).primaryTextTheme.labelMedium?.color,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
