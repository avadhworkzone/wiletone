import 'dart:developer';

import 'package:wilatone_restaurant/model/apiModel/responseModel/send_otp_res_model.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/social_login_res_model.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/verify_otp_res_model.dart';
import 'package:wilatone_restaurant/model/apiService/api_service.dart';
import 'package:wilatone_restaurant/model/apiService/base_service.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';

import '../apiModel/responseModel/update_profile_res_model.dart';

class AuthRepo extends BaseService {
  /// ============================= SEND OTP  ============================== ///
  Future<SendOtpResModel> sendOtpRepo(String pNumber, bool isSendAPI) async {
    Map<String, dynamic> body = {
      "mobile": pNumber,
    };
    var response = await ApiService().getResponse(
        apiType: APIType.aPost,
        withToken: false,
        body: body,
        url: isSendAPI ? sendOtp : reSendOtp);
    log("=============RES:=========$response");
    SendOtpResModel result = SendOtpResModel.fromJson(response);
    return result;
  }

  /// =============================  Verify OTP  ============================== ///
  Future<VerifyOtpResModel> verifyOtpRepo(String otp, String pNumber) async {
    Map<String, dynamic> body = {
      "code": otp,
      "mobile": pNumber,
    };
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, withToken: false, body: body, url: verifyOtp );

    log("=============RES:=========$response");
    VerifyOtpResModel result = VerifyOtpResModel.fromJson(response);

    return result;
  }

  /// =============================  SOCIAL LOGIN  ============================== ///
  Future<SocialLoginResModel> socialLoginRepo(String encryptedData) async {
    Map<String, dynamic> body = {
      "data": encryptedData,
    };
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, withToken: false, body: body, url: socialLogin);

    log("=============SocialLoginResModel RES:=========$response");
    SocialLoginResModel result = SocialLoginResModel.fromJson(response);

    return result;
  }

  /// =============================  UPDATE PROFILE  ============================== ///
  Future<UpdateProfileResModel> updateProfileRepo(String ownerName,String ownerNumber,) async {
    Map<String, dynamic> body = {
     "owner_name": ownerName,
     "owner_mobile": ownerNumber,
    };
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, withToken: true, body: body, url: updateProfile);

    log("=============RES:=========$response");
    UpdateProfileResModel result = UpdateProfileResModel.fromJson(response);

    return result;
  }
}
