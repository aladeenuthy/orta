part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(ViewState.initial) ViewState viewState,
    AuthSession? session,
    String? errorMessage,
  }) = _AuthState;

  const AuthState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isError => viewState == ViewState.error;
  bool get isInitial => viewState == ViewState.initial;

  bool get isAuthenticated => isLoaded && session != null;
  bool get isUnauthenticated => isLoaded && session == null;
  bool get requiresEmailVerification =>
      isAuthenticated && !(session?.user.isEmailVerified ?? false);
  bool get requiresProfileSetup =>
      isAuthenticated &&
      (session?.user.isEmailVerified ?? false) &&
      !(session?.user.isProfileComplete ?? false);

  User? get user => session?.user;
  String? get token => session?.token;

  AuthState toLoading() =>
      copyWith(viewState: ViewState.loading, errorMessage: null);

  AuthState toError(String message) =>
      copyWith(viewState: ViewState.error, errorMessage: message);

  AuthState resetError() =>
      copyWith(viewState: ViewState.initial, errorMessage: null);

  AuthState toAuthenticated(AuthSession session) => copyWith(
    viewState: ViewState.loaded,
    session: session,
    errorMessage: null,
  );

  AuthState toUnauthenticated() =>
      copyWith(viewState: ViewState.loaded, session: null, errorMessage: null);
}
