class StoreReqModel {
  StoreReqModel({
      this.restaurantData, 
      this.bankAccountDetails,});

  StoreReqModel.fromJson(dynamic json) {
    restaurantData = json['restaurantData'] != null ? RestaurantData.fromJson(json['restaurantData']) : null;
    bankAccountDetails = json['bankAccountDetails'] != null ? BankAccountDetails.fromJson(json['bankAccountDetails']) : null;
  }
  RestaurantData? restaurantData;
  BankAccountDetails? bankAccountDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (restaurantData != null) {
      map['restaurantData'] = restaurantData?.toJson();
    }
    if (bankAccountDetails != null) {
      map['bankAccountDetails'] = bankAccountDetails?.toJson();
    }
    return map;
  }

}

class BankAccountDetails {
  BankAccountDetails({
      this.name, 
      this.accountNumber, 
      this.ifscCode, 
      this.bankBranch, 
      this.bankName,});

  BankAccountDetails.fromJson(dynamic json) {
    name = json['name'];
    accountNumber = json['account_number'];
    ifscCode = json['ifsc_code'];
    bankBranch = json['bank_branch'];
    bankName = json['bank_name'];
  }
  String? name;
  String? accountNumber;
  String? ifscCode;
  String? bankBranch;
  String? bankName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['account_number'] = accountNumber;
    map['ifsc_code'] = ifscCode;
    map['bank_branch'] = bankBranch;
    map['bank_name'] = bankName;
    return map;
  }

}

class RestaurantData {
  RestaurantData({
      this.number, 
      this.storeName, 
      this.storeNumber, 
      this.address, 
      this.googleLink, 
      this.shortAddress, 
      this.gstRate,});

  RestaurantData.fromJson(dynamic json) {
    number = json['number'];
    storeName = json['store_name'];
    storeNumber = json['store_number'];
    address = json['address'];
    googleLink = json['google_link'];
    shortAddress = json['short_address'];
    gstRate = json['gst_rate'];
  }
  num? number;
  String? storeName;
  num? storeNumber;
  String? address;
  String? googleLink;
  String? shortAddress;
  num? gstRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['store_name'] = storeName;
    map['store_number'] = storeNumber;
    map['address'] = address;
    map['google_link'] = googleLink;
    map['short_address'] = shortAddress;
    map['gst_rate'] = gstRate;
    return map;
  }

}