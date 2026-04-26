class Endpoints {
  static const String forgotPassword = '/user/forgotPassword';
  static const String getUser = '/user/getUser';
  static const String login = '/user/login';
  static const String myShifts = '/shifts/myshifts';
  static const String register = '/user/register';
  static const String resetPassword = '/user/resetPassword';
  static String cancelShift(String id) => '/shifts/$id/cancel';
  static String clockInShift(String id) => '/shifts/$id/clock-in';
  static String clockOutShift(String id) => '/shifts/$id/clock-out';
  static String shiftDetail(String id) => '/shifts/$id';
}
