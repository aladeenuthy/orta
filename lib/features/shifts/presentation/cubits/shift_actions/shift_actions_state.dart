part of 'shift_actions_cubit.dart';

@freezed
class ShiftActionsState with _$ShiftActionsState {
  const factory ShiftActionsState({
    @Default(ViewState.initial) ViewState viewState,
    ShiftAction? action,
    String? errorMessage,
  }) = _ShiftActionsState;

  const ShiftActionsState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isError => viewState == ViewState.error;
  bool get isInitial => viewState == ViewState.initial;

  ShiftActionsState toLoading(ShiftAction action) => copyWith(
    viewState: ViewState.loading,
    action: action,
    errorMessage: null,
  );

  ShiftActionsState toError(ShiftAction action, String message) => copyWith(
    viewState: ViewState.error,
    action: action,
    errorMessage: message,
  );

  ShiftActionsState toLoaded(ShiftAction action) =>
      copyWith(viewState: ViewState.loaded, action: action, errorMessage: null);

  ShiftActionsState resetError() =>
      copyWith(viewState: ViewState.initial, errorMessage: null);
}
