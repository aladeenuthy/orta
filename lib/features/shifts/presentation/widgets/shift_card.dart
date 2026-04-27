import 'package:orta/features/features.dart';

class ShiftCard extends StatelessWidget {
  const ShiftCard({
    super.key,
    required this.shift,
    this.showOngoingChip = false,
    this.showActions = false,
    this.onAccept,
    this.onReject,
  });

  final Shift shift;
  final bool showOngoingChip;
  final bool showActions;
  final ValueChanged<Shift>? onAccept;
  final ValueChanged<Shift>? onReject;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        final String shiftId = shift.id;

        AppRouter.toNamed(
          AppRoutes.shiftDetail,
          arguments: ShiftDetailArgs(shiftId: shiftId),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 18.0.height),
        padding: EdgeInsets.fromLTRB(
          14.0.width,
          18.0.height,
          14.0.width,
          16.0.height,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.0.radius),
          border: Border.all(color: AppColors.cardBorder),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.textColor.withValues(alpha: .08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 3.0.height),
                    child: Row(
                      children: [
                        const LocationMark(),
                        AppSpacings.horizontal(10),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 3.0.height),
                            child: Text(
                              shift.location.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.text.titleLarge?.copyWith(
                                color: AppColors.textColor.withValues(
                                  alpha: .86,
                                ),
                                fontSize: 16.0.fontSize,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AppSpacings.horizontal(5),
                if (showOngoingChip) ShiftStatusChip(status: shift.status),
              ],
            ),
            AppSpacings.vertical(17),
            _ShiftInfoRow(
              icon: Icons.schedule_outlined,
              text: _formatShiftDateTime(shift),
            ),
            AppSpacings.vertical(11),
            _ShiftInfoRow(icon: Icons.person_outline, text: shift.user),
            AppSpacings.vertical(11),
            _ShiftInfoRow(
              icon: CupertinoIcons.money_pound,
              text: _formatPay(shift.pay),
              iconSize: 28,
            ),
            if (showActions) ...<Widget>[
              AppSpacings.vertical(14),
              _ShiftActions(
                shift: shift,
                onAccept: onAccept,
                onReject: onReject,
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatShiftDateTime(Shift shift) {
    const List<String> months = <String>[
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    final DateTime date = shift.date;
    return '${months[date.month - 1]} ${date.day}, ${date.year}, ${_ShiftTimeFormatter.twelveHour(shift.startTime)}';
  }

  String _formatPay(num? pay) {
    if (pay == null) {
      return '120';
    }

    if (pay % 1 == 0) {
      return pay.toInt().toString();
    }

    return pay.toStringAsFixed(2);
  }
}

class _ShiftActions extends StatelessWidget {
  const _ShiftActions({
    required this.shift,
    required this.onAccept,
    required this.onReject,
  });

  final Shift shift;
  final ValueChanged<Shift>? onAccept;
  final ValueChanged<Shift>? onReject;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _ShiftActionButton(
          label: 'Accept',
          filled: true,
          onTap: () {
            ShiftDecisionModal.show(
              context: context,
              action: ShiftDecisionAction.accept,
              onConfirmed: () {
                onAccept?.call(shift);
              },
            );
          },
        ),
        AppSpacings.horizontal(18),
        _ShiftActionButton(
          label: 'Reject',
          filled: false,
          onTap: () {
            ShiftDecisionModal.show(
              context: context,
              action: ShiftDecisionAction.reject,
              onConfirmed: () {
                onReject?.call(shift);
              },
            );
          },
        ),
      ],
    );
  }
}

class _ShiftTimeFormatter {
  const _ShiftTimeFormatter._();

  static String twelveHour(DateTime time) {
    final int hourOfPeriod = time.hour % 12;
    final int hour = hourOfPeriod == 0 ? 12 : hourOfPeriod;
    final String minute = time.minute.toString().padLeft(2, '0');
    final String period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }
}

class _ShiftInfoRow extends StatelessWidget {
  const _ShiftInfoRow({
    required this.icon,
    required this.text,
    this.iconSize = 24,
  });

  final IconData icon;
  final String text;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 28.0.width,
          child: Icon(icon, color: AppColors.textColor, size: iconSize.radius),
        ),
        AppSpacings.horizontal(12),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.text.bodyLarge?.copyWith(
              color: AppColors.textColor.withValues(alpha: .82),
              fontSize: 15.0.fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShiftActionButton extends StatelessWidget {
  const _ShiftActionButton({
    required this.label,
    required this.filled,
    required this.onTap,
  });

  final String label;
  final bool filled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 84.0.width,
        height: 32.0.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: filled ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(20.0.radius),
          border: filled ? null : Border.all(color: AppColors.cardBorder),
        ),
        child: Text(
          label,
          style: context.text.titleMedium?.copyWith(
            color: filled ? AppColors.white : AppColors.primary,
            fontSize: 14.0.fontSize,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
