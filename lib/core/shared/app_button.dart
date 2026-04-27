import 'dart:math';

import 'package:flutter/services.dart';

import '../../features/features.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    this.label,
    this.onPressed,
    this.child,
    this.color,
    this.textColor = Colors.white,
    this.enabled = true,
    this.borderRadius,
    this.margin,
    this.holdToConfirm = false,
    this.holdDuration = const Duration(seconds: 1),
    this.onHoldChanged,
    this.expanded = true,
    this.height,
  }) : gradient = null,
       assert(label != null || child != null);

  const AppButton.gradient({
    super.key,
    this.label,
    this.onPressed,
    this.child,
    required this.gradient,
    this.textColor = Colors.white,
    this.enabled = true,
    this.borderRadius,
    this.margin,
    this.holdToConfirm = false,
    this.holdDuration = const Duration(seconds: 1),
    this.onHoldChanged,
    this.expanded = true,
    this.height,
  }) : color = Colors.transparent,
       assert(label != null || child != null);
  final String? label;
  final VoidCallback? onPressed;
  final Widget? child;
  final Color? color;
  final Color textColor;
  final bool enabled;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final Gradient? gradient;
  final double? height;

  /// When true, the user must press and hold for [holdDuration] before [onPressed] is called.
  final bool holdToConfirm;

  /// How long the user must hold before the callback is triggered.
  final Duration holdDuration;

  /// Optional callback to notify when the hold state changes.
  final ValueChanged<bool>? onHoldChanged;

  /// When true, the button expands to fill the available width. Defaults to true.
  final bool expanded;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _holdController;
  bool _isHolding = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _holdController = AnimationController(
      vsync: this,
      duration: widget.holdDuration,
    );
    _holdController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        HapticFeedback.lightImpact();
        widget.onPressed?.call();
        _resetHold();
      }
    });
  }

  @override
  void dispose() {
    _holdController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.enabled) {
      return;
    }
    if (widget.holdToConfirm) {
      setState(() {
        _isHolding = true;
      });
      widget.onHoldChanged?.call(true);
      _holdController.forward(from: 0.0);
    } else {
      setState(() {
        _isPressed = true;
      });
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (!widget.enabled) {
      return;
    }
    if (widget.holdToConfirm &&
        _holdController.status != AnimationStatus.completed) {
      _holdController.stop();
      _resetHold();
    } else {
      setState(() {
        _isPressed = false;
      });
    }
  }

  void _handleTapCancel() {
    if (!widget.enabled) {
      return;
    }
    if (widget.holdToConfirm) {
      _holdController.stop();
      _resetHold();
    } else {
      setState(() {
        _isPressed = false;
      });
    }
  }

  void _resetHold() {
    if (!mounted) {
      return;
    }
    setState(() {
      _isHolding = false;
    });
    widget.onHoldChanged?.call(false);
    _holdController.reset();
  }

  @override
  Widget build(BuildContext context) {
    // Build the button content (the visual parts remain unchanged).
    final bgColor = widget.color ?? AppColors.secondary;
    final Widget buttonContent = AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 1200),
      curve: Curves.fastLinearToSlowEaseIn,
      style: context.text.labelLarge!,
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: widget.enabled && !widget.holdToConfirm
            ? () {
                HapticFeedback.lightImpact();
                widget.onPressed?.call();
              }
            : null,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 1200),
          curve: Curves.fastLinearToSlowEaseIn,
          opacity: widget.enabled ? 1 : 1.0,
          child: Container(
            height: widget.height?.height ?? 40.0.height,
            decoration: BoxDecoration(
              color: widget.gradient == null
                  ? widget.enabled
                        ? bgColor
                        : AppColors.grey
                  : null,
              gradient: widget.gradient,
              borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedBuilder(
                      animation: _holdController,
                      builder: (BuildContext context, Widget? child) {
                        return LayoutBuilder(
                          builder:
                              (
                                BuildContext context,
                                BoxConstraints constraints,
                              ) {
                                final double progress = _isHolding
                                    ? _holdController.value
                                    : 0;
                                return AnimatedContainer(
                                  height: max(56, 56),
                                  duration: Duration(
                                    milliseconds: _isHolding ? 0 : 1000,
                                  ),
                                  width: !_isHolding
                                      ? 0
                                      : constraints.maxWidth * progress,
                                  transformAlignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        widget.borderRadius ??
                                        BorderRadius.circular(40),
                                    color: AppColors.primary.withValues(
                                      alpha: .48,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                );
                              },
                        );
                      },
                    ),
                  ),
                ),
                IgnorePointer(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: _isPressed && !widget.holdToConfirm ? 0.5 : 1.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widget.expanded ? 0 : 20,
                      ),
                      child: widget.child ?? Text(widget.label!),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (widget.expanded) {
      return Padding(
        padding: widget.margin ?? AppPaddings.bodyHorizontal,
        child: buttonContent,
      );
    } else {
      return Padding(
        padding: widget.margin ?? EdgeInsets.zero,
        child: buttonContent,
      );
    }
  }
}
