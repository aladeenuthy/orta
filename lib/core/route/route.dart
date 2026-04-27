import "package:orta/features/features.dart";

class AppRoutes {
  static const String splash = "/";
  static const String login = "/login";
  static const String register = "/register";
}

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "rootNavKey");

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final Widget page = switch (settings.name) {
      AppRoutes.login => const LoginScreen(),
      AppRoutes.register => const RegisterScreen(),
      AppRoutes.splash || _ => const SplashScreen(),
    };

    return Transitions<dynamic>(
      routeName: settings.name ?? AppRoutes.splash,
      transitionType: TransitionType.fade,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.fastOutSlowIn,
      widget: page,
    );
  }

  static void back() {
    navigatorKey.currentState?.pop();
  }

  static bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }

  static Future<dynamic> toNamed(String routeName, {Object? arguments}) async {
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic> toReplacementNamed(
    String routeName, {
    Object? arguments,
  }) async {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic> toCloseAllNamed(
    String routeName, {
    Object? arguments,
  }) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  static Future<dynamic> to({required Widget page}) async {
    return navigatorKey.currentState?.push(
      Transitions<dynamic>(
        routeName: page.runtimeType.toString(),
        transitionType: TransitionType.fade,
        duration: const Duration(milliseconds: 500),
        curve: Curves.bounceInOut,
        reverseCurve: Curves.fastOutSlowIn,
        widget: page,
      ),
    );
  }

  static Future<dynamic> toReplacement({required Widget page}) async {
    return navigatorKey.currentState?.pushReplacement(
      Transitions<dynamic>(
        routeName: page.runtimeType.toString(),
        transitionType: TransitionType.fade,
        duration: const Duration(milliseconds: 500),
        curve: Curves.bounceInOut,
        reverseCurve: Curves.fastOutSlowIn,
        widget: page,
      ),
    );
  }

  static Future<dynamic> toCloseAll({required Widget p, bool? isFirst}) async {
    return navigatorKey.currentState?.pushAndRemoveUntil(
      Transitions<dynamic>(
        routeName: p.runtimeType.toString(),
        transitionType: TransitionType.fade,
        duration: const Duration(milliseconds: 500),
        curve: Curves.bounceInOut,
        reverseCurve: Curves.fastOutSlowIn,
        widget: p,
      ),
      (Route<dynamic> route) => isFirst ?? false,
    );
  }
}
