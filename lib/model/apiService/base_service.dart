abstract class BaseService {
  // final String getInSchBaseURL = 'https://mspeducare.com/app/api';
  final String baseURL = 'https://zuraapi.comuniqate.com/';

  /// =============== AUTH APIS ================= ///

  final String sendOtp ="api/restaurant/auth/send-code";
  final String reSendOtp ="api/restaurant/auth/resend-code";
  final String verifyOtp ="api/restaurant/auth/verify-code";

  /// =============== STORE ================= ///
  final String store="api/restaurant/auth/store";


}
