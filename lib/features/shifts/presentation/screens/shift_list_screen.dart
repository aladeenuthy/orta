import 'package:orta/features/features.dart';

class ShiftListScreen extends StatelessWidget {
  const ShiftListScreen({super.key, required this.args});

  final ShiftListArgs args;

  @override
  Widget build(BuildContext context) {
    final bool isOngoing = args.filters.status == ShiftStatusFilter.inProgress;
    final bool isAssigned = args.filters.status == ShiftStatusFilter.scheduled;

    return BlocProvider<PaginatedShiftsBloc>(
      create: (_) =>
          locator<PaginatedShiftsBloc>(param1: args.filters, param2: 10)
            ..fetchInitial(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: AppRouter.back,
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.textColor,
              size: 20.0.radius,
            ),
          ),
          title: Text(
            args.title,
            style: context.text.titleLarge?.copyWith(
              color: AppColors.textColor,
              fontSize: 20.0.fontSize,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: BlocBuilder<PaginatedShiftsBloc, GetItemsState<Shift>>(
          builder: (BuildContext context, GetItemsState<Shift> state) {
            return AppLoadingOverlay(
              loading: _isInitialLoading(state),
              child: _ShiftListContent(
                state: state,
                isOngoing: isOngoing,
                isAssigned: isAssigned,
              ),
            );
          },
        ),
      ),
    );
  }
}

bool _isInitialLoading(GetItemsState<Shift> state) {
  return state.isInitial ||
      (state is GetItemsLoading<Shift> &&
          (state.response?.data.isEmpty ?? true));
}

class _ShiftListContent extends StatelessWidget {
  const _ShiftListContent({
    required this.state,
    required this.isOngoing,
    required this.isAssigned,
  });

  final GetItemsState<Shift> state;
  final bool isOngoing;
  final bool isAssigned;

  @override
  Widget build(BuildContext context) {
    final List<Shift> shifts = state.response?.data ?? <Shift>[];

    if (_isInitialLoading(state)) {
      return const SizedBox.shrink();
    }

    if (state.hasFailure && shifts.isEmpty) {
      return Padding(
        padding: AppPaddings.body,
        child: AppRetryWidget(
          onRetry: context.read<PaginatedShiftsBloc>().fetchInitial,
          errorMessage: state.failure?.message ?? 'Unable to load shifts',
        ),
      );
    }

    if (state is GetItemsSuccess<Shift> && shifts.isEmpty) {
      return Center(
        child: Text(
          'No shifts found',
          style: context.text.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      );
    }

    return ListInfiniteScrollView(
      itemCount: shifts.length,
      padding: EdgeInsets.fromLTRB(
        16.0.width,
        18.0.height,
        16.0.width,
        22.0.height,
      ),
      onRefresh: context.read<PaginatedShiftsBloc>().refresh,
      onLoadMore: context.read<PaginatedShiftsBloc>().loadMoreShifts,
      itemBuilder: (BuildContext context, int index) {
        final Shift shift = shifts[index];
        return ShiftCard(
          shift: shift,
          showOngoingChip: isOngoing,
          showActions: isAssigned,
        );
      },
    );
  }
}
