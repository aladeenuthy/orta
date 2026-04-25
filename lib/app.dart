import 'features/features.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: ScreenUtilInit(
        designSize: const Size(393, 883),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            navigatorKey: AppRouter.navigatorKey,
            title: 'Orta',
            theme: appTheme(),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
