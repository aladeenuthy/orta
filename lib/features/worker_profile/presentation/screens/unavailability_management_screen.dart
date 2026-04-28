import 'package:orta/features/features.dart';

class UnavailabilityManagementScreen extends StatefulWidget {
  const UnavailabilityManagementScreen({super.key});

  @override
  State<UnavailabilityManagementScreen> createState() =>
      _UnavailabilityManagementScreenState();
}

class _UnavailabilityManagementScreenState
    extends State<UnavailabilityManagementScreen> {
  DateTime _visibleMonth = DateTime(DateTime.now().year, DateTime.now().month);
  static const int _selectionLimit = 3;
  final List<DateTime> _selectedDates = <DateTime>[];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UnavailabilityCubit>(
      create: (_) => locator<UnavailabilityCubit>()..load(),
      child: BlocConsumer<UnavailabilityCubit, UnavailabilityState>(
        listener: (BuildContext context, UnavailabilityState state) {
          if (state.isError && state.errorMessage != null) {
            AppSnacks.error(context, state.errorMessage!);
          }
        },
        builder: (BuildContext context, UnavailabilityState state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: const _UnavailabilityAppBar(),
            bottomNavigationBar: SafeArea(
              minimum: EdgeInsets.fromLTRB(
                16.0.width,
                10.0.height,
                16.0.width,
                24.0.height,
              ),
              child: AppButton(
                color: AppColors.primary,
                enabled: _selectedDates.isNotEmpty,
                height: 42,
                borderRadius: BorderRadius.circular(8.0.radius),
                margin: EdgeInsets.zero,
                onPressed: () => _save(context),
                child: Text(
                  'Save',
                  style: context.text.titleMedium?.copyWith(
                    color: AppColors.white,
                    fontSize: 18.0.fontSize,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            body: AppLoadingOverlay(
              loading: state.isLoading,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: AppPaddings.horizontal(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppSpacings.vertical(30),
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
                        visibleMonth: _visibleMonth,
                        selectedDates: _selectedDates,
                        onPreviousMonth: () => setState(() {
                          _visibleMonth = DateTime(
                            _visibleMonth.year,
                            _visibleMonth.month - 1,
                          );
                        }),
                        onNextMonth: () => setState(() {
                          _visibleMonth = DateTime(
                            _visibleMonth.year,
                            _visibleMonth.month + 1,
                          );
                        }),
                        onSelected: (DateTime date) => _toggleDate(date),
                      ),
                      AppSpacings.vertical(24),
                      Divider(color: AppColors.cardBorder),
                      AppSpacings.vertical(24),
                      Text(
                        'Selected',
                        style: context.text.titleLarge?.copyWith(
                          color: AppColors.textColor,
                          fontSize: 20.0.fontSize,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      AppSpacings.vertical(18),
                      Text(
                        _selectedDates.isEmpty
                            ? 'No date selected'
                            : _selectedDates
                                  .map(
                                    (DateTime date) =>
                                        '•  ${DateUtils.monthDay(date)}',
                                  )
                                  .join('\n'),
                        style: context.text.bodyLarge?.copyWith(
                          color: AppColors.textColor,
                          fontSize: 18.0.fontSize,
                          height: 1.55,
                        ),
                      ),
                      AppSpacings.vertical(42),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _toggleDate(DateTime date) {
    final DateTime normalizedDate = _normalizeDate(date);
    final int existingIndex = _selectedDates.indexWhere(
      (DateTime item) =>
          DateUtils.dateOnly(item) == DateUtils.dateOnly(normalizedDate),
    );

    if (existingIndex != -1) {
      setState(() => _selectedDates.removeAt(existingIndex));
      return;
    }

    if (_selectedDates.length >= _selectionLimit) {
      AppSnacks.error(context, 'You can select up to 3 days');
      return;
    }

    setState(() {
      _selectedDates.add(normalizedDate);
      _selectedDates.sort();
    });
  }

  void _save(BuildContext context) {
    if (_selectedDates.isEmpty) return;

    context.read<UnavailabilityCubit>().addDates(
      dates: _selectedDates,
      reason: 'Unavailable',
    );
    AppSnacks.success(context, 'Unavailable dates saved');
  }

  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
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
        'Add Unavailability',
        style: context.text.headlineMedium?.copyWith(
          color: AppColors.white,
          fontSize: 20.0.fontSize,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
