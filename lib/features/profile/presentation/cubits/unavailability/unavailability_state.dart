part of 'unavailability_cubit.dart';

@freezed
class UnavailabilityState with _$UnavailabilityState {
  const factory UnavailabilityState({
    @Default(ViewState.initial) ViewState viewState,
    @Default(<UnavailabilityPeriod>[]) List<UnavailabilityPeriod> items,
    String? errorMessage,
    DateTime? visibleMonth,
  }) = _UnavailabilityState;

  const UnavailabilityState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isError => viewState == ViewState.error;

  UnavailabilityState toLoading() =>
      copyWith(viewState: ViewState.loading, errorMessage: null);

  UnavailabilityState toLoaded(
    List<UnavailabilityPeriod> items, {
    DateTime? visibleMonth,
  }) => copyWith(
    viewState: ViewState.loaded,
    items: items,
    visibleMonth: visibleMonth ?? this.visibleMonth,
    errorMessage: null,
  );

  UnavailabilityState toError(String message) =>
      copyWith(viewState: ViewState.error, errorMessage: message);
}
