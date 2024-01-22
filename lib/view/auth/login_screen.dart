import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:wilatone_restaurant/common/common_widget/common_snackbar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_custom_button.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_image_widget.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/app_icon_assets.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/const_utils.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/utils/font_style_utils.dart';
import 'package:wilatone_restaurant/utils/preference_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/auth/otp_verify_screen.dart';
import 'package:wilatone_restaurant/view/general/wilestone_web_view.dart';

import '../../common/common_widget/common_loading_indicator.dart';
import '../../model/apiModel/responseModel/send_otp_res_model.dart';
import '../../model/apis/api_response.dart';
import '../../viewModel/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  String phoneNumber = '', dialCode = "";

  final AuthViewModel authViewModel = Get.find<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WileToneTextWidget(
            title: VariablesUtils.byContinuing,
            color: ColorUtils.grey5B,
            fontWeight: FontWeight.w500,
            fontSize: 10.sp,
          ),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.to(WileStoneWebview(
                    urlLink: ConstUtils.termsOfService,
                    title: VariablesUtils.termsOfService,
                  ));
                },
                child: WileToneTextWidget(
                  title: VariablesUtils.termsOfService,
                  color: ColorUtils.grey5B,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(width: 10.w),
              InkWell(
                onTap: () {
                  Get.to(WileStoneWebview(
                    urlLink: ConstUtils.privacyPolicy,
                    title: VariablesUtils.privacyPolicy,
                  ));
                },
                child: WileToneTextWidget(
                  title: VariablesUtils.privacyPolicy,
                  color: ColorUtils.grey5B,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(width: 10.w),
              InkWell(
                onTap: () {
                  Get.to(WileStoneWebview(
                    urlLink: ConstUtils.contentPolicies,
                    title: VariablesUtils.contentPolicies,
                  ));
                },
                child: WileToneTextWidget(
                  title: VariablesUtils.contentPolicies,
                  color: ColorUtils.grey5B,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 3,
              width: Get.width,
              color: ColorUtils.black,
            ),
            SizedBox(
              height: 30.h,
            ),
            WileToneTextWidget(
              title: VariablesUtils.welcomeToZura,
              color: ColorUtils.black,
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: ColorUtils.lightGreyE6,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  WileToneTextWidget(
                    title: VariablesUtils.loginSignUp,
                    color: ColorUtils.grey5B,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Expanded(
                      child: Divider(
                    color: ColorUtils.lightGreyE6,
                    height: 1,
                  )),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: IntlPhoneField(
                validator:  (value) {
                  if (value == null ) {
                    return 'Please enter phone number';
                  }
                  return null;
                },

                controller: phoneController,
                obscureText: false,
                decoration: InputDecoration(

                  counterText: '',
                  hintText: VariablesUtils.enterMobileNumber,
                  hintStyle: TextStyle(
                      color: ColorUtils.lightGreyA6,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: AssetsUtils.poppins),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: ColorUtils.red, width: 1),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorUtils.lightGreyD3, width: 1),
                      borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorUtils.lightGreyD3, width: 1),
                      borderRadius: BorderRadius.circular(12)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorUtils.lightGreyD3, width: 1),
                      borderRadius: BorderRadius.circular(12)),
                ),
                cursorColor: ColorUtils.grey5B,
                disableLengthCheck: false,
                initialCountryCode: 'IN',
                dropdownIconPosition: IconPosition.trailing,
                flagsButtonPadding: EdgeInsets.only(left: 2.w),
                dropdownTextStyle: TextStyle(
                    fontSize: 16.sp, fontWeight: FontWeightClass.semiB),
                onChanged: (phone) {
                  phoneNumber = phone.number;
                },
                onCountryChanged: (phone) async {
                  dialCode = phone.dialCode.toString();
                  logs("=====Code ${phone.dialCode}");
                  await PreferenceManagerUtils.setCountryCode(dialCode);
                  await PreferenceManagerUtils.setCountryName(phone.code);
                },
              ),
            ),
            SizedBox(height: 20.h),

            ///Continue Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: WileToneCustomButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (phoneController.text.isEmpty) {
                    SnackBarUtils.snackBar(
                      message: "Please enter phone number",
                      bgColor: ColorUtils.red,
                    );
                    return;
                  }

                  Get.dialog(
                    postDataLoadingIndicator(),
                    barrierDismissible: false,
                  );
                  await authViewModel.sendOtp(phoneNumber = phoneController.text,true);
                  if (authViewModel.sendOtpApiResponse.status == Status.COMPLETE) {
                    SendOtpResModel res =
                        authViewModel.sendOtpApiResponse.data;
                    if(res.code == 200){
                      Get.back();
                      SnackBarUtils.snackBar( message: res.message ?? "OTP Sent Successfully...");

                      Get.to(()=> OtpVerificationScreen(phoneNumber: phoneController.text,countyCode: dialCode.isEmpty ? '91' : dialCode,))!.then((value) => phoneController.clear());

                    }else{
                      Get.back();
                      SnackBarUtils.snackBar( message: res.message ?? "Something Went Wrong...",bgColor: ColorUtils.red);

                    }

                  }

                },
                buttonHeight: 52,
                buttonColor: ColorUtils.greenColor,
                buttonName: VariablesUtils.continueText,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: ColorUtils.lightGreyE6,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  WileToneTextWidget(
                    title: VariablesUtils.or,
                    color: ColorUtils.grey5B,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Expanded(
                      child: Divider(
                    color: ColorUtils.lightGreyE6,
                    height: 1,
                  )),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const WileToneImageWidget(
                  image: AppIconAssets.googleIcon,
                  imageType: ImageType.png,
                  scale: 5,
                ),
                SizedBox(
                  width: 10.w,
                ),
                const WileToneImageWidget(
                  image: AppIconAssets.appleIcon,
                  imageType: ImageType.png,
                  scale: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
