import "package:dio/dio.dart";

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(dioError.response?.statusCode, dioError.response?.data);
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.connectionError:
        if (dioError.message?.contains("SocketException") == true) {
          message = "No Internet";
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }
  late String message;

  String _handleError(int? statusCode, dynamic error) {
    String? errorMessage;

    try {
      if (error["message"] != null && error["message"] is String) {
        errorMessage = error["message"] as String;
      }
    } catch (_) {}

    return errorMessage ?? "Oops something went wrong";
  }

  @override
  String toString() => message;
}
