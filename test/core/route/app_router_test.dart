import 'package:flutter_test/flutter_test.dart';
import 'package:orta/features/features.dart';

void main() {
  group('AppRouter.onGenerateRoute', () {
    test('returns the splash screen for the splash route', () {
      final route = AppRouter.onGenerateRoute(
        const RouteSettings(name: AppRoutes.splash),
      );

      expect(route.settings.name, AppRoutes.splash);
      expect((route as Transitions<dynamic>).widget, isA<SplashScreen>());
    });

    test('returns the login screen for the login route', () {
      final route = AppRouter.onGenerateRoute(
        const RouteSettings(name: AppRoutes.login),
      );

      expect(route.settings.name, AppRoutes.login);
      expect((route as Transitions<dynamic>).widget, isA<LoginScreen>());
    });

    test('returns the register screen for the register route', () {
      final route = AppRouter.onGenerateRoute(
        const RouteSettings(name: AppRoutes.register),
      );

      expect(route.settings.name, AppRoutes.register);
      expect((route as Transitions<dynamic>).widget, isA<RegisterScreen>());
    });

    test('falls back to the splash screen for unknown routes', () {
      final route = AppRouter.onGenerateRoute(
        const RouteSettings(name: '/missing'),
      );

      expect(route.settings.name, '/missing');
      expect((route as Transitions<dynamic>).widget, isA<SplashScreen>());
    });
  });
}
