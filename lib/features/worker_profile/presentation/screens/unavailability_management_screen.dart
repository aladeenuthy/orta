import 'package:orta/features/features.dart';

class UnavailabilityManagementScreen extends StatelessWidget {
  const UnavailabilityManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UnavailabilityCubit>(
      create: (_) => locator<UnavailabilityCubit>()..load(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const OnboardingAppBar(title: 'Unavailability'),
        body: BlocConsumer<UnavailabilityCubit, UnavailabilityState>(
          listener: (BuildContext context, UnavailabilityState state) {
            if (state.isError && state.errorMessage != null) {
              AppSnacks.error(context, state.errorMessage!);
            }
          },
          builder: (BuildContext context, UnavailabilityState state) {
            return AppLoadingOverlay(
              loading: state.isLoading,
              child: Padding(
                padding: AppPaddings.horizontal(16),
                child: Column(
                  children: <Widget>[
                    AppSpacings.vertical(24),
                    AppButton(
                      color: AppColors.primary,
                      height: 42,
                      borderRadius: BorderRadius.circular(8.0.radius),
                      margin: EdgeInsets.zero,
                      onPressed: () => _addDemoDate(context),
                      child: const Text('Add demo unavailable date'),
                    ),
                    AppSpacings.vertical(20),
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.items.length,
                        separatorBuilder: (_, _) => AppSpacings.vertical(12),
                        itemBuilder: (BuildContext context, int index) {
                          final UnavailabilityPeriod item = state.items[index];
                          return ListTile(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColors.cardBorder),
                              borderRadius: BorderRadius.circular(8.0.radius),
                            ),
                            title: Text(
                              '${DateUtils.dateOnly(item.startDate)} - ${DateUtils.dateOnly(item.endDate)}',
                            ),
                            subtitle: Text(item.reason ?? 'Unavailable'),
                            trailing: IconButton(
                              onPressed: () => context
                                  .read<UnavailabilityCubit>()
                                  .remove(item.id),
                              icon: Icon(
                                Icons.delete_outline,
                                color: AppColors.alert,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _addDemoDate(BuildContext context) {
    final DateTime start = DateTime.now().add(const Duration(days: 7));
    context.read<UnavailabilityCubit>().add(
      startDate: start,
      endDate: start.add(const Duration(days: 2)),
      reason: 'Personal',
    );
  }
}
