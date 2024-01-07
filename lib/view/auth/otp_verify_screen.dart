import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wilatone_restaurant/common/common_widget/wiletone_text_widget.dart';
import 'package:wilatone_restaurant/utils/assets/assets_utils.dart';
import 'package:wilatone_restaurant/utils/color_utils.dart';
import 'package:wilatone_restaurant/utils/variables_utils.dart';
import 'package:wilatone_restaurant/view/auth/create_profile_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final otpEditController = TextEditingController();
  final interval = const Duration(seconds: 1);
  int currentSeconds = 10, countDownTime = 150, timerMaxSeconds = 150;
  String? timerText = "150";
  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(interval, (timer) {
      setState(() {});
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }
  }

  startTimeout([int? milliseconds]) {
    Timer.periodic(interval, (timer) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (mounted) {
          currentSeconds = currentSeconds - 1;
          if (currentSeconds == 0) timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    _startTimer();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WileToneTextWidget(
              title: VariablesUtils.oTPVerification,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
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
              title: "+91-9067757747",
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
                  TextSpan(
                    text: VariablesUtils.resendSMSIn,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorUtils.greyAC,
                        fontFamily: AssetsUtils.poppins),
                  ),
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
              onTap: () {
                Get.to(CreateProfileScreen());
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
