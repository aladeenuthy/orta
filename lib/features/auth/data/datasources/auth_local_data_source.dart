import 'package:orta/features/features.dart';

class AuthLocalDataSource {
  AuthLocalDataSource({required LocalStorage storage}) : _storage = storage;

  final LocalStorage _storage;

  Future<void> cacheSession(AuthSession session) async {
    await _storage.setString(key: StorageKeys.authToken, value: session.token);
    await cacheUser(session.user);
  }

  Future<void> cacheUser(User user) async {
    await _storage.setMap(key: StorageKeys.authUser, value: user.toJson());
  }

  Future<AuthSession?> getCachedSession() async {
    final String token = await _storage.getString(key: StorageKeys.authToken);
    final Map<String, dynamic> userJson = await _storage.getMap(
      key: StorageKeys.authUser,
    );

    if (token.isEmpty || userJson.isEmpty) return null;

    return AuthSession(token: token, user: User.fromJson(userJson));
  }

  Future<void> clearSession() async {
    await _storage.removeKey(StorageKeys.authToken);
    await _storage.removeKey(StorageKeys.authUser);
  }
}
