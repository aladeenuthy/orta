import 'package:orta/features/features.dart';

enum ShiftDecisionAction {
  accept,
  reject,
  clockIn,
  clockOut;

  String get message {
    return switch (this) {
      ShiftDecisionAction.accept =>
        'Please confirm that you want to accept this shift',
      ShiftDecisionAction.reject =>
        'Please confirm that you want to reject this shift as it wont appear in your feed',
      ShiftDecisionAction.clockIn =>
        'Please confirm that you want to clock in for this shift',
      ShiftDecisionAction.clockOut =>
        'Please confirm that you want to clock out from this shift',
    };
  }

  String get successMessage {
    return switch (this) {
      ShiftDecisionAction.accept => 'Shift accepted',
      ShiftDecisionAction.reject => 'Shift rejected',
      ShiftDecisionAction.clockIn => 'Clocked in successfully',
      ShiftDecisionAction.clockOut => 'Clocked out successfully',
    };
  }
}

class ShiftDecisionModal {
  const ShiftDecisionModal._();

  static Future<bool?> show({
    required BuildContext context,
    required ShiftDecisionAction action,
    VoidCallback? onConfirmed,
  }) {
    return showDialog<bool>(
      context: context,
      barrierColor: AppColors.textColor.withValues(alpha: .76),
      builder: (BuildContext dialogContext) {
        return ShiftDecisionDialog(action: action, onConfirmed: onConfirmed);
      },
    );
  }
}

class ShiftDecisionDialog extends StatelessWidget {
  const ShiftDecisionDialog({
    super.key,
    required this.action,
    this.onConfirmed,
  });

  final ShiftDecisionAction action;
  final VoidCallback? onConfirmed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.0.width),
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          34.0.width,
          28.0.height,
          34.0.width,
          28.0.height,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const _ShiftDecisionIcon(),
            AppSpacings.vertical(22),
            const _ShiftDecisionTitle(),
            AppSpacings.vertical(22),
            _ShiftDecisionMessage(action: action),
            AppSpacings.vertical(22),
            _ShiftDecisionConfirmButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                onConfirmed?.call();
              },
            ),
            AppSpacings.vertical(22),
            _ShiftDecisionCancelButton(
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShiftDecisionIcon extends StatelessWidget {
  const _ShiftDecisionIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0.width,
      height: 70.0.width,
      decoration: BoxDecoration(
        color: AppColors.alert.withValues(alpha: .13),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.error_outline,
        color: AppColors.alert,
        size: 34.0.radius,
      ),
    );
  }
}

class _ShiftDecisionTitle extends StatelessWidget {
  const _ShiftDecisionTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Are You Sure!',
      textAlign: TextAlign.center,
      style: context.text.headlineMedium?.copyWith(
        color: AppColors.textColor,
        fontSize: 26.0.fontSize,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _ShiftDecisionMessage extends StatelessWidget {
  const _ShiftDecisionMessage({required this.action});

  final ShiftDecisionAction action;

  @override
  Widget build(BuildContext context) {
    return Text(
      action.message,
      textAlign: TextAlign.center,
      style: context.text.bodyLarge?.copyWith(
        color: AppColors.textSecondary,
        fontSize: 16.0.fontSize,
        fontWeight: FontWeight.w400,
        height: 1.22,
      ),
    );
  }
}

class _ShiftDecisionConfirmButton extends StatelessWidget {
  const _ShiftDecisionConfirmButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      height: 43,
      borderRadius: BorderRadius.circular(8.0.radius),
      margin: EdgeInsets.zero,
      color: AppColors.primary,
      onPressed: onPressed,
      child: Text(
        'Confirm',
        style: context.text.titleMedium?.copyWith(
          color: AppColors.white,
          fontSize: 18.0.fontSize,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _ShiftDecisionCancelButton extends StatelessWidget {
  const _ShiftDecisionCancelButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 22.0.width,
          vertical: 5.0.height,
        ),
        child: Text(
          'Cancel',
          style: context.text.titleMedium?.copyWith(
            color: AppColors.primary,
            fontSize: 17.0.fontSize,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
