part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(ViewState.initial) ViewState viewState,
    String? errorMessage,
  }) = _RegisterState;

  const RegisterState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isError => viewState == ViewState.error;
  bool get isInitial => viewState == ViewState.initial;

  RegisterState toLoading() =>
      copyWith(viewState: ViewState.loading, errorMessage: null);

  RegisterState toError(String message) =>
      copyWith(viewState: ViewState.error, errorMessage: message);

  RegisterState resetError() =>
      copyWith(viewState: ViewState.initial, errorMessage: null);

  RegisterState toLoaded() =>
      copyWith(viewState: ViewState.loaded, errorMessage: null);
}
