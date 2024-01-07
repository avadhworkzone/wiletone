import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/typedef_utils.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({Key? key, required this.onPressed}) : super(key: key);

  final OnTap? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorUtils.grey,
      borderRadius: BorderRadius.circular(200),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(200),
        child: const SizedBox(
          height: 40,
          width: 40,
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 16,
          ),
        ),
      ),
    );
  }
}
