import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/resources.dart';
import 'app_spinner.dart';

class AppRefreshIndicator extends StatelessWidget {
  const AppRefreshIndicator({
    super.key,
    required this.onRefresh,
    this.loadingColor,
    this.backgroundColor,
    this.safeAreaTopSpacing = true,
    this.marginTop = 0.0,
  });

  final Color? loadingColor;
  final Color? backgroundColor;
  final bool safeAreaTopSpacing;
  final double marginTop;
  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    final Color color = loadingColor ?? AppColors.secondary;

    return CupertinoSliverRefreshControl(
      builder:
          (
            BuildContext context,
            RefreshIndicatorMode refreshState,
            double pulledExtent,
            double refreshTriggerPullDistance,
            double refreshIndicatorExtent,
          ) {
            return SafeArea(
              top: safeAreaTopSpacing,
              bottom: false,
              left: false,
              right: false,
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Positioned.fill(
                      child: ColoredBox(
                        color: backgroundColor ?? Colors.transparent,
                      ),
                    ),
                    Positioned(
                      top: marginTop,
                      left: 0.0,
                      right: 0.0,
                      child: Builder(
                        builder: (_) {
                          final double percentageComplete =
                              (pulledExtent / refreshTriggerPullDistance).clamp(
                                0.0,
                                1.0,
                              );
                          switch (refreshState) {
                            case RefreshIndicatorMode.drag:
                              const Curve opacityCurve = Interval(
                                0.0,
                                0.5,
                                curve: Curves.easeInOut,
                              );
                              return Opacity(
                                opacity: opacityCurve.transform(
                                  percentageComplete,
                                ),
                                child: AppSpinner(
                                  color: color,
                                  size: 30 * percentageComplete,
                                ),
                              );
                            case RefreshIndicatorMode.armed:
                            case RefreshIndicatorMode.refresh:
                              return AppSpinner(
                                color: color,
                                size: 30 * percentageComplete,
                              );
                            case RefreshIndicatorMode.done:
                              return AppSpinner(
                                size: 30 * percentageComplete,
                                color: color,
                              );
                            case RefreshIndicatorMode.inactive:
                              return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
      onRefresh: onRefresh,
    );
  }
}
