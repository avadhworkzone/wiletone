class VerifyOtpResModel {
  int? code;
  String? message;
  VerifyOtpData? data;

  VerifyOtpResModel({this.code, this.message, this.data});

  VerifyOtpResModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? VerifyOtpData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class VerifyOtpData {
  bool? isMobileVerified;
  String? accessToken;
  String? ownerName;
  String? ownerMobile;
  bool? isSocial;

  VerifyOtpData(
      {this.isMobileVerified,
        this.accessToken,
        this.ownerName,
        this.ownerMobile,
        this.isSocial});

  VerifyOtpData.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['is_mobile_verified'];
    accessToken = json['accessToken'];
    ownerName = json['owner_name'];
    ownerMobile = json['owner_mobile'];
    isSocial = json['is_social'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['is_mobile_verified'] = isMobileVerified;
    data['accessToken'] = accessToken;
    data['owner_name'] = ownerName;
    data['owner_mobile'] = ownerMobile;
    data['is_social'] = isSocial;
    return data;
  }
}