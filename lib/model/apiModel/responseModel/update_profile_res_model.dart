class UpdateProfileResModel {
  int? code;
  String? message;
  int? data;

  UpdateProfileResModel({this.code, this.message, this.data});

  UpdateProfileResModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}