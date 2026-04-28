part of 'profile_onboarding_cubit.dart';

@freezed
class ProfileOnboardingState with _$ProfileOnboardingState {
  const factory ProfileOnboardingState({
    @Default(ViewState.initial) ViewState viewState,
    @Default('') String phone,
    @Default('') String city,
    @Default('') String jobRole,
    @Default('') String skillInput,
    @Default(<String>[]) List<String> skills,
    WorkerProfile? profile,
    @Default(ProfileOnboardingStep.personal) ProfileOnboardingStep savedStep,
    String? errorMessage,
  }) = _ProfileOnboardingState;

  const ProfileOnboardingState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isError => viewState == ViewState.error;
  bool get canAddSkill => skillInput.trim().isNotEmpty;

  ProfileOnboardingState toEditing() =>
      copyWith(viewState: ViewState.initial, errorMessage: null);

  ProfileOnboardingState toLoading() =>
      copyWith(viewState: ViewState.loading, errorMessage: null);

  ProfileOnboardingState toError(String message) =>
      copyWith(viewState: ViewState.error, errorMessage: message);

  ProfileOnboardingState toPersonalSaved(WorkerProfile profile) => copyWith(
    viewState: ViewState.loaded,
    profile: profile,
    savedStep: ProfileOnboardingStep.personal,
    errorMessage: null,
  );

  ProfileOnboardingState toSkillsSaved(WorkerProfile profile) => copyWith(
    viewState: ViewState.loaded,
    profile: profile,
    savedStep: ProfileOnboardingStep.skills,
    errorMessage: null,
  );
}

enum ProfileOnboardingStep { personal, skills }
