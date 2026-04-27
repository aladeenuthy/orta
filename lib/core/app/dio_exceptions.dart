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
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
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
    if (error is Map) {
      final Map<String, dynamic> payload = Map<String, dynamic>.from(error);
      final String? message = payload['message'] is String
          ? payload['message'] as String
          : null;
      final String? issuesMessage = _formatIssues(payload['issues']);

      if (issuesMessage != null && message != null && message.isNotEmpty) {
        return '$message: $issuesMessage';
      }

      if (issuesMessage != null) {
        return issuesMessage;
      }

      if (message != null && message.isNotEmpty) {
        return message;
      }
    }

    if (error is String && error.isNotEmpty) {
      return error;
    }

    return statusCode == null
        ? "Oops something went wrong"
        : "Request failed with status code $statusCode";
  }

  String? _formatIssues(dynamic issues) {
    if (issues is! List || issues.isEmpty) {
      return null;
    }

    final List<String> formattedIssues = issues
        .whereType<Map<dynamic, dynamic>>()
        .map((Map<dynamic, dynamic> issue) {
          final String path = issue['path']?.toString() ?? '';
          final String error = issue['error']?.toString() ?? '';

          if (path.isEmpty) {
            return error;
          }

          if (error.isEmpty) {
            return path;
          }

          return '$path: $error';
        })
        .where((String issue) => issue.isNotEmpty)
        .toList();

    if (formattedIssues.isEmpty) {
      return null;
    }

    return formattedIssues.join('\n');
  }

  @override
  String toString() => message;
}
