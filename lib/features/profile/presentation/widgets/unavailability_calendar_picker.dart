import 'package:orta/features/features.dart';

class UnavailabilityCalendarPicker extends StatelessWidget {
  const UnavailabilityCalendarPicker({
    super.key,
    required this.visibleMonth,
    required this.unavailablePeriods,
    required this.onPreviousMonth,
    required this.onNextMonth,
  });

  final DateTime visibleMonth;
  final List<UnavailabilityPeriod> unavailablePeriods;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _CalendarHeader(
          visibleMonth: visibleMonth,
          onPrevious: onPreviousMonth,
          onNext: onNextMonth,
        ),
        AppSpacings.vertical(24),
        const _WeekdayRow(),
        AppSpacings.vertical(20),
        _CalendarDaysGrid(
          visibleMonth: visibleMonth,
          unavailablePeriods: unavailablePeriods,
        ),
      ],
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  const _CalendarHeader({
    required this.visibleMonth,
    required this.onPrevious,
    required this.onNext,
  });

  final DateTime visibleMonth;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            DateUtils.monthYear(visibleMonth),
            style: context.text.titleLarge?.copyWith(
              color: AppColors.textColor,
              fontSize: 17.0.fontSize,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        IconButton(onPressed: onPrevious, icon: const Icon(Icons.chevron_left)),
        IconButton(onPressed: onNext, icon: const Icon(Icons.chevron_right)),
      ],
    );
  }
}

class _WeekdayRow extends StatelessWidget {
  const _WeekdayRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <String>['S', 'M', 'T', 'W', 'T', 'F', 'S']
          .map(
            (String day) => Expanded(
              child: Center(
                child: Text(
                  day,
                  style: context.text.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 15.0.fontSize,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _CalendarDaysGrid extends StatelessWidget {
  const _CalendarDaysGrid({
    required this.visibleMonth,
    required this.unavailablePeriods,
  });

  final DateTime visibleMonth;
  final List<UnavailabilityPeriod> unavailablePeriods;

  @override
  Widget build(BuildContext context) {
    final DateTime today = _normalize(DateTime.now());
    final List<DateTime?> dates = _calendarDates();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dates.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 18,
      ),
      itemBuilder: (BuildContext context, int index) {
        final DateTime? date = dates[index];
        if (date == null) return const SizedBox.shrink();

        final bool unavailable = unavailablePeriods.any(
          (UnavailabilityPeriod item) => _isWithinPeriod(date, item),
        );
        final bool disabled = date.isBefore(today);

        return _CalendarDayButton(
          date: date,
          unavailable: unavailable,
          disabled: disabled,
        );
      },
    );
  }

  List<DateTime?> _calendarDates() {
    final DateTime firstDay = DateTime(visibleMonth.year, visibleMonth.month);
    final DateTime nextMonth = DateTime(
      visibleMonth.year,
      visibleMonth.month + 1,
    );
    final int daysInMonth = nextMonth.subtract(const Duration(days: 1)).day;
    final int leadingEmpty = firstDay.weekday % DateTime.daysPerWeek;

    return <DateTime?>[
      ...List<DateTime?>.filled(leadingEmpty, null),
      ...List<DateTime>.generate(
        daysInMonth,
        (int index) =>
            DateTime(visibleMonth.year, visibleMonth.month, index + 1),
      ),
    ];
  }

  DateTime _normalize(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  bool _isWithinPeriod(DateTime date, UnavailabilityPeriod period) {
    final DateTime current = _normalize(date);
    final DateTime start = _normalize(period.startDate);
    final DateTime end = _normalize(period.endDate);

    return !current.isBefore(start) && !current.isAfter(end);
  }
}

class _CalendarDayButton extends StatelessWidget {
  const _CalendarDayButton({
    required this.date,
    required this.unavailable,
    required this.disabled,
  });

  final DateTime date;
  final bool unavailable;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: unavailable ? AppColors.alert : AppColors.white,
        shape: BoxShape.circle,
        border: unavailable
            ? null
            : Border.all(
                color: _isToday() ? AppColors.primary : AppColors.white,
              ),
      ),
      child: Text(
        date.day.toString(),
        style: context.text.bodyLarge?.copyWith(
          color: _textColor(),
          fontSize: 14.0.fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  bool _isToday() {
    return DateUtils.dateOnly(date) == DateUtils.dateOnly(DateTime.now());
  }

  Color _textColor() {
    if (unavailable) return AppColors.white;
    if (disabled) return AppColors.grey;
    return AppColors.textColor;
  }
}
