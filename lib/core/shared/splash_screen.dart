import "dart:async";

import "../../features/features.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Timer timer;
  final GlobalKey<BounceInAnimationState> _logoKey =
      GlobalKey<BounceInAnimationState>();

  Future<void> autoNavigate() async {
    if (!mounted) {
      return;
    }
    await AppRouter.toReplacementNamed(AppRoutes.register);
  }

  void splashTimer() {
    const Duration duration = Duration(milliseconds: 2200);
    timer = Timer(duration, autoNavigate);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logoKey.currentState?.bounce();
    });
    splashTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: BounceInAnimation(
          key: _logoKey,
          duration: const Duration(milliseconds: 1200),
          child: const OrtaBrand(
            iconSize: 44,
            fontSize: 22,
            centered: true,
            text: "Orta",
          ),
        ),
      ),
    );
  }
}
