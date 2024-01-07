import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/common_back_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/typedef_utils.dart';

class WileToneAppBar extends StatelessWidget {
  const WileToneAppBar({Key? key, this.onPressed, this.title})
      : super(key: key);

  final VoidCallback? onPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonBackButton(
          onPressed: onPressed ??
              () {
                Get.back();
              },
        ),
        WileToneTextWidget(
          title: title!,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(width: 40)
      ],
    );
  }
}
