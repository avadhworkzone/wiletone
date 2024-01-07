import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';

class WileToneImageWidget extends StatelessWidget {
  const WileToneImageWidget(
      {Key? key,
      required this.image,
      this.fit,
      this.height,
      this.width,
      this.color,
      this.scale,
      required this.imageType})
      : super(key: key);

  final String? image;
  final double? height;
  final double? width;
  final double? scale;
  final Color? color;
  final BoxFit? fit;
  final ImageType? imageType;

  @override
  Widget build(BuildContext context) {
    return imageType == ImageType.png
        ? Image.asset(
            image!,
            fit: fit,
            height: height,
            width: width,
            color: color,
            scale: scale,
          )
        : SvgPicture.asset(
            image!,
            height: height,
            width: width,
            color: color,
            fit: BoxFit.contain,
          );
  }
}
