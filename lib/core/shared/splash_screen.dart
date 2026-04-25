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

  Future<void> autoNavigate() async {}

  void splashTimer() {
    const Duration duration = Duration(seconds: 5);
    timer = Timer(duration, autoNavigate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.primary, body: Center());
  }
}
