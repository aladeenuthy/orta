part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(ViewState.initial) ViewState viewState,
    Profile? profile,
    String? errorMessage,
  }) = _ProfileState;

  const ProfileState._();

  bool get isInitial => viewState == ViewState.initial;
  bool get isLoading => viewState == ViewState.loading;
  bool get isError => viewState == ViewState.error;

  ProfileState toLoading() =>
      copyWith(viewState: ViewState.loading, errorMessage: null);

  ProfileState toLoaded(Profile profile) => copyWith(
    viewState: ViewState.loaded,
    profile: profile,
    errorMessage: null,
  );

  ProfileState toError(String message) =>
      copyWith(viewState: ViewState.error, errorMessage: message);
}
