import "package:flutter/material.dart";
import "../route/route_transition.dart";

class AppRouter {
   static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavKey');
  static void back() {
    navigatorKey.currentState?.pop();
  }

  static bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }

  static Future<dynamic> to({
    required Widget page,
  }) async {
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

  static Future<dynamic> toReplacement({
    required Widget page,
  }) async {
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
