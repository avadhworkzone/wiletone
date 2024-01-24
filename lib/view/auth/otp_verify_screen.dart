import 'dart:async';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/common_res_model.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/verify_otp_res_model.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/const_utils.dart';
import 'package:wilatone_restaurant/utils/preference_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/auth/create_profile_screen.dart';
import 'package:wilatone_restaurant/view/dashboard/dashboard.dart';

import '../../common/common_widget/common_loading_indicator.dart';
import '../../common/common_widget/common_snackbar.dart';
import '../../model/apis/api_response.dart';
import '../../viewModel/auth_view_model.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  final String countyCode;

  const OtpVerificationScreen(
      {Key? key, required this.phoneNumber, required this.countyCode})
      : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final otpEditController = TextEditingController();
  final AuthViewModel authViewModel = Get.find<AuthViewModel>();
  final interval = const Duration(seconds: 1);
  int currentSeconds = 30;
  String? timerText = "150";
  Timer? _timer;

  void _stopTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }
  }

  startTimeout([int? milliseconds]) {
    _timer?.cancel();
    _timer = Timer.periodic(interval, (timer) {
      currentSeconds = currentSeconds - 1;
      if (currentSeconds == 0) _timer?.cancel();
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    startTimeout();

    super.initState();
  }

  String codeValue = "";

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              const WileToneAppBar(title: VariablesUtils.oTPVerification),
              SizedBox(
                height: 20.h,
              ),
              WileToneTextWidget(
                title: VariablesUtils.weHaveSentVerificationCodeTo,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: ColorUtils.grey5B,
              ),
              SizedBox(
                height: 2.5.h,
              ),
              WileToneTextWidget(
                title: "+${widget.countyCode}-${widget.phoneNumber}",
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: ColorUtils.black,
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.w),
                child: Pinput(
                  closeKeyboardWhenCompleted: true,
                  length: 6,
                  autofocus: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Otp';
                    } else if (value.length != 6) {
                      return 'OTP must be 6 digits';
                    }
                    return null;
                  },
                  controller: otpEditController,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  autofillHints: const [AutofillHints.oneTimeCode],
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  textInputAction: TextInputAction.done,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  defaultPinTheme: PinTheme(
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    width: Get.width / 6,
                    height: Get.width / 8.9,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  followingPinTheme: PinTheme(
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    width: Get.width / 6,
                    height: Get.width / 8.9,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorUtils.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  errorPinTheme: PinTheme(
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    width: Get.width / 6,
                    height: Get.width / 8.9,
                    textStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorUtils.grey5B, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onCompleted: (String otp){
                    onTap();
                  },
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: VariablesUtils.didntGetOtp,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: AssetsUtils.poppins),
                    ),
                    currentSeconds == 0
                        ? TextSpan(
                            text: VariablesUtils.resendSMSIn,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                otpEditController.clear();
                                FocusManager.instance.primaryFocus?.unfocus();
                                ConstUtils.showLoader();
                                await authViewModel.sendOtp(
                                    widget.phoneNumber, false);
                                if (authViewModel.sendOtpApiResponse.status ==
                                    Status.COMPLETE) {
                                  CommonResModel res =
                                      authViewModel.sendOtpApiResponse.data;
                                  log('RES CODE ==>${res.code}');
                                  if (res.code == 200) {
                                    ConstUtils.closeLoader();
                                    currentSeconds = 30;
                                    startTimeout();

                                    log('======${res.message}');
                                    SnackBarUtils.snackBar(
                                        message: res.message ??
                                            VariablesUtils
                                                .otpResentSuccessfully);
                                  } else {
                                    ConstUtils.closeLoader();
                                    SnackBarUtils.snackBar(
                                        message: res.message ??
                                            VariablesUtils.resendOtpFailed,
                                        bgColor: ColorUtils.red);
                                  }
                                }
                              },
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorUtils.greyAC,
                                fontFamily: AssetsUtils.poppins),
                          )
                        : TextSpan(
                            text: ConstUtils.formatHHMMSS(currentSeconds),
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorUtils.greyAC,
                                fontFamily: AssetsUtils.poppins),
                          ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: onTap,
                child: WileToneTextWidget(
                  title: VariablesUtils.goBackToLoginMethods,
                  color: ColorUtils.greenColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onTap() async {
    FocusScope.of(context).unfocus();
    if (otpEditController.text.isEmpty) {
      SnackBarUtils.snackBar(
          message: VariablesUtils.enterOtp, bgColor: ColorUtils.red);
      return;
    }

    ConstUtils.showLoader();

    await authViewModel.verifyOtp(otpEditController.text, widget.phoneNumber);
    ConstUtils.closeLoader();
    if (authViewModel.verifyOtpApiResponse.status == Status.COMPLETE) {
      VerifyOtpResModel res = authViewModel.verifyOtpApiResponse.data;
      if (res.code == 200) {
        SnackBarUtils.snackBar(
            message: res.message ?? VariablesUtils.mobileVerified);
        await setUserDataInStorage(res.data!);
        if ((res.data?.ownerName?.isNotEmpty) == true ||
            (res.data?.ownerName?.isNotEmpty) == true) {
          Get.offAll(() => DashBoard());
        } else {
          Get.offAll(() => const CreateProfileScreen());
        }
      } else {
        SnackBarUtils.snackBar(
            message: res.message ?? VariablesUtils.invalidOtp);
      }
    } else {
      SnackBarUtils.snackBar(message: VariablesUtils.somethingWentWrong);
    }
  }

  Future<void> setUserDataInStorage(VerifyOtpData res) async {
    await PreferenceUtils.setString(
        key: PreferenceUtils.accessToken, value: res.accessToken ?? "");
    await PreferenceUtils.setString(
        key: PreferenceUtils.ownerMobile, value: res.ownerMobile ?? "");
    await PreferenceUtils.setString(
        key: PreferenceUtils.ownerName, value: res.ownerName ?? "");
  }
}
