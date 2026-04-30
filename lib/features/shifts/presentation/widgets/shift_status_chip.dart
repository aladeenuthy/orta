import 'package:orta/features/features.dart';

class ShiftStatusChip extends StatelessWidget {
  const ShiftStatusChip({super.key, required this.status});

  final ShiftStatus? status;

  @override
  Widget build(BuildContext context) {
    final _ShiftStatusStyle style = _ShiftStatusStyle.fromStatus(status);

    return Container(
      constraints: BoxConstraints(minWidth: 82.0.width),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0.width,
        vertical: 7.0.height,
      ),
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(24.0.radius),
      ),
      alignment: Alignment.center,
      child: Text(
        style.label,
        style: context.text.bodyMedium?.copyWith(
          color: style.textColor,
          fontSize: 13.0.fontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _ShiftStatusStyle {
  const _ShiftStatusStyle({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  final String label;
  final Color backgroundColor;
  final Color textColor;

  static _ShiftStatusStyle fromStatus(ShiftStatus? status) {
    return switch (status) {
      ShiftStatus.inProgress => _ShiftStatusStyle(
        label: ShiftStatus.inProgress.label,
        backgroundColor: AppColors.ongoingChipBg,
        textColor: AppColors.primary,
      ),
      ShiftStatus.completed => _ShiftStatusStyle(
        label: ShiftStatus.completed.label,
        backgroundColor: AppColors.success.withValues(alpha: .12),
        textColor: AppColors.success,
      ),
      ShiftStatus.cancelled => _ShiftStatusStyle(
        label: ShiftStatus.cancelled.label,
        backgroundColor: AppColors.alert.withValues(alpha: .12),
        textColor: AppColors.alert,
      ),
      ShiftStatus.scheduled || null => _ShiftStatusStyle(
        label: ShiftStatus.scheduled.label,
        backgroundColor: AppColors.ongoingChipBg,
        textColor: AppColors.primary,
      ),
    };
  }
}
