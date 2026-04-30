part of 'profile_onboarding_cubit.dart';

@freezed
class ProfileOnboardingState with _$ProfileOnboardingState {
  const factory ProfileOnboardingState({
    @Default(ViewState.initial) ViewState viewState,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String phone,
    @Default('') String city,
    @Default('') String jobRole,
    @Default('') String profilePicturePath,
    @Default('') String skillInput,
    @Default(<String>[]) List<String> skills,
    Profile? profile,
    @Default(ProfileOnboardingStep.personal) ProfileOnboardingStep savedStep,
    String? errorMessage,
  }) = _ProfileOnboardingState;

  const ProfileOnboardingState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isError => viewState == ViewState.error;
  bool get canAddSkill => skillInput.trim().isNotEmpty;
  String get normalizedPhone => '+44${phone.trim()}';
  String get fullName => <String>[
    firstName.trim(),
    lastName.trim(),
  ].where((String item) => item.isNotEmpty).join(' ');

  ProfileOnboardingState toEditing() =>
      copyWith(viewState: ViewState.initial, errorMessage: null);

  ProfileOnboardingState toLoading() =>
      copyWith(viewState: ViewState.loading, errorMessage: null);

  ProfileOnboardingState toError(String message) =>
      copyWith(viewState: ViewState.error, errorMessage: message);

  ProfileOnboardingState toPersonalCompleted() => copyWith(
    viewState: ViewState.loaded,
    savedStep: ProfileOnboardingStep.personal,
    errorMessage: null,
  );

  ProfileOnboardingState toPersonalSaved(Profile profile) => copyWith(
    viewState: ViewState.loaded,
    profile: profile,
    savedStep: ProfileOnboardingStep.personal,
    errorMessage: null,
  );

  ProfileOnboardingState toSkillsSaved(Profile profile) => copyWith(
    viewState: ViewState.loaded,
    profile: profile,
    savedStep: ProfileOnboardingStep.skills,
    errorMessage: null,
  );
}

enum ProfileOnboardingStep { personal, skills }
