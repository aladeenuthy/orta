import "dart:async";

import "package:dio/dio.dart";

import "../shared/constants.dart";
import "../storage/local_storage.dart";
import "base_api.dart";

/// Custom error to handle token expiration scenarios in Dio.
class TokenExpiredError extends DioException {
  TokenExpiredError({required super.requestOptions});
}

class Api extends BaseApi {
  Api({LocalStorage? storage, FutureOr<void> Function()? onUnauthorized})
    : _storage = storage,
      _onUnauthorized = onUnauthorized;

  final LocalStorage? _storage;
  final FutureOr<void> Function()? _onUnauthorized;
  static bool _handlingUnauthorized = false;

  /// Creates a new Dio instance with headers and interceptors configured.
  Dio _getInstance({bool enabledDioLogger = true}) {
    final Dio dio = Dio();

    dio.options.responseType = ResponseType.json;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
              final String token =
                  await _storage?.getString(key: StorageKeys.authToken) ?? '';

              if (token.isNotEmpty &&
                  options.headers['Authorization'] == null) {
                options.headers['Authorization'] = 'Bearer $token';
              }

              handler.next(options);
            },
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          if (error.response?.statusCode == 401) {
            await _handleUnauthorized();
          }

          handler.next(error);
        },
      ),
    );

    // Optional logging interceptor
    if (enabledDioLogger) {
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          error: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
    }

    return dio;
  }

  Future<void> _handleUnauthorized() async {
    if (_handlingUnauthorized) {
      return;
    }

    _handlingUnauthorized = true;
    try {
      await _storage?.removeKey(StorageKeys.authToken);
      await _storage?.removeKey(StorageKeys.authUser);
      await _onUnauthorized?.call();
    } finally {
      _handlingUnauthorized = false;
    }
  }

  /// Performs a GET request with token handling and retry logic.
  Future<Response<dynamic>> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool shouldRefreshExpiredToken = true,
    bool appendBaseUrl = true,
  }) async {
    final String effectiveUri = appendBaseUrl ? apiUrl + uri : uri;

    final Dio dio = _getInstance();
    options ??= Options();
    late Response<dynamic> response;

    try {
      response = await dio.get(
        effectiveUri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on TokenExpiredError {
      if (!shouldRefreshExpiredToken) {
        rethrow;
      }

      return dio.get(
        effectiveUri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (err) {
      rethrow;
    }

    return response;
  }

  /// Performs a POST request with token handling and retry logic.
  Future<Response<dynamic>> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final String effectiveUri = apiUrl + uri;

    final Dio dio = _getInstance();
    options ??= Options();
    late Response<dynamic> response;

    try {
      response = await dio.post(
        effectiveUri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on TokenExpiredError {
      return dio.post(
        effectiveUri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (err) {
      rethrow;
    }

    return response;
  }

  /// Performs a PUT request with token handling and retry logic.
  Future<Response<dynamic>> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final String effectiveUri = apiUrl + uri;

    final Dio dio = _getInstance();
    options ??= Options();
    late Response<dynamic> response;
    try {
      response = await dio.put(
        effectiveUri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on TokenExpiredError {
      return dio.put(
        effectiveUri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (err) {
      rethrow;
    }

    return response;
  }

  /// Performs a PATCH request with token handling and retry logic.
  Future<Response<dynamic>> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final String effectiveUri = apiUrl + uri;

    final Dio dio = _getInstance();
    options ??= Options();
    late Response<dynamic> response;

    try {
      response = await dio.patch(
        effectiveUri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on TokenExpiredError {
      return dio.patch(
        effectiveUri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (err) {
      rethrow;
    }

    return response;
  }

  /// Performs a DELETE request with token handling and retry logic.
  Future<Response<dynamic>> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final String effectiveUri = apiUrl + uri;

    final Dio dio = _getInstance();
    options ??= Options();
    late Response<dynamic> response;

    try {
      response = await dio.delete(
        effectiveUri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on TokenExpiredError {
      return dio.delete(
        effectiveUri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } catch (err) {
      rethrow;
    }
    return response;
  }

  /// Performs a downlaod request with token handling and retry logic.
  Future<Response<dynamic>> download(
    String uri,
    String savePath, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final String effectiveUri = apiUrl + uri;

    final Dio dio = _getInstance();
    options ??= Options();
    late Response<dynamic> response;

    try {
      response = await dio.download(
        effectiveUri,
        savePath,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on TokenExpiredError {
      return dio.download(
        apiUrl + effectiveUri,
        savePath,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } catch (err) {
      rethrow;
    }

    return response;
  }
}
