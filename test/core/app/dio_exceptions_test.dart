import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:orta/features/features.dart';

void main() {
  DioException dioException({required int statusCode, required Object data}) {
    return DioException(
      requestOptions: RequestOptions(path: '/test'),
      response: Response<Object>(
        requestOptions: RequestOptions(path: '/test'),
        statusCode: statusCode,
        data: data,
      ),
      type: DioExceptionType.badResponse,
    );
  }

  group('DioExceptions', () {
    test('uses backend error message when present', () {
      final error = DioExceptions.fromDioError(
        dioException(
          statusCode: 404,
          data: <String, dynamic>{
            'name': 'Error',
            'message': 'User does not exist',
            'statusCode': 404,
            'errorCode': 'USER_NOT_FOUND',
            'timestamp': '2026-04-27T12:06:46.630Z',
          },
        ),
      );

      expect(error.message, 'User does not exist');
    });

    test('formats backend validation issues', () {
      final error = DioExceptions.fromDioError(
        dioException(
          statusCode: 400,
          data: <String, dynamic>{
            'name': 'ValidationError',
            'message': 'Validation failed',
            'statusCode': 400,
            'errorCode': 'VALIDATION_ERROR',
            'timestamp': '2026-04-27T12:09:04.721Z',
            'issues': <Map<String, String>>[
              <String, String>{
                'path': 'password',
                'error':
                    'Password must be min 8 characters long and include uppercase, lowercase, number, and symbol',
              },
            ],
          },
        ),
      );

      expect(
        error.message,
        'Validation failed: password: Password must be min 8 characters long and include uppercase, lowercase, number, and symbol',
      );
    });

    test('uses backend error field when message is absent', () {
      final error = DioExceptions.fromDioError(
        dioException(
          statusCode: 400,
          data: <String, dynamic>{
            'success': false,
            'data': <String, dynamic>{
              'withinRange': false,
              'distanceMeters': 231,
              'radiusMeters': 200,
            },
            'error':
                'You are not within the required distance of the shift location',
            'code': 'OUTSIDE_GEOFENCE',
          },
        ),
      );

      expect(
        error.message,
        'You are not within the required distance of the shift location',
      );
    });
  });
}
