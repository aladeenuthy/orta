class Endpoints {
  static const String forgotPassword = '/user/forgotPassword';
  static const String getUser = '/user/getUser';
  static const String login = '/user/login';
  static const String myShifts = '/shifts/my-shifts';
  static const String register = '/user/register';
  static const String resetPassword = '/user/resetPassword';
  static const String sendOtp = '/auth/send-otp';
  static const String verifyOtp = '/auth/verify-otp';
  static const String resendOtp = '/auth/resend-otp';
  static const String workerProfile = '/workers/profile';
  static const String workerAvailability = '/workers/availability';
  static const String workerUnavailability = '/workers/unavailability';
  static String cancelShift(String id) => '/shifts/$id/cancel';
  static String clockInShift(String id) => '/shifts/$id/clock-in';
  static String clockOutShift(String id) => '/shifts/$id/clock-out';
  static String shiftDetail(String id) => '/shifts/$id';
  static String deleteWorkerUnavailability(String id) =>
      '/workers/unavailability/$id';
}
