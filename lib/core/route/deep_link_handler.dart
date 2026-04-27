import 'dart:async';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:orta/features/features.dart';

class DeepLinkHandler {
  DeepLinkHandler._();

  static final DeepLinkHandler instance = DeepLinkHandler._();
  static const Duration _splashWait = Duration(milliseconds: 2200);
  static const Duration _authReadyTimeout = Duration(seconds: 5);

  late final AppLinks _appLinks;
  StreamSubscription<Uri>? _subscription;
  Uri? _lastHandledUri;
  bool _initialized = false;

  void init() {
    if (_initialized) {
      return;
    }

    _initialized = true;
    _appLinks = AppLinks();
    _handleInitialLink();
    _subscription = _appLinks.uriLinkStream.listen(
      _handleUri,
      onError: (Object error) {
        log('Deep link error', error: error, name: 'DeepLinkHandler');
      },
    );
  }

  Future<void> _handleInitialLink() async {
    try {
      final Uri? uri = await _appLinks.getInitialLink();
      if (uri == null) {
        return;
      }

      _handleUri(uri, source: _DeepLinkSource.initial);
    } catch (error) {
      log(
        'Error getting initial deep link',
        error: error,
        name: 'DeepLinkHandler',
      );
    }
  }

  void _handleUri(Uri uri, {_DeepLinkSource source = _DeepLinkSource.runtime}) {
    if (_lastHandledUri == uri) {
      return;
    }

    _lastHandledUri = uri;
    log('Deep link received: $uri', name: 'DeepLinkHandler');

    if (uri.scheme != 'orta' || uri.host != 'app') {
      log(
        'Unhandled deep link host: ${uri.scheme}://${uri.host}',
        name: 'DeepLinkHandler',
      );
      return;
    }

    switch (uri.path) {
      case AppRoutes.resetPassword:
        _openResetPassword(uri, source: source);
        return;
      default:
        log('Unhandled deep link path: ${uri.path}', name: 'DeepLinkHandler');
    }
  }

  Future<void> _openResetPassword(
    Uri uri, {
    required _DeepLinkSource source,
  }) async {
    final ResetPasswordArgs? args = ResetPasswordArgs.fromUri(uri);
    if (args == null) {
      log(
        'Reset password deep link missing uid/token',
        name: 'DeepLinkHandler',
      );
      return;
    }

    if (source == _DeepLinkSource.initial) {
      await _waitForInitialRouteReadiness();
      AppRouter.toCloseAllNamed(AppRoutes.resetPassword, arguments: args);
      return;
    }

    AppRouter.toNamed(AppRoutes.resetPassword, arguments: args);
  }

  Future<void> _waitForInitialRouteReadiness() async {
    await Future<void>.delayed(_splashWait);

    final AuthCubit authCubit = locator<AuthCubit>();
    if (!authCubit.state.isInitial && !authCubit.state.isLoading) {
      return;
    }

    try {
      await authCubit.stream
          .firstWhere((AuthState state) => !state.isInitial && !state.isLoading)
          .timeout(_authReadyTimeout);
    } on TimeoutException catch (error) {
      log(
        'Timed out waiting for auth initialization',
        error: error,
        name: 'DeepLinkHandler',
      );
    }
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
    _initialized = false;
  }
}

enum _DeepLinkSource { initial, runtime }
