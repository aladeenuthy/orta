part of 'unavailability_cubit.dart';

@freezed
class UnavailabilityState with _$UnavailabilityState {
  const factory UnavailabilityState({
    @Default(ViewState.initial) ViewState viewState,
    @Default(<UnavailabilityPeriod>[]) List<UnavailabilityPeriod> items,
    String? errorMessage,
  }) = _UnavailabilityState;

  const UnavailabilityState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isError => viewState == ViewState.error;

  UnavailabilityState toLoading() =>
      copyWith(viewState: ViewState.loading, errorMessage: null);

  UnavailabilityState toLoaded(List<UnavailabilityPeriod> items) =>
      copyWith(viewState: ViewState.loaded, items: items, errorMessage: null);

  UnavailabilityState toError(String message) =>
      copyWith(viewState: ViewState.error, errorMessage: message);
}
