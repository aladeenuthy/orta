import 'package:orta/features/features.dart';

class MarketplaceSearchField extends StatelessWidget {
  const MarketplaceSearchField({
    super.key,
    required this.onChanged,
    required this.onFilterTap,
  });

  final ValueChanged<String> onChanged;
  final VoidCallback onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0.height,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28.0.radius),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: <Widget>[
          AppSpacings.horizontal(18),
          Icon(Icons.search, color: AppColors.greyDark, size: 24.0.radius),
          AppSpacings.horizontal(12),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Search for shift',
                hintStyle: context.text.bodyLarge?.copyWith(
                  color: AppColors.greyDark,
                  fontSize: 15.0.fontSize,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onFilterTap,
            icon: Icon(
              Icons.tune_rounded,
              color: AppColors.greyDark,
              size: 28.0.radius,
            ),
          ),
          AppSpacings.horizontal(8),
        ],
      ),
    );
  }
}

class MarketplaceFilterChips extends StatelessWidget {
  const MarketplaceFilterChips({
    super.key,
    required this.filters,
    required this.onChanged,
  });

  final ShiftFilters filters;
  final ValueChanged<ShiftFilters> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.0.height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _FilterChipButton(
            label: filters.date == null
                ? 'Date'
                : DateUtils.monthDay(filters.date!),
            active: filters.date != null,
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                initialDate: filters.date ?? DateTime.now(),
              );
              if (picked != null) {
                onChanged(filters.copyWith(date: picked));
              }
            },
          ),
          AppSpacings.horizontal(8),
          _FilterChipButton(
            label: filters.role ?? 'Role',
            active: filters.role != null,
            onTap: () => _cycleRole(),
          ),
          ...ShiftType.values.map(
            (ShiftType type) => Padding(
              padding: EdgeInsets.only(left: 8.0.width),
              child: _FilterChipButton(
                label: type.apiValue,
                active: filters.typeOfShift == type.apiValue,
                onTap: () => onChanged(
                  filters.copyWith(
                    typeOfShift: filters.typeOfShift == type.apiValue
                        ? null
                        : type.apiValue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _cycleRole() {
    final List<String> roles = ProfileDefaults.roles;
    final int currentIndex = roles.indexOf(filters.role ?? '');
    final int nextIndex = currentIndex == -1 ? 0 : currentIndex + 1;
    onChanged(
      filters.copyWith(
        role: nextIndex >= roles.length ? null : roles[nextIndex],
      ),
    );
  }
}

class MarketplaceFilterSheet {
  const MarketplaceFilterSheet._();

  static Future<void> show({
    required BuildContext context,
    required ShiftFilters filters,
    required ValueChanged<ShiftFilters> onChanged,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18.0.radius)),
      ),
      builder: (BuildContext context) {
        return _MarketplaceFilterSheetContent(
          filters: filters,
          onChanged: (ShiftFilters value) {
            onChanged(value);
            AppRouter.back();
          },
        );
      },
    );
  }
}

class _MarketplaceFilterSheetContent extends StatelessWidget {
  const _MarketplaceFilterSheetContent({
    required this.filters,
    required this.onChanged,
  });

  final ShiftFilters filters;
  final ValueChanged<ShiftFilters> onChanged;

  @override
  Widget build(BuildContext context) {
    final bool hasActiveFilters =
        filters.role != null ||
        filters.date != null ||
        filters.typeOfShift != null;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          18.0.width,
          18.0.height,
          18.0.width,
          24.0.height,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Filters',
                    style: context.text.titleLarge?.copyWith(
                      color: AppColors.textColor,
                      fontSize: 20.0.fontSize,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: hasActiveFilters
                      ? () => onChanged(
                          const ShiftFilters(sortOrder: ShiftSortOrder.desc),
                        )
                      : null,
                  child: Text(
                    'Clear filter',
                    style: context.text.bodyMedium?.copyWith(
                      color: hasActiveFilters
                          ? AppColors.primary
                          : AppColors.greyDark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            AppSpacings.vertical(18),
            _SheetLabel(text: 'Role'),
            DropdownButtonFormField<String>(
              value: filters.role,
              isExpanded: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.0.width,
                  vertical: 10.0.height,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0.radius),
                  borderSide: BorderSide(color: AppColors.cardBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0.radius),
                  borderSide: BorderSide(color: AppColors.cardBorder),
                ),
              ),
              hint: const Text('Select role'),
              items: <DropdownMenuItem<String>>[
                const DropdownMenuItem<String>(
                  value: null,
                  child: Text('All roles'),
                ),
                ...ProfileDefaults.roles.map(
                  (String role) =>
                      DropdownMenuItem<String>(value: role, child: Text(role)),
                ),
              ],
              onChanged: (String? role) {
                onChanged(filters.copyWith(role: role));
              },
            ),
            AppSpacings.vertical(18),
            _SheetLabel(text: 'Date'),
            _FilterChipButton(
              label: filters.date == null
                  ? 'Pick date'
                  : DateUtils.monthDay(filters.date!),
              active: filters.date != null,
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  initialDate: filters.date ?? DateTime.now(),
                );
                if (picked != null && context.mounted) {
                  onChanged(filters.copyWith(date: picked));
                }
              },
            ),
            AppSpacings.vertical(18),
            _SheetLabel(text: 'Shift type'),
            Wrap(
              spacing: 8.0.width,
              runSpacing: 8.0.height,
              children: ShiftType.values
                  .map(
                    (ShiftType type) => _FilterChipButton(
                      label: type.apiValue,
                      active: filters.typeOfShift == type.apiValue,
                      onTap: () => onChanged(
                        filters.copyWith(
                          typeOfShift: filters.typeOfShift == type.apiValue
                              ? null
                              : type.apiValue,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SheetLabel extends StatelessWidget {
  const _SheetLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0.height),
      child: Text(
        text,
        style: context.text.titleMedium?.copyWith(
          color: AppColors.textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class MarketplaceShiftCard extends StatelessWidget {
  const MarketplaceShiftCard({super.key, required this.shift});

  final Shift shift;

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
            children: <Widget>[
              const LocationMark(),
              AppSpacings.horizontal(10),
              Expanded(
                child: Text(
                  shift.location.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.text.titleLarge?.copyWith(
                    color: AppColors.textColor.withValues(alpha: .86),
                    fontSize: 16.0.fontSize,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              if (shift.typeOfShift.contains(ShiftType.evening))
                const _MarketplaceBadge(label: 'Urgent'),
              if (shift.typeOfShift.contains(ShiftType.weekend))
                const _MarketplaceBadge(label: 'Required cash handling'),
            ],
          ),
          AppSpacings.vertical(17),
          _MarketInfoRow(
            icon: Icons.schedule_outlined,
            text: DateUtils.shiftDateTime(shift.date, shift.startTime),
          ),
          AppSpacings.vertical(11),
          _MarketInfoRow(
            icon: Icons.person_outline,
            text: '${shift.numOfShiftsPerDay} Slot Left',
          ),
          AppSpacings.vertical(11),
          _MarketInfoRow(
            icon: CupertinoIcons.money_pound,
            text: _formatPay(shift.pay),
            iconSize: 28,
          ),
          AppSpacings.vertical(14),
          _ClaimButton(shift: shift),
        ],
      ),
    );
  }

  String _formatPay(num? pay) {
    if (pay == null) return 'N/A';
    return pay % 1 == 0 ? pay.toInt().toString() : pay.toStringAsFixed(2);
  }
}

class _ClaimButton extends StatelessWidget {
  const _ClaimButton({required this.shift});

  final Shift shift;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ShiftDecisionModal.show(
          context: context,
          action: ShiftDecisionAction.claim,
          onConfirmed: () {
            context.read<MarketplaceActionsCubit>().claimShift(shift.id);
          },
        );
      },
      child: Container(
        width: 98.0.width,
        height: 32.0.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20.0.radius),
        ),
        child: Text(
          'Claim Shift',
          style: context.text.titleMedium?.copyWith(
            color: AppColors.white,
            fontSize: 13.0.fontSize,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _FilterChipButton extends StatelessWidget {
  const _FilterChipButton({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.0.width),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(18.0.radius),
          border: Border.all(
            color: active ? AppColors.primary : AppColors.cardBorder,
          ),
        ),
        child: Text(
          label,
          style: context.text.bodyMedium?.copyWith(
            color: active ? AppColors.white : AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _MarketInfoRow extends StatelessWidget {
  const _MarketInfoRow({
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

class _MarketplaceBadge extends StatelessWidget {
  const _MarketplaceBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.width,
        vertical: 6.0.height,
      ),
      decoration: BoxDecoration(
        color: AppColors.ongoingChipBg,
        borderRadius: BorderRadius.circular(18.0.radius),
      ),
      child: Text(
        label,
        style: context.text.bodyMedium?.copyWith(
          color: AppColors.primary,
          fontSize: 12.0.fontSize,
        ),
      ),
    );
  }
}
