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

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final otpEditController = TextEditingController();
  final interval = const Duration(seconds: 1);
  int currentSeconds = 0, countDownTime = 150, timerMaxSeconds = 150;
  String? timerText;
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
          currentSeconds = timer.tick;
          timerText =
              '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(1, '0')} : ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(1, '0')}';
          if (timer.tick >= timerMaxSeconds) timer.cancel();
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
  void codeUpdated() {
    setState(() {
      print("codeUpdated");
    });
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: const BoxDecoration(
                color: ColorUtils.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WileToneTextWidget(
                  title: VariablesUtils.oTPVerification,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: VariablesUtils.didntGetOtp,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: AssetsUtils.poppins),
                      ),
                      TextSpan(
                        text: VariablesUtils.resendSMSIn,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: AssetsUtils.poppins),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.w),
                  child: Pinput(
                    length: 6,
                    autofocus: true,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsRetrieverApi,
                    onChanged: (otpNumber) {},
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
                    smsCodeMatcher: PinputConstants.defaultSmsCodeMatcher,
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
                        border: Border.all(color: ColorUtils.greyAC, width: 2),
                        borderRadius: BorderRadius.circular(5),
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
                        border: Border.all(color: ColorUtils.grey5B, width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                currentSeconds != countDownTime
                    ? Align(
                        alignment: Alignment.center,
                        child: WileToneTextWidget(
                          title: timerText ?? '',
                          color: ColorUtils.greyAC,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 10.h,
                ),
                WileToneTextWidget(
                  title: VariablesUtils.goBackToLoginMethods,
                  color: ColorUtils.greenColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
