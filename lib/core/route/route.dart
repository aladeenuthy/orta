import "package:orta/features/features.dart";

class AppRoutes {
  static const String splash = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgotPassword = "/forgot-password";
  static const String resetPassword = "/reset-password";
  static const String home = "/home";
}

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "rootNavKey");

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final Widget page = switch (settings.name) {
      AppRoutes.login => BlocProvider<LoginCubit>(
        create: (_) => locator<LoginCubit>(),
        child: const LoginScreen(),
      ),
      AppRoutes.register => BlocProvider<RegisterCubit>(
        create: (_) => locator<RegisterCubit>(),
        child: const RegisterScreen(),
      ),
      AppRoutes.forgotPassword => BlocProvider<ForgotPasswordCubit>(
        create: (_) => locator<ForgotPasswordCubit>(),
        child: const ForgotPasswordScreen(),
      ),
      AppRoutes.resetPassword => _resetPasswordScreen(settings.arguments),
      AppRoutes.home => const _TemporaryHomeScreen(),
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

  static Widget _resetPasswordScreen(Object? arguments) {
    if (arguments is ResetPasswordArgs) {
      return BlocProvider<ResetPasswordCubit>(
        create: (_) => locator<ResetPasswordCubit>(),
        child: ResetPasswordScreen(args: arguments),
      );
    }

    return BlocProvider<ForgotPasswordCubit>(
      create: (_) => locator<ForgotPasswordCubit>(),
      child: const ForgotPasswordScreen(),
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

class _TemporaryHomeScreen extends StatelessWidget {
  const _TemporaryHomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Home'),
            AppSpacings.vertical(20),
            AppButton(
              label: 'Logout',
              expanded: false,
              onPressed: () async {
                await context.read<AuthCubit>().logout();
                AppRouter.toCloseAllNamed(AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
