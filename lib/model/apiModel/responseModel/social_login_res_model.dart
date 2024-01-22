class SocialLoginResModel {
  SocialLoginResModel({
    this.code,
    this.message,
    this.data,
  });

  SocialLoginResModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? SocialLoginData.fromJson(json['data']) : null;
  }
  num? code;
  String? message;
  SocialLoginData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class SocialLoginData {
  SocialLoginData({
    this.isEmailVerified,
    this.isProfileUpdated,
    this.accessToken,
    this.ownerName,
    this.ownerMobile,
    this.isSocial,
    this.userId,
  });

  SocialLoginData.fromJson(dynamic json) {
    isEmailVerified = json['is_email_verified'];
    isProfileUpdated = json['is_profile_updated'];
    accessToken = json['accessToken'];
    ownerName = json['owner_name'];
    ownerMobile = json['owner_mobile'];
    isSocial = json['is_social'];
    userId = json['user_id'];
  }
  bool? isEmailVerified;
  bool? isProfileUpdated;
  String? accessToken;
  String? ownerName;
  String? ownerMobile;
  bool? isSocial;
  num? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_email_verified'] = isEmailVerified;
    map['is_profile_updated'] = isProfileUpdated;
    map['accessToken'] = accessToken;
    map['owner_name'] = ownerName;
    map['owner_mobile'] = ownerMobile;
    map['is_social'] = isSocial;
    map['user_id'] = userId;
    return map;
  }
}
