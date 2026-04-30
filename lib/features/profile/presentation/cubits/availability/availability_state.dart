part of 'availability_cubit.dart';

@freezed
class AvailabilityState with _$AvailabilityState {
  const factory AvailabilityState({
    @Default(ViewState.initial) ViewState viewState,
    required List<AvailabilityDay> weeklySchedule,
    @Default('') String errorMessage,
    DateTime? referenceWeekStart,
    @Default(false) bool saveSucceeded,
  }) = _AvailabilityState;

  const AvailabilityState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isError => viewState == ViewState.error;
  DateTime get weekStart => referenceWeekStart ?? currentWeekStart();

  static DateTime currentWeekStart() {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    return today.subtract(Duration(days: today.weekday - DateTime.monday));
  }

  String get weekLabel {
    final DateTime end = weekStart.add(const Duration(days: 6));
    if (weekStart.year == end.year && weekStart.month == end.month) {
      return '${DateUtils.monthDay(weekStart)}-${end.day}, ${end.year}';
    }
    return '${DateUtils.monthDay(weekStart)}-${DateUtils.monthDay(end)}, ${end.year}';
  }

  AvailabilityState toLoading() => copyWith(
    viewState: ViewState.loading,
    errorMessage: '',
    saveSucceeded: false,
  );

  AvailabilityState toLoaded({bool saveSucceeded = false}) =>
      copyWith(viewState: ViewState.loaded, saveSucceeded: saveSucceeded);

  AvailabilityState toError(String message) => copyWith(
    viewState: ViewState.error,
    errorMessage: message,
    saveSucceeded: false,
  );
}
