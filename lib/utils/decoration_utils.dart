import 'package:flutter/material.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';

class DecorationUtils {
  static BoxShadow commonBoxShadow() =>
      BoxShadow(color: ColorUtils.grey.withOpacity(0.2), blurRadius: 5);
}
