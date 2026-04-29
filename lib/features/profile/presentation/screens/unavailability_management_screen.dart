import 'package:orta/features/features.dart';

class UnavailabilityManagementArgs {
  const UnavailabilityManagementArgs({required this.cubit});

  final UnavailabilityCubit cubit;
}

class UnavailabilityManagementScreen extends StatelessWidget {
  const UnavailabilityManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UnavailabilityView();
  }
}

class _UnavailabilityView extends StatelessWidget {
  const _UnavailabilityView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UnavailabilityCubit, UnavailabilityState>(
      listener: (BuildContext context, UnavailabilityState state) {
        if (state.isError && state.errorMessage != null) {
          AppSnacks.error(context, state.errorMessage!);
        }
      },
      builder: (BuildContext context, UnavailabilityState state) {
        final DateTime visibleMonth =
            state.visibleMonth ??
            DateTime(DateTime.now().year, DateTime.now().month);

        return AppLoadingOverlay(
          loading: state.isLoading,
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: const _UnavailabilityAppBar(),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  16.0.width,
                  30.0.height,
                  16.0.width,
                  34.0.height,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Select dates you are unavailable',
                      style: context.text.titleLarge?.copyWith(
                        color: AppColors.textColor.withValues(alpha: .82),
                        fontSize: 17.0.fontSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    AppSpacings.vertical(24),
                    UnavailabilityCalendarPicker(
                      visibleMonth: visibleMonth,
                      unavailablePeriods: state.items,
                      onPreviousMonth: () => _loadMonth(
                        context,
                        DateTime(visibleMonth.year, visibleMonth.month - 1),
                      ),
                      onNextMonth: () => _loadMonth(
                        context,
                        DateTime(visibleMonth.year, visibleMonth.month + 1),
                      ),
                    ),
                    AppSpacings.vertical(24),
                    AppButton(
                      color: AppColors.primary,
                      height: 42,
                      borderRadius: BorderRadius.circular(8.0.radius),
                      margin: EdgeInsets.zero,
                      onPressed: () =>
                          _showAddDialog(context, visibleMonth: visibleMonth),
                      child: Text(
                        'Add unavailability',
                        style: context.text.titleMedium?.copyWith(
                          color: AppColors.white,
                          fontSize: 16.0.fontSize,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    AppSpacings.vertical(26),
                    Divider(color: AppColors.cardBorder),
                    AppSpacings.vertical(18),
                    _UnavailabilityEntries(items: state.items),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _loadMonth(BuildContext context, DateTime month) {
    context.read<UnavailabilityCubit>().changeVisibleMonth(month);
  }

  Future<void> _showAddDialog(
    BuildContext context, {
    required DateTime visibleMonth,
  }) async {
    final UnavailabilityInput? input = await showDialog<UnavailabilityInput>(
      context: context,
      builder: (_) => _AddUnavailabilityDialog(visibleMonth: visibleMonth),
    );
    if (input == null || !context.mounted) return;

    final bool saved = await context.read<UnavailabilityCubit>().add(
      startDate: input.range.start,
      endDate: input.range.end,
      reason: input.reason,
    );
    if (saved && context.mounted) {
      AppSnacks.success(context, 'Unavailability saved');
    }
  }
}

class _UnavailabilityEntries extends StatelessWidget {
  const _UnavailabilityEntries({required this.items});

  final List<UnavailabilityPeriod> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Text(
        'No unavailable dates for this month',
        style: context.text.bodyLarge?.copyWith(
          color: AppColors.textSecondary,
          fontSize: 15.0.fontSize,
        ),
      );
    }

    return Column(
      children: items.map((UnavailabilityPeriod item) {
        return _UnavailabilityEntryTile(item: item);
      }).toList(),
    );
  }
}

class _UnavailabilityEntryTile extends StatelessWidget {
  const _UnavailabilityEntryTile({required this.item});

  final UnavailabilityPeriod item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0.height),
      padding: EdgeInsets.symmetric(
        horizontal: 14.0.width,
        vertical: 12.0.height,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(8.0.radius),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  DateUtils.dateRange(item.startDate, item.endDate),
                  style: context.text.titleMedium?.copyWith(
                    color: AppColors.textColor,
                    fontSize: 14.0.fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (item.reason != null && item.reason!.trim().isNotEmpty) ...[
                  AppSpacings.vertical(5),
                  Text(
                    item.reason!,
                    style: context.text.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 13.0.fontSize,
                    ),
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            onPressed: () => _delete(context),
            icon: Icon(
              Icons.delete_outline,
              color: AppColors.alert,
              size: 22.0.radius,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _delete(BuildContext context) async {
    final bool removed = await context.read<UnavailabilityCubit>().remove(
      item.id,
    );
    if (removed && context.mounted) {
      AppSnacks.success(context, 'Unavailability deleted');
    }
  }
}

class _AddUnavailabilityDialog extends StatefulWidget {
  const _AddUnavailabilityDialog({required this.visibleMonth});

  final DateTime visibleMonth;

  @override
  State<_AddUnavailabilityDialog> createState() =>
      _AddUnavailabilityDialogState();
}

class _AddUnavailabilityDialogState extends State<_AddUnavailabilityDialog> {
  final TextEditingController _reasonController = TextEditingController();
  DateTimeRange? _range;

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text(
        'Add unavailability',
        style: context.text.titleLarge?.copyWith(
          color: AppColors.textColor,
          fontSize: 18.0.fontSize,
          fontWeight: FontWeight.w800,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          OutlinedButton.icon(
            onPressed: _pickDateRange,
            icon: const Icon(Icons.date_range_outlined),
            label: Text(_rangeLabel),
          ),
          AppSpacings.vertical(16),
          AppTextField(
            controller: _reasonController,
            hintText: 'Reason (optional)',
            validate: (_) => null,
            hasTextfieldLabel: false,
            borderRadius: BorderRadius.circular(8.0.radius),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.0.width,
              vertical: 10.0.height,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _range == null ? null : _submit,
          child: const Text('Save'),
        ),
      ],
    );
  }

  String get _rangeLabel {
    final DateTimeRange? range = _range;
    if (range == null) return 'Select date range';
    return DateUtils.dateRange(range.start, range.end);
  }

  Future<void> _pickDateRange() async {
    final DateTime today = DateTime.now();
    final DateTime firstDate = DateTime(today.year, today.month, today.day);
    final DateTime requestedMonth = DateTime(
      widget.visibleMonth.year,
      widget.visibleMonth.month,
    );
    final DateTime initialDate = requestedMonth.isBefore(firstDate)
        ? firstDate
        : requestedMonth;
    final DateTimeRange? range = await showDateRangePicker(
      context: context,
      firstDate: firstDate,
      lastDate: DateTime(today.year + 3),
      initialDateRange: _range,
      currentDate: initialDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(
              context,
            ).colorScheme.copyWith(primary: AppColors.primary),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );

    if (range != null) {
      setState(() => _range = range);
    }
  }

  void _submit() {
    final DateTimeRange? range = _range;
    if (range == null) return;

    Navigator.of(context).pop(
      UnavailabilityInput(
        range: range,
        reason: _reasonController.text.trim().isEmpty
            ? null
            : _reasonController.text.trim(),
      ),
    );
  }
}

class UnavailabilityInput {
  const UnavailabilityInput({required this.range, this.reason});

  final DateTimeRange range;
  final String? reason;
}

class _UnavailabilityAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _UnavailabilityAppBar();

  @override
  Size get preferredSize => Size.fromHeight(70.0.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.orange,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 70.0.height,
      leading: Center(
        child: GestureDetector(
          onTap: AppRouter.back,
          child: Container(
            width: 42.0.width,
            height: 42.0.width,
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withValues(alpha: .95),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.textColor,
              size: 22.0.radius,
            ),
          ),
        ),
      ),
      title: Text(
        'Unavailability',
        style: context.text.headlineMedium?.copyWith(
          color: AppColors.white,
          fontSize: 20.0.fontSize,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
