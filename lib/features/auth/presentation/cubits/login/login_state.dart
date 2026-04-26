part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(ViewState.initial) ViewState viewState,
    AuthSession? session,
    String? errorMessage,
  }) = _LoginState;

  const LoginState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isError => viewState == ViewState.error;
  bool get isInitial => viewState == ViewState.initial;
  bool get hasSession => session != null;

  LoginState toLoading() =>
      copyWith(viewState: ViewState.loading, errorMessage: null);

  LoginState toError(String message) =>
      copyWith(viewState: ViewState.error, errorMessage: message);

  LoginState resetError() =>
      copyWith(viewState: ViewState.initial, errorMessage: null);

  LoginState toLoaded(AuthSession session) => copyWith(
    viewState: ViewState.loaded,
    session: session,
    errorMessage: null,
  );
}
