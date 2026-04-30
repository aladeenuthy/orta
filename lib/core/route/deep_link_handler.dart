import 'dart:async';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:orta/features/features.dart';

class DeepLinkHandler {
  DeepLinkHandler._();

  static final DeepLinkHandler instance = DeepLinkHandler._();
  static const Duration _splashWait = Duration(milliseconds: 2000);
  static const Duration _authReadyTimeout = Duration(seconds: 4);

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
    log('Deep link handler initialized', name: 'DeepLinkHandler');
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

    if (uri.scheme != 'orta') {
      log('Unhandled deep link scheme: ${uri.scheme}', name: 'DeepLinkHandler');
      return;
    }

    switch (_routePath(uri)) {
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
    log(
      " Opening reset password screen with args: uid=${args.userId}, token=${args.resetToken}",
      name: 'DeepLinkHandler',
    );

    if (source == _DeepLinkSource.initial) {
      await _waitForInitialRouteReadiness();
      AppRouter.toCloseAllNamed(AppRoutes.resetPassword, arguments: args);
      return;
    }

    AppRouter.toNamed(AppRoutes.resetPassword, arguments: args);
  }

  String _routePath(Uri uri) {
    if (uri.host == 'app') {
      return uri.path;
    }

    if (uri.host == AppRoutes.resetPassword.replaceFirst('/', '')) {
      return AppRoutes.resetPassword;
    }

    return uri.path;
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
