import 'features/features.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (_) => locator<LoginCubit>()),
        BlocProvider<RegisterCubit>(create: (_) => locator<RegisterCubit>()),
        BlocProvider<ForgotPasswordCubit>(
          create: (_) => locator<ForgotPasswordCubit>(),
        ),
        BlocProvider<ResetPasswordCubit>(
          create: (_) => locator<ResetPasswordCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 883),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splash,
            navigatorKey: AppRouter.navigatorKey,
            onGenerateRoute: AppRouter.onGenerateRoute,
            title: 'Orta',
            theme: appTheme(),
          );
        },
      ),
    );
  }
}
