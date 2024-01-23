import 'dart:developer';

import 'package:get/get.dart';
import 'package:wilatone_restaurant/model/apis/api_response.dart';
import 'package:wilatone_restaurant/model/repo/auth_repo.dart';

class AuthViewModel extends GetxController {
  ApiResponse sendOtpApiResponse = ApiResponse.initial('INITIAL');
  ApiResponse verifyOtpApiResponse = ApiResponse.initial('INITIAL');
  ApiResponse socialLoginApiResponse = ApiResponse.initial('INITIAL');
  ApiResponse updateProfileApiResponse = ApiResponse.initial('INITIAL');

  /// SEND OTP
  Future<void> sendOtp(String phoneNumber, bool isSendAPI) async {
    sendOtpApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      final response = await AuthRepo().sendOtpRepo(phoneNumber, isSendAPI);
      sendOtpApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('sendOtpApiResponse ERROR  :=>$e');
      sendOtpApiResponse = ApiResponse.error('ERROR');
    }
    update();
  }

  /// VERIFY OTP
  Future<void> verifyOtp( String otp,String phoneNumber) async {
    verifyOtpApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      final response = await AuthRepo().verifyOtpRepo( otp,phoneNumber);
      verifyOtpApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('verifyOtpApiResponse ERROR  :=>$e');
      verifyOtpApiResponse = ApiResponse.error('ERROR');
    }
    update();
  }

  /// SOCIAL LOGIN
  Future<void> socialLogin(String encryptedData) async {
    socialLoginApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      final response = await AuthRepo().socialLoginRepo(encryptedData);
      socialLoginApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('socialLoginApiResponse ERROR  :=>$e');
      socialLoginApiResponse = ApiResponse.error('ERROR');
    }
    update();
  }

  /// UPDATE PROFILE
  Future<void> profileUpdate(String ownerName,String ownerNumber) async {
    updateProfileApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      final response = await AuthRepo().updateProfileRepo(ownerName,ownerNumber);
      updateProfileApiResponse = ApiResponse.complete(response);
    } catch (e) {
      log('updateProfileApiResponse ERROR  :=>$e');
      updateProfileApiResponse = ApiResponse.error('ERROR');
    }
    update();
  }
}
