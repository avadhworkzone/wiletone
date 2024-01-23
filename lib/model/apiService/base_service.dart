abstract class BaseService {
  // final String getInSchBaseURL = 'https://mspeducare.com/app/api';
  final String baseURL = 'https://zuraapi.comuniqate.com/';

  /// =============== AUTH APIS ================= ///

  final String sendOtp = "api/restaurant/auth/send-code";
  final String reSendOtp = "api/restaurant/auth/resend-code";
  final String verifyOtp = "api/restaurant/auth/verify-code";
  final String socialLogin = "api/restaurant/auth/social-login";

  /// =============== STORE ================= ///
  final String store = "api/restaurant/auth/store";

  /// ============ UPDATE PROFILE ============= ///
  final String updateProfile = "api/restaurant/auth/update-profile";
}
