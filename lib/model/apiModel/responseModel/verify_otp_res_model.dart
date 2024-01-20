class VerifyOtpResModel {
  int? code;
  String? message;
  Data? data;

  VerifyOtpResModel({
    this.code,
    this.message,
    this.data,
  });

}

class Data {
  bool? isMobileVerified;
  String? accessToken;
  dynamic ownerName;
  dynamic ownerMobile;
  bool? isSocial;

  Data({
    this.isMobileVerified,
    this.accessToken,
    this.ownerName,
    this.ownerMobile,
    this.isSocial,
  });

}

