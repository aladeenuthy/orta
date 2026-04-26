import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:orta/features/features.dart';

class MockApi extends Api {
  String? postedUri;
  dynamic postedData;
  Object? error;

  @override
  Future<Response<dynamic>> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int count, int total)? onSendProgress,
    void Function(int count, int total)? onReceiveProgress,
  }) async {
    postedUri = uri;
    postedData = data;

    final Object? currentError = error;
    if (currentError != null) {
      throw currentError;
    }

    return Response<dynamic>(
      requestOptions: RequestOptions(path: uri),
      data: <String, dynamic>{
        'token': 'token',
        'user': <String, dynamic>{
          'id': '69edb6a277d24da71a004b3e',
          'name': 'Test Doe',
          'email': 'Test@example.com',
          'role': 'worker',
        },
      },
    );
  }
}

void main() {
  group('AuthRemoteDataSource.register', () {
    test(
      'posts register payload and ignores successful response body',
      () async {
        final MockApi api = MockApi();
        final AuthRemoteDataSource dataSource = AuthRemoteDataSource(api: api);

        final Either<AppError, Unit> result = await dataSource.register(
          name: 'Test Doe',
          email: 'Test@example.com',
          password: 'Marine345@',
        );

        expect(result, equals(const Right<AppError, Unit>(unit)));
        expect(api.postedUri, Endpoints.register);
        expect(api.postedData, <String, dynamic>{
          'name': 'Test Doe',
          'email': 'Test@example.com',
          'password': 'Marine345@',
        });
      },
    );

    test('returns AppError when the API request fails', () async {
      final MockApi api = MockApi()
        ..error = DioException(
          requestOptions: RequestOptions(path: Endpoints.register),
          message: 'Server error',
        );
      final AuthRemoteDataSource dataSource = AuthRemoteDataSource(api: api);

      final Either<AppError, Unit> result = await dataSource.register(
        name: 'Test Doe',
        email: 'Test@example.com',
        password: 'Marine345@',
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (AppError error) => expect(error.message, isNotEmpty),
        (_) => fail('Expected AppError'),
      );
    });
  });
}
