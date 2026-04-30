part of 'shift_action_eligibility_cubit.dart';

@freezed
class ShiftActionEligibilityState with _$ShiftActionEligibilityState {
  const factory ShiftActionEligibilityState({
    @Default(ViewState.initial) ViewState viewState,
    ShiftActionEligibility? eligibility,
  }) = _ShiftActionEligibilityState;

  const ShiftActionEligibilityState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isInitial => viewState == ViewState.initial;

  ShiftActionEligibilityState toLoading() =>
      copyWith(viewState: ViewState.loading, eligibility: null);

  ShiftActionEligibilityState toLoaded(ShiftActionEligibility eligibility) =>
      copyWith(viewState: ViewState.loaded, eligibility: eligibility);
}
