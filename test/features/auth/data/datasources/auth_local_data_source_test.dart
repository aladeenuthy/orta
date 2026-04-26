import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  late MockLocalStorage storage;
  late AuthLocalDataSource dataSource;

  setUp(() {
    storage = MockLocalStorage();
    dataSource = AuthLocalDataSource(storage: storage);
  });

  group('AuthLocalDataSource.cacheSession', () {
    test('caches token and user object', () async {
      when(
        () => storage.setString(key: StorageKeys.authToken, value: 'token'),
      ).thenAnswer((_) async {});
      when(
        () => storage.setMap(
          key: StorageKeys.authUser,
          value: <String, dynamic>{
            'id': '69edb6a277d24da71a004b3e',
            'name': 'Test Doe',
            'email': 'Test@example.com',
            'role': 'worker',
          },
        ),
      ).thenAnswer((_) async {});

      await dataSource.cacheSession(
        const AuthSession(
          token: 'token',
          user: User(
            id: '69edb6a277d24da71a004b3e',
            name: 'Test Doe',
            email: 'Test@example.com',
            role: 'worker',
          ),
        ),
      );

      verify(
        () => storage.setString(key: StorageKeys.authToken, value: 'token'),
      ).called(1);
      verify(
        () => storage.setMap(
          key: StorageKeys.authUser,
          value: <String, dynamic>{
            'id': '69edb6a277d24da71a004b3e',
            'name': 'Test Doe',
            'email': 'Test@example.com',
            'role': 'worker',
          },
        ),
      ).called(1);
    });
  });
}
