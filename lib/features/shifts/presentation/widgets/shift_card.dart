import 'package:orta/features/features.dart';

class ShiftCard extends StatelessWidget {
  const ShiftCard({
    super.key,
    required this.shift,
    this.showOngoingChip = false,
    this.showActions = false,
  });

  final Shift shift;
  final bool showOngoingChip;
  final bool showActions;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              const _LocationMark(),
              AppSpacings.horizontal(10),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 3.0.height),
                  child: Text(
                    shift.location.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.titleLarge?.copyWith(
                      color: AppColors.textColor.withValues(alpha: .86),
                      fontSize: 16.0.fontSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              AppSpacings.horizontal(5),
              if (showOngoingChip) const _OngoingChip(),
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
            Row(
              children: <Widget>[
                _ShiftActionButton(label: 'Accept', filled: true, onTap: () {}),
                AppSpacings.horizontal(18),
                _ShiftActionButton(
                  label: 'Reject',
                  filled: false,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ],
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
    return '${months[date.month - 1]} ${date.day}, ${date.year}, ${shift.startTime}';
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

class _LocationMark extends StatelessWidget {
  const _LocationMark();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.0.height),
      child: Text(
        'adyen',
        style: context.text.titleMedium?.copyWith(
          color: AppColors.brandGreen,
          fontSize: 17.0.fontSize,
          fontWeight: FontWeight.w900,
          height: 1,
        ),
      ),
    );
  }
}

class _OngoingChip extends StatelessWidget {
  const _OngoingChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 75.0.width),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0.width,
        vertical: 7.0.height,
      ),
      decoration: BoxDecoration(
        color: AppColors.ongoingChipBg,
        borderRadius: BorderRadius.circular(24.0.radius),
      ),
      alignment: Alignment.center,
      child: Text(
        'Ongoing',
        style: context.text.bodyMedium?.copyWith(
          color: AppColors.primary,
          fontSize: 13.0.fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
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
