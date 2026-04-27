part of 'shift_detail_cubit.dart';

@freezed
class ShiftDetailState with _$ShiftDetailState {
  const factory ShiftDetailState({
    @Default(ViewState.initial) ViewState viewState,
    Shift? shift,
    String? errorMessage,
  }) = _ShiftDetailState;

  const ShiftDetailState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isError => viewState == ViewState.error;
  bool get isInitial => viewState == ViewState.initial;
  bool get hasShift => shift != null;

  ShiftDetailState toLoading() =>
      copyWith(viewState: ViewState.loading, errorMessage: null);

  ShiftDetailState toError(String message) =>
      copyWith(viewState: ViewState.error, errorMessage: message);

  ShiftDetailState resetError() =>
      copyWith(viewState: ViewState.initial, errorMessage: null);

  ShiftDetailState toLoaded(Shift shift) =>
      copyWith(viewState: ViewState.loaded, shift: shift, errorMessage: null);
}
