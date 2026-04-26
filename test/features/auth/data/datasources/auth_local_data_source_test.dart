import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  late MockLocalStorage storage;
  late AuthLocalDataSource dataSource;

  const User user = User(
    id: '69edb6a277d24da71a004b3e',
    name: 'Test Doe',
    email: 'Test@example.com',
    role: 'worker',
  );
  const AuthSession session = AuthSession(token: 'token', user: user);
  const Map<String, dynamic> userJson = <String, dynamic>{
    'id': '69edb6a277d24da71a004b3e',
    'name': 'Test Doe',
    'email': 'Test@example.com',
    'role': 'worker',
  };

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
        () => storage.setMap(key: StorageKeys.authUser, value: userJson),
      ).thenAnswer((_) async {});

      await dataSource.cacheSession(session);

      verify(
        () => storage.setString(key: StorageKeys.authToken, value: 'token'),
      ).called(1);
      verify(
        () => storage.setMap(key: StorageKeys.authUser, value: userJson),
      ).called(1);
    });
  });

  group('AuthLocalDataSource.cacheUser', () {
    test('caches user object', () async {
      when(
        () => storage.setMap(key: StorageKeys.authUser, value: userJson),
      ).thenAnswer((_) async {});

      await dataSource.cacheUser(user);

      verify(
        () => storage.setMap(key: StorageKeys.authUser, value: userJson),
      ).called(1);
    });
  });

  group('AuthLocalDataSource.getCachedSession', () {
    test('returns cached session when token and user exist', () async {
      when(
        () => storage.getString(key: StorageKeys.authToken),
      ).thenAnswer((_) async => 'token');
      when(
        () => storage.getMap(key: StorageKeys.authUser),
      ).thenAnswer((_) async => userJson);

      final AuthSession? result = await dataSource.getCachedSession();

      expect(result, equals(session));
      verify(() => storage.getString(key: StorageKeys.authToken)).called(1);
      verify(() => storage.getMap(key: StorageKeys.authUser)).called(1);
    });

    test('returns null when token is missing', () async {
      when(
        () => storage.getString(key: StorageKeys.authToken),
      ).thenAnswer((_) async => '');
      when(
        () => storage.getMap(key: StorageKeys.authUser),
      ).thenAnswer((_) async => userJson);

      final AuthSession? result = await dataSource.getCachedSession();

      expect(result, isNull);
    });

    test('returns null when user is missing', () async {
      when(
        () => storage.getString(key: StorageKeys.authToken),
      ).thenAnswer((_) async => 'token');
      when(
        () => storage.getMap(key: StorageKeys.authUser),
      ).thenAnswer((_) async => <String, dynamic>{});

      final AuthSession? result = await dataSource.getCachedSession();

      expect(result, isNull);
    });
  });

  group('AuthLocalDataSource.clearSession', () {
    test('removes cached token and user object', () async {
      when(
        () => storage.removeKey(StorageKeys.authToken),
      ).thenAnswer((_) async {});
      when(
        () => storage.removeKey(StorageKeys.authUser),
      ).thenAnswer((_) async {});

      await dataSource.clearSession();

      verify(() => storage.removeKey(StorageKeys.authToken)).called(1);
      verify(() => storage.removeKey(StorageKeys.authUser)).called(1);
    });
  });
}
