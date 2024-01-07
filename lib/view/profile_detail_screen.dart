import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wilatone_restaurant/common/common_widget/common_back_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/font_style_utils.dart';
import 'package:wilatone_restaurant/utils/size_config_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    WileToneAppBar(
                        onPressed: () {}, title: VariablesUtils.profileDetails),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WileToneTextWidget(
                              title: VariablesUtils.ownerName,
                              fontSize: 12,
                              color: ColorUtils.greyShade1,
                              fontWeight: FontWeight.w500,
                            ),
                            WileToneTextWidget(
                              title: "Shubham Shinde",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: ColorUtils.green,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WileToneTextWidget(
                              title: VariablesUtils.ownerMobile,
                              fontSize: 12,
                              color: ColorUtils.greyShade1,
                              fontWeight: FontWeight.w500,
                            ),
                            WileToneTextWidget(
                              title: "9922112234",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: ColorUtils.green,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              WileToneCustomButton(
                onPressed: () {},
                buttonName: VariablesUtils.update,
                fontSize: 16,
              ),
              const SizedBox(height: 15)
            ],
          ),
        ),
      ),
    );
  }
}
