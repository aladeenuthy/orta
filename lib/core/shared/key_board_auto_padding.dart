import 'dart:ui' show FlutterView;

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class KeyboardAutoPadding extends StatelessWidget {
  /// A widget that automatically adds bottom padding to match
  /// the on-screen keyboard height (if any).
  ///
  /// The padding change is animated with [duration] and [curve].
  const KeyboardAutoPadding({
    super.key,
    this.child,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.fastLinearToSlowEaseIn,
    this.builder,
    this.dismissKeyboardOnTap = true,
  })
    //both `child` and `builder` are optional, but at least one must be provided.
    : assert(
         child != null || builder != null,
         'Either child or builder must be provided.',
       );
  final Widget? child;
  final Duration duration;
  final Curve curve;
  final bool dismissKeyboardOnTap;
  final Widget Function(
    BuildContext context,
    bool isKeyboardVisible,
    Widget? child,
  )?
  builder;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (BuildContext context, bool isKeyboardVisible) {
        final double bottomInset = _keyboardInset(context);
        // Use AnimatedPadding instead of AnimatedSize to avoid flickering
        // when child widget changes size independently of keyboard
        final Widget content = AnimatedPadding(
          duration: duration,
          curve: curve,
          padding: EdgeInsets.only(bottom: isKeyboardVisible ? bottomInset : 0),
          child: builder?.call(context, isKeyboardVisible, child) ?? child!,
        );

        if (!dismissKeyboardOnTap) {
          return content;
        }

        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: content,
        );
      },
    );
  }

  double _keyboardInset(BuildContext context) {
    final double mediaQueryInset = MediaQuery.viewInsetsOf(context).bottom;
    if (mediaQueryInset > 0) {
      return mediaQueryInset;
    }

    final FlutterView view = View.of(context);
    return view.viewInsets.bottom / view.devicePixelRatio;
  }
}
