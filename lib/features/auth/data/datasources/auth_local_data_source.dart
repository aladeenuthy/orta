import 'package:orta/features/features.dart';

class AuthLocalDataSource {
  AuthLocalDataSource({required LocalStorage storage}) : _storage = storage;

  final LocalStorage _storage;

  Future<void> cacheSession(AuthSession session) async {
    await _storage.setString(key: StorageKeys.authToken, value: session.token);
    await _storage.setMap(
      key: StorageKeys.authUser,
      value: session.user.toJson(),
    );
  }
}
