part of 'forgot_password_cubit.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(ViewState.initial) ViewState viewState,
    String? errorMessage,
  }) = _ForgotPasswordState;

  const ForgotPasswordState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isError => viewState == ViewState.error;
  bool get isInitial => viewState == ViewState.initial;

  ForgotPasswordState toLoading() =>
      copyWith(viewState: ViewState.loading, errorMessage: null);

  ForgotPasswordState toError(String message) =>
      copyWith(viewState: ViewState.error, errorMessage: message);

  ForgotPasswordState resetError() =>
      copyWith(viewState: ViewState.initial, errorMessage: null);

  ForgotPasswordState toLoaded() =>
      copyWith(viewState: ViewState.loaded, errorMessage: null);
}
