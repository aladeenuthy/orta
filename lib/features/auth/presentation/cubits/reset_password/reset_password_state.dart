part of 'reset_password_cubit.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default(ViewState.initial) ViewState viewState,
    String? errorMessage,
  }) = _ResetPasswordState;

  const ResetPasswordState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isError => viewState == ViewState.error;
  bool get isInitial => viewState == ViewState.initial;

  ResetPasswordState toLoading() =>
      copyWith(viewState: ViewState.loading, errorMessage: null);

  ResetPasswordState toError(String message) =>
      copyWith(viewState: ViewState.error, errorMessage: message);

  ResetPasswordState resetError() =>
      copyWith(viewState: ViewState.initial, errorMessage: null);

  ResetPasswordState toLoaded() =>
      copyWith(viewState: ViewState.loaded, errorMessage: null);
}
