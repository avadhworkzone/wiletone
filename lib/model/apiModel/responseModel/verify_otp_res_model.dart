class VerifyOtpResModel {
  int? code;
  String? message;
  Data? data;

  VerifyOtpResModel({this.code, this.message, this.data});

  VerifyOtpResModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? isMobileVerified;
  String? accessToken;
  String? ownerName;
  String? ownerMobile;
  bool? isSocial;

  Data(
      {this.isMobileVerified,
        this.accessToken,
        this.ownerName,
        this.ownerMobile,
        this.isSocial});

  Data.fromJson(Map<String, dynamic> json) {
    isMobileVerified = json['is_mobile_verified'];
    accessToken = json['accessToken'];
    ownerName = json['owner_name'];
    ownerMobile = json['owner_mobile'];
    isSocial = json['is_social'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_mobile_verified'] = this.isMobileVerified;
    data['accessToken'] = this.accessToken;
    data['owner_name'] = this.ownerName;
    data['owner_mobile'] = this.ownerMobile;
    data['is_social'] = this.isSocial;
    return data;
  }
}