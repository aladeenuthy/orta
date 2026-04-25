import "package:flutter/material.dart";
enum TransitionType { defaultTransition, none, size, scale, fade, rotate, slideDown, slideUp, slideLeft, slideRight }
class Transitions<T> extends PageRouteBuilder<T> {
  Transitions({
    required this.transitionType,
    this.curve = Curves.elasticInOut,
    this.reverseCurve = Curves.easeOut,
    this.duration = const Duration(milliseconds: 500),
    required String routeName,
    required this.widget,
  }) : super(
          settings: RouteSettings(name: routeName),
          transitionDuration: duration,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {

            switch (transitionType) {
              case TransitionType.none:
                return child;
              case TransitionType.size:
                return Align(
                  child: SizeTransition(
                    sizeFactor:
                        animation, //CurvedAnimation(parent: animation, curve: curve, reverseCurve: reverseCurve),
                    child: child,
                  ),
                );
              case TransitionType.scale:
                return ScaleTransition(
                  scale: animation,
                  alignment: Alignment.topRight,
                  child: child,
                );
              case TransitionType.fade:
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              case TransitionType.rotate:
                return RotationTransition(
                  alignment: Alignment.center,
                  turns: animation,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: animation,
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  ),
                );

              // SlideTransition position is an Animation<Offset> not Animation<double>
              // Use Tween<Offset>().animate(animation)
              case TransitionType.slideDown:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, -1.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              case TransitionType.slideUp:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, 1.0),
                    end: Offset.zero,
                  ).animate(animation),
                  //).animate(CurvedAnimation(parent: animation, curve: curve, reverseCurve: reverseCurve)),
                  child: child,
                );
              case TransitionType.slideLeft:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  //).animate(CurvedAnimation(parent: animation,curve: curve, reverseCurve: reverseCurve)),
                  child: child,
                );
              case TransitionType.slideRight:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              default:
                return FadeTransition(opacity: animation, child: child);
            }
          },
        );

  final TransitionType transitionType;
  final Curve curve;
  final Curve reverseCurve;
  final Duration duration;
  final Widget widget;
}

class SizeTransitionRoute extends PageRouteBuilder<dynamic> {
  SizeTransitionRoute({required this.widget})
      : super(
          transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return Align(
              child: SizeTransition(
                sizeFactor: animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
                child: child,
              ),
            );
          },
        );
  final Widget widget;
}

class ScaleTransitionRoute extends PageRouteBuilder<dynamic> {
  ScaleTransitionRoute({required this.widget})
      : super(
          transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
            return ScaleTransition(
              scale: animation,
              alignment: Alignment.topRight,
              child: child,
            );
          },
        );
  final Widget widget;
}

class FadeTransitionRoute extends PageRouteBuilder<dynamic> {
  FadeTransitionRoute({required this.widget})
      : super(
          transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
  final Widget widget;
}

class SlideUpRoute extends PageRouteBuilder<dynamic> {
  SlideUpRoute({required this.widget})
      : super(
          transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(animation),
              //).animate(CurvedAnimation(parent: animation, curve: Curves.elasticInOut)),
              child: child,
            );
          },
        );
  final Widget widget;
}
