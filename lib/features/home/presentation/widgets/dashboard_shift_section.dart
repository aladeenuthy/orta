import 'package:orta/features/features.dart';

class DashboardShiftSection extends StatefulWidget {
  const DashboardShiftSection({
    super.key,
    required this.title,
    required this.filters,
    required this.showOngoingChip,
    required this.showActions,
  });

  final String title;
  final ShiftFilters filters;
  final bool showOngoingChip;
  final bool showActions;

  @override
  DashboardShiftSectionState createState() => DashboardShiftSectionState();
}

class DashboardShiftSectionState extends State<DashboardShiftSection> {
  late final PaginatedShiftsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = locator<PaginatedShiftsBloc>(param1: widget.filters, param2: 3)
      ..fetchInitial();
  }

  Future<void> refresh() async {
    await _bloc.refresh();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaginatedShiftsBloc>.value(
      value: _bloc,
      child: Builder(
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      widget.title,
                      style: context.text.headlineMedium?.copyWith(
                        color: AppColors.textColor,
                        fontSize: 18.0.fontSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => AppRouter.toNamed(
                      AppRoutes.shiftList,
                      arguments: ShiftListArgs(
                        title: widget.title,
                        filters: widget.filters,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'See all',
                      style: context.text.bodyLarge?.copyWith(
                        color: AppColors.greyDark,
                        fontSize: 15.0.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              AppSpacings.vertical(20),
              BlocBuilder<PaginatedShiftsBloc, GetItemsState<Shift>>(
                builder: (BuildContext context, GetItemsState<Shift> state) {
                  return AppLoadingOverlay(
                    loading: _isInitialLoading(state),
                    child: _buildSectionContent(context, state),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionContent(
    BuildContext context,
    GetItemsState<Shift> state,
  ) {
    final List<Shift> shifts = state.response?.data ?? <Shift>[];

    if (_isInitialLoading(state)) {
      return SizedBox(height: 130.0.height, width: double.infinity);
    }

    if (state.hasFailure) {
      return AppRetryWidget(
        onRetry: context.read<PaginatedShiftsBloc>().fetchInitial,
        errorMessage: state.failure?.message ?? 'Unable to load shifts',
      );
    }

    if (state is GetItemsSuccess<Shift> && shifts.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(bottom: 20.0.height),
        child: Text(
          'No shifts found',
          style: context.text.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      );
    }

    return Column(
      children: shifts
          .map(
            (Shift shift) => ShiftCard(
              shift: shift,
              showOngoingChip: widget.showOngoingChip,
              showActions: widget.showActions,
            ),
          )
          .toList(),
    );
  }

  bool _isInitialLoading(GetItemsState<Shift> state) {
    return state.isInitial ||
        (state is GetItemsLoading<Shift> &&
            (state.response?.data.isEmpty ?? true));
  }
}
