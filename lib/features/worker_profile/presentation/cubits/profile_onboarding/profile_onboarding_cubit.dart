import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'profile_onboarding_cubit.freezed.dart';
part 'profile_onboarding_state.dart';

class ProfileOnboardingCubit extends Cubit<ProfileOnboardingState> {
  ProfileOnboardingCubit({required WorkerProfileService workerProfileService})
    : _workerProfileService = workerProfileService,
      super(const ProfileOnboardingState());

  final WorkerProfileService _workerProfileService;

  void phoneChanged(String phone) =>
      emit(state.toEditing().copyWith(phone: phone));
  void cityChanged(String? city) =>
      emit(state.toEditing().copyWith(city: city ?? ''));
  void jobRoleChanged(String? jobRole) =>
      emit(state.toEditing().copyWith(jobRole: jobRole ?? ''));
  void profilePictureChanged(String path) =>
      emit(state.toEditing().copyWith(profilePicturePath: path));
  void skillChanged(String skill) =>
      emit(state.toEditing().copyWith(skillInput: skill));

  void addSkill() {
    final String skill = state.skillInput.trim();
    if (skill.isEmpty || state.skills.contains(skill)) return;
    emit(
      state.toEditing().copyWith(
        skills: <String>[...state.skills, skill],
        skillInput: '',
      ),
    );
  }

  void removeSkill(String skill) {
    emit(
      state.toEditing().copyWith(
        skills: state.skills.where((String item) => item != skill).toList(),
      ),
    );
  }

  Future<void> savePersonalInformation() async {
    if (state.isLoading) return;
    emit(state.toLoading());
    final Either<AppError, WorkerProfile> result = await _workerProfileService
        .savePersonalInformation(
          phone: '+44${state.phone.trim()}',
          city: state.city,
          jobRole: state.jobRole,
          profilePictureUrl: state.profilePicturePath.isEmpty
              ? null
              : state.profilePicturePath,
        );

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (WorkerProfile profile) => emit(state.toPersonalSaved(profile)),
    );
  }

  Future<void> saveSkills() async {
    if (state.isLoading) return;
    emit(state.toLoading());
    final Either<AppError, WorkerProfile> result = await _workerProfileService
        .saveSkills(skills: state.skills);

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (WorkerProfile profile) => emit(state.toSkillsSaved(profile)),
    );
  }
}
