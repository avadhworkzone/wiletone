import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_form_field.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/validations_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/dashboard/dashboard.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WileToneAppBar(title: ""),
            SizedBox(
              height: 20.h,
            ),
            WileToneTextWidget(
              title: VariablesUtils.helpUsToLetYouKnow,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
            SizedBox(
              height: 20.h,
            ),
            WileToneTextFormField(
              hintText: VariablesUtils.ownerName,
              regularExpression: RegularExpression.alphabetSpacePattern,
            ),
            SizedBox(
              height: 20.h,
            ),
            WileToneTextFormField(
              hintText: VariablesUtils.ownerMobile,
              regularExpression: RegularExpression.digitsPattern,
              textInputType: TextInputType.phone,
            ),
            SizedBox(
              height: 30.h,
            ),
            WileToneCustomButton(
              onPressed: () {
                Get.to(() => DashBoard());
              },
              buttonHeight: 52,
              buttonColor: ColorUtils.greenColor,
              buttonName: VariablesUtils.continueText,
            ),
          ],
        ),
      )),
    );
  }
}
