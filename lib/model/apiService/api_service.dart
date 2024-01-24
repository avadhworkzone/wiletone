import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wilatone_restaurant/model/apiService/base_service.dart';
import 'package:wilatone_restaurant/model/apis/api_exception.dart';
import 'package:wilatone_restaurant/utils/enum_utils.dart';
import 'package:wilatone_restaurant/utils/preference_utils.dart';

/// USE HTTP TO API CALLING
class ApiService extends BaseService {
  var response;

  Future<dynamic> getResponse(
      {required APIType apiType,
      required String url,
      bool withToken = true,
      Map<String, dynamic>? body,
      bool fileUpload = false}) async {
    try {
      log('REQ BODY :=>${jsonEncode(body)}');
      log("URL ---> ${Uri.parse(baseURL + url)}");

      ///------------------------------------ GET METHOD -------------------------------------///
      if (apiType == APIType.aGet) {
        var result = await http.get(
          Uri.parse(baseURL + url),
          headers: withToken
              ? header(status: APIHeaderType.onlyToken)
              : null, /* headers: headerTokenGet*/
        );
        response = returnResponse(
          result.statusCode,
          result.body,
        );
        log("Get response......$response");
      }

      ///------------------------------------ FILE UPLOAD METHOD -------------------------------------///

      else if (fileUpload) {
        /// REQUEST BODY FOR FILE UPLOAD. HERE PASS MULTIPLE (LIST) IMAGES

        var postUri = Uri.parse(baseURL + url);
        var request = http.MultipartRequest("POST", postUri);
        List<String> keysList = body!.keys.toList();
        List<dynamic> valueList = body.values.toList();
        for (int index = 0; index < body.keys.toList().length; index++) {
          if (valueList[index]['isFile']) {
            request.files.add(http.MultipartFile.fromString(
              keysList[index],
              jsonEncode(await valueList[index]['data']),
            ));
          } else {
            request.fields[keysList[index]] = valueList[index]['data'];
          }
        }
        request.headers.addAll(header(
            status: withToken ? APIHeaderType.fileUploadWithToken : null));
        http.StreamedResponse result = await request.send();
        print('response Code:::${result.statusCode}');
        if (result.statusCode == 200) {
          var responseData = await result.stream.toBytes();
          var responseString = String.fromCharCodes(responseData);
          response = returnResponse(result.statusCode, responseString);
          log("File Upload response......$response");
        } else {
          return null;
        }
      }

      ///------------------------------------ POST METHOD -------------------------------------///

      else {
        String encodeBody = jsonEncode(body);
        var result = await http.post(
          Uri.parse(baseURL + url),
          // headers: header(status: withToken?APIHeaderType.jsonBodyWithToken:null),
          headers: header(
              status: withToken ? APIHeaderType.jsonBodyWithToken : null),
          body: encodeBody,
        );
        response = returnResponse(result.statusCode, result.body);
        log("response......$response");
      }
      return response;
    } catch (e) {
      log('Error=>.. $e');
    }
  }

  dynamic returnResponse(int status, String result) {
    switch (status) {
      case 200:
        return jsonDecode(result);
      case 400:
        return jsonDecode(result);

      // throw BadRequestException('Bad Request');
      case 401:
        throw UnauthorisedException('Unauthorised user');
      case 404:
        throw ServerException('Server Error');
      case 500:
      default:
        throw FetchDataException('Internal Server Error');
    }
  }
}

Map<String, String> header({APIHeaderType? status}) {
  final accessToken = PreferenceUtils.getString(PreferenceUtils.accessToken);
  if (status == APIHeaderType.fileUploadWithToken) {
    return {
      'Content-Type': "form-data",
      "x-access-token": accessToken
    };
  } else if (status == APIHeaderType.fileUploadWithoutToken) {
    return {
      'Content-Type': "form-data",
    };
  } else if (status == APIHeaderType.jsonBodyWithToken) {
    return {
      'Content-Type': 'application/json',
      "x-access-token": accessToken
    };
  } else if (status == APIHeaderType.onlyToken) {
    return {
      "x-access-token": accessToken
    };
  } else {
    return {
      'Content-Type': 'application/json',
    };
  }
}
