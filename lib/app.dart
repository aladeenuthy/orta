import 'features/features.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<AuthCubit>(create: (_) => locator<AuthCubit>())],
      child: ScreenUtilInit(
        designSize: const Size(393, 883),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AppMocks.previewHomeDashboard ? const HomeScreen() : null,
            initialRoute: AppMocks.previewHomeDashboard
                ? null
                : AppRoutes.splash,
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
