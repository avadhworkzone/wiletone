import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wilatone_restaurant/common/common_widget/common_snackbar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_form_field.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/common_res_model.dart';
import 'package:wilatone_restaurant/model/apis/api_response.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/const_utils.dart';
import 'package:wilatone_restaurant/utils/preference_utils.dart';
import 'package:wilatone_restaurant/utils/validations_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/dashboard/dashboard.dart';

import '../../viewModel/auth_view_model.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final AuthViewModel authViewModel = Get.find<AuthViewModel>();

  String ownerName = "";
  String ownerMobile = "";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WileToneAppBar(title: ""),
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
                onChange: (str) {
                  ownerName = str;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              WileToneTextFormField(
                hintText: VariablesUtils.ownerMobile,
                regularExpression: RegularExpression.digitsPattern,
                textInputType: TextInputType.phone,
                onChange: (str) {
                  ownerMobile = str;
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              WileToneCustomButton(
                onPressed: continueOnTap,
                buttonHeight: 52,
                buttonColor: ColorUtils.greenColor,
                buttonName: VariablesUtils.continueText,
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> continueOnTap() async {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      ConstUtils.showLoader();

      await authViewModel.profileUpdate(ownerName, ownerMobile);

      ConstUtils.closeLoader();
      if (authViewModel.updateProfileApiResponse.status == Status.COMPLETE) {
        CommonResModel res = authViewModel.updateProfileApiResponse.data;
        if (res.code == 200) {
          SnackBarUtils.snackBar(
              message: res.message ?? VariablesUtils.profileUpdateSuccessfully);
          await setUserDataInStorage();

          Get.offAll(() => DashBoard());
        } else {
          SnackBarUtils.snackBar(
              message: res.message ?? VariablesUtils.somethingWentWrong);
        }
      } else {
        SnackBarUtils.snackBar(message: VariablesUtils.somethingWentWrong);
      }
    }
  }

  Future<void> setUserDataInStorage() async {
    await PreferenceUtils.setString(
        key: PreferenceUtils.ownerMobile, value: ownerMobile);
    await PreferenceUtils.setString(
        key: PreferenceUtils.ownerName, value: ownerName);
  }
}
