class StoreResModel {
  StoreResModel({
      this.code, 
      this.message, 
      this.data,});

  StoreResModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? code;
  String? message;
  Data? data;

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

class Data {
  Data({
      this.restaurant, 
      this.bankDetails,});

  Data.fromJson(dynamic json) {
    restaurant = json['restaurant'] != null ? Restaurant.fromJson(json['restaurant']) : null;
    bankDetails = json['bank_details'] != null ? BankDetails.fromJson(json['bank_details']) : null;
  }
  Restaurant? restaurant;
  BankDetails? bankDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (restaurant != null) {
      map['restaurant'] = restaurant?.toJson();
    }
    if (bankDetails != null) {
      map['bank_details'] = bankDetails?.toJson();
    }
    return map;
  }

}

class BankDetails {
  BankDetails({
      this.id, 
      this.userId, 
      this.restaurantId, 
      this.name, 
      this.accountNumber, 
      this.ifscCode, 
      this.bankBranch, 
      this.bankName, 
      this.createdAt, 
      this.updatedAt,});

  BankDetails.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    restaurantId = json['restaurant_id'];
    name = json['name'];
    accountNumber = json['account_number'];
    ifscCode = json['ifsc_code'];
    bankBranch = json['bank_branch'];
    bankName = json['bank_name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  num? id;
  num? userId;
  num? restaurantId;
  String? name;
  String? accountNumber;
  String? ifscCode;
  String? bankBranch;
  String? bankName;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['restaurant_id'] = restaurantId;
    map['name'] = name;
    map['account_number'] = accountNumber;
    map['ifsc_code'] = ifscCode;
    map['bank_branch'] = bankBranch;
    map['bank_name'] = bankName;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}

class Restaurant {
  Restaurant({
      this.id, 
      this.userId, 
      this.number, 
      this.storeName, 
      this.storeNumber, 
      this.address, 
      this.googleLink, 
      this.shortAddress, 
      this.categoryId, 
      this.gstRate, 
      this.createdAt, 
      this.updatedAt,});

  Restaurant.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    number = json['number'];
    storeName = json['store_name'];
    storeNumber = json['store_number'];
    address = json['address'];
    googleLink = json['google_link'];
    shortAddress = json['short_address'];
    categoryId = json['category_id'];
    gstRate = json['gst_rate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  num? id;
  num? userId;
  num? number;
  String? storeName;
  num? storeNumber;
  String? address;
  String? googleLink;
  String? shortAddress;
  dynamic categoryId;
  num? gstRate;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['number'] = number;
    map['store_name'] = storeName;
    map['store_number'] = storeNumber;
    map['address'] = address;
    map['google_link'] = googleLink;
    map['short_address'] = shortAddress;
    map['category_id'] = categoryId;
    map['gst_rate'] = gstRate;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}