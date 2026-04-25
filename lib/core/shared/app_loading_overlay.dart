import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({
    super.key,
    required this.child,
    this.overlayColor,
    this.loaderColor,
    this.loaderSize,
    this.loadingProgress,
    this.loading = false,
  });

  final Widget child;
  final bool loading;
  final Color? overlayColor;
  final double? loadingProgress;
  final Color? loaderColor;
  final double? loaderSize;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 1300),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      builder: (_, double animationValue, Widget? __) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            child,
            Positioned.fill(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: DecoratedBox(
                  key: ValueKey<bool>(loading),
                  decoration: BoxDecoration(
                    color: overlayColor ?? Colors.white.withValues(alpha: .50),
                  ),
                  child: !loading
                      ? const SizedBox.shrink()
                      : SizedBox.expand(
                          child: Center(
                            child: SizedBox(
                              width: loaderSize ?? 30,
                              height: loaderSize ?? 30,
                              child: const CupertinoActivityIndicator(),
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
