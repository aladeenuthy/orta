import "dart:async";
import "dart:developer";

import "package:dartz/dartz.dart";
import "package:dio/dio.dart";

import "../app/error.dart";
import "api.dart";

abstract class ServiceEvent {}

abstract class BaseAppRepository {
  BaseAppRepository({required Api api}) : _api = api;

  final Api _api;

  final StreamController<ServiceEvent> _eventStream =
      StreamController<ServiceEvent>.broadcast();

  Stream<ServiceEvent> get eventStream => _eventStream.stream;

  void publishEvent(ServiceEvent event) {
    _eventStream.add(event);
  }

  Future<Either<AppError, T>> makeRequest<T>(
    Future<Either<AppError, T>> Function() request,
  ) async {
    try {
      final Either<AppError, T> response = await request();
      return response;
    } on DioException catch (err) {
      final String errorMessage = DioExceptions.fromDioError(err).toString();
      return Left<AppError, T>(AppError(errorMessage));
    } catch (err, stack) {
      log("Error: $err", stackTrace: stack);
      return Left<AppError, T>(const AppError("Something went wrong"));
    }
  }

  Future<Response<dynamic>> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) {
    return _api.post(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<dynamic>> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    bool appendBaseUrl = true,
  }) {
    return _api.get(
      uri,
      appendBaseUrl: appendBaseUrl,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<dynamic>> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) {
    return _api.delete(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<dynamic>> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) {
    return _api.patch(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
