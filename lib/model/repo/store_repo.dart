import 'dart:developer';

import 'package:wilatone_restaurant/model/apiModel/requestModel/store_req_model.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/common_res_model.dart';
import 'package:wilatone_restaurant/model/apiModel/responseModel/store_res_model.dart';
import 'package:wilatone_restaurant/model/apiService/api_service.dart';
import 'package:wilatone_restaurant/model/apiService/base_service.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';

class StoreRepo extends BaseService {
  /// ============================= STORE REPO  ============================== ///
  Future<StoreResModel> storeRepo(StoreReqModel model) async {

    var response = await ApiService().getResponse(
        apiType: APIType.aPost,
        withToken: false,
        body: model.toJson(),
        url: store);
    log("=============RES:=========$response");
    StoreResModel result = StoreResModel.fromJson(response);
    return result;
  }
}
