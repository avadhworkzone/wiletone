import 'package:get/get.dart';
import 'package:wilatone_restaurant/model/apis/api_response.dart';
import 'package:wilatone_restaurant/model/repo/auth_repo.dart';

class AuthViewModel extends GetxController {
  ApiResponse sendOtpApiResponse = ApiResponse.initial('INITIAL');
  ApiResponse verifyOtpApiResponse = ApiResponse.initial('INITIAL');

  /// SEND OTP
  Future<void> sendOtp(String phoneNumber, bool isSendAPI) async {
    sendOtpApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      final response = await AuthRepo().sendOtpRepo(phoneNumber, isSendAPI);
      sendOtpApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print('sendOtpApiResponse ERROR  :=>$e');
      sendOtpApiResponse = ApiResponse.error('ERROR');
    }
    update();
  }

  /// VERIFY OTP
  Future<void> verifyOtp(String phoneNumber, String otp) async {
    verifyOtpApiResponse = ApiResponse.loading('Loading');
    update();
    try {
      final response = await AuthRepo().verifyOtpRepo(phoneNumber, otp);
      verifyOtpApiResponse = ApiResponse.complete(response);
    } catch (e) {
      print('sendOtpApiResponse ERROR  :=>$e');
      verifyOtpApiResponse = ApiResponse.error('ERROR');
    }
    update();
  }
}
