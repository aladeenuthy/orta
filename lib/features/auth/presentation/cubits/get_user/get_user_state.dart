part of 'get_user_cubit.dart';

@freezed
class GetUserState with _$GetUserState {
  const factory GetUserState({
    @Default(ViewState.initial) ViewState viewState,
    User? user,
    String? errorMessage,
  }) = _GetUserState;

  const GetUserState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isError => viewState == ViewState.error;
  bool get isInitial => viewState == ViewState.initial;
  bool get hasUser => user != null;

  GetUserState toLoading() =>
      copyWith(viewState: ViewState.loading, errorMessage: null);

  GetUserState toError(String message) =>
      copyWith(viewState: ViewState.error, errorMessage: message);

  GetUserState resetError() =>
      copyWith(viewState: ViewState.initial, errorMessage: null);

  GetUserState toLoaded(User user) =>
      copyWith(viewState: ViewState.loaded, user: user, errorMessage: null);
}
