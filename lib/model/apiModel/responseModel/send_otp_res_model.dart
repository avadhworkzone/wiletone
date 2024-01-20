class SendOtpResModel {
  SendOtpResModel({
      this.code, 
      this.message, 
      this.data,});

  SendOtpResModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }
  num? code;
  String? message;
  num? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}