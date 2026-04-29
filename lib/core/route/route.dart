import "package:orta/features/features.dart";

class AppRoutes {
  static const String splash = "/";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgotPassword = "/forgot-password";
  static const String resetPassword = "/reset-password";
  static const String otpVerification = "/otp-verification";
  static const String profileIntro = "/profile-intro";
  static const String profilePersonal = "/profile-personal";
  static const String profileSkills = "/profile-skills";
  static const String availabilitySetting = "/availability-setting";
  static const String availabilityConfirm = "/availability-confirm";
  static const String unavailability = "/unavailability";
  static const String profile = "/profile";
  static const String home = "/home";
  static const String shiftList = "/shift-list";
  static const String shiftDetail = "/shift-detail";
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
      AppRoutes.otpVerification => _otpVerificationScreen(settings.arguments),
      AppRoutes.profileIntro => const ProfileSetupIntroScreen(),
      AppRoutes.profilePersonal => BlocProvider<ProfileOnboardingCubit>.value(
        value: locator<ProfileOnboardingCubit>(),
        child: PersonalInformationScreen(
          args: _profileFlowArgs(settings.arguments),
        ),
      ),
      AppRoutes.profileSkills => BlocProvider<ProfileOnboardingCubit>.value(
        value: locator<ProfileOnboardingCubit>(),
        child: ProfileSkillsScreen(args: _profileFlowArgs(settings.arguments)),
      ),
      AppRoutes.availabilitySetting => BlocProvider<AvailabilityCubit>.value(
        value: locator<AvailabilityCubit>(),
        child: AvailabilitySettingScreen(
          args: _profileFlowArgs(settings.arguments),
        ),
      ),
      AppRoutes.availabilityConfirm => BlocProvider<AvailabilityCubit>.value(
        value: locator<AvailabilityCubit>(),
        child: const AvailabilityConfirmScreen(),
      ),
      AppRoutes.unavailability => _unavailabilityScreen(settings.arguments),
      AppRoutes.profile => const ProfileScreen(),
      AppRoutes.home => const HomeScreen(),
      AppRoutes.shiftList => _shiftListScreen(settings.arguments),
      AppRoutes.shiftDetail => _shiftDetailScreen(settings.arguments),
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

  static ProfileFlowArgs _profileFlowArgs(Object? arguments) {
    if (arguments is ProfileFlowArgs) {
      return arguments;
    }

    return const ProfileFlowArgs();
  }

  static Widget _otpVerificationScreen(Object? arguments) {
    if (arguments is OtpVerificationArgs) {
      final OtpVerificationCubit cubit = locator<OtpVerificationCubit>();
      if (arguments.autoSendOtp) {
        cubit.sendOtp(arguments.email);
      }

      return BlocProvider<OtpVerificationCubit>(
        create: (_) => cubit,
        child: OtpVerificationScreen(args: arguments),
      );
    }

    return BlocProvider<RegisterCubit>(
      create: (_) => locator<RegisterCubit>(),
      child: const RegisterScreen(),
    );
  }

  static Widget _shiftListScreen(Object? arguments) {
    if (arguments is ShiftListArgs) {
      return ShiftListScreen(args: arguments);
    }

    return const HomeScreen();
  }

  static Widget _shiftDetailScreen(Object? arguments) {
    if (arguments is ShiftDetailArgs) {
      return ShiftDetailScreen(args: arguments);
    }

    return const HomeScreen();
  }

  static Widget _unavailabilityScreen(Object? arguments) {
    if (arguments is UnavailabilityManagementArgs) {
      return BlocProvider<UnavailabilityCubit>.value(
        value: arguments.cubit,
        child: const UnavailabilityManagementScreen(),
      );
    }

    return BlocProvider<UnavailabilityCubit>(
      create: (_) => locator<UnavailabilityCubit>()..load(),
      child: const UnavailabilityManagementScreen(),
    );
  }

  static void back<T extends Object?>([T? result]) {
    navigatorKey.currentState?.pop<T>(result);
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
