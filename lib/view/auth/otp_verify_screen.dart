import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_app_bar.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/send_otp_res_model.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/auth/create_profile_screen.dart';


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
                  length: 4,
                  autofocus: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Otp';
                    } else if (value.length != 4) {
                      return 'OTP must be 4 digits';
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
                                FocusManager.instance.primaryFocus?.unfocus();

                                await authViewModel.sendOtp(widget.phoneNumber,false);
                                if (authViewModel.sendOtpApiResponse.status ==
                                    Status.COMPLETE) {
                                  SendOtpResModel res =
                                      authViewModel.sendOtpApiResponse.data;
                                  print('RES CODE ==>${res.code}');
                                  if (res.code == 200) {
                                    currentSeconds = 30;
                                    startTimeout();
                                    print('======${res.message}');
                                  } else {
                                    Get.snackbar('Error',
                                        'Failed to resend OTP. Please try again.');
                                  }
                                }

                              },
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorUtils.greyAC,
                                fontFamily: AssetsUtils.poppins),
                          )
                        : TextSpan(),
                    currentSeconds != 0
                        ? TextSpan(
                            text: formatHHMMSS(currentSeconds) ?? '',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorUtils.greyAC,
                                fontFamily: AssetsUtils.poppins),
                          )
                        : const TextSpan(text: ""),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () async {
                  await authViewModel.verifyOtp(
                      widget.phoneNumber, otpEditController.text);
                  if (authViewModel.verifyOtpApiResponse.status ==
                      Status.COMPLETE) {
                    SendOtpResModel res =
                        authViewModel.verifyOtpApiResponse.data;
                    if (res.code == 200) {
                      Get.to(() => CreateProfileScreen());
                      print('======${res.message}');
                    } else {
                      Get.snackbar("", 'Invalid Otp..');
                    }
                  }
                },
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

  String formatHHMMSS(int seconds) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}
