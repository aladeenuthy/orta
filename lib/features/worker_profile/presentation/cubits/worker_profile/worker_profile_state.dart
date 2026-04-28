part of 'worker_profile_cubit.dart';

@freezed
class WorkerProfileState with _$WorkerProfileState {
  const factory WorkerProfileState({
    @Default(ViewState.initial) ViewState viewState,
    WorkerProfile? profile,
    String? errorMessage,
  }) = _WorkerProfileState;

  const WorkerProfileState._();

  bool get isInitial => viewState == ViewState.initial;
  bool get isLoading => viewState == ViewState.loading;
  bool get isError => viewState == ViewState.error;

  WorkerProfileState toLoading() =>
      copyWith(viewState: ViewState.loading, errorMessage: null);

  WorkerProfileState toLoaded(WorkerProfile profile) => copyWith(
    viewState: ViewState.loaded,
    profile: profile,
    errorMessage: null,
  );

  WorkerProfileState toError(String message) =>
      copyWith(viewState: ViewState.error, errorMessage: message);
}
