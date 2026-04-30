import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'profile_onboarding_cubit.freezed.dart';
part 'profile_onboarding_state.dart';

class ProfileOnboardingCubit extends Cubit<ProfileOnboardingState> {
  ProfileOnboardingCubit({
    required ProfileService profileService,
    required AuthService authService,
  }) : _profileService = profileService,
       _authService = authService,
       super(const ProfileOnboardingState());

  final ProfileService _profileService;
  final AuthService _authService;

  void initializeForEdit(Profile profile) {
    emit(
      state.toEditing().copyWith(
        firstName: _firstName(profile.name),
        lastName: _lastName(profile.name),
        phone: _displayPhone(profile.phone),
        city: profile.city ?? '',
        jobRole: profile.jobRole ?? '',
        skills: profile.skills,
        profilePicturePath: profile.profilePictureUrl ?? '',
        profile: profile,
        skillInput: '',
      ),
    );
  }

  void firstNameChanged(String firstName) =>
      emit(state.toEditing().copyWith(firstName: firstName));
  void lastNameChanged(String lastName) =>
      emit(state.toEditing().copyWith(lastName: lastName));
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

  void completePersonalInformation() {
    if (state.isLoading) return;
    final Either<AppError, Unit> result = _profileService
        .validatePersonalInformation(
          phone: state.normalizedPhone,
          city: state.city,
          jobRole: state.jobRole,
        );

    result.fold((AppError error) => emit(state.toError(error.message)), (_) {
      emit(state.toPersonalCompleted());
    });
  }

  Future<void> savePersonalInformationEdit() async {
    if (state.isLoading) return;
    emit(state.toLoading());
    final Either<AppError, Profile> result = await _profileService.saveProfile(
      name: state.fullName.isEmpty ? state.profile?.name : state.fullName,
      phone: state.normalizedPhone,
      city: state.city,
      jobRole: state.jobRole,
      skills: state.skills,
    );

    await result.fold(
      (AppError error) async => emit(state.toError(error.message)),
      (Profile profile) async {
        if (!await _syncAuthProfile(profile)) return;
        emit(state.toPersonalSaved(profile));
      },
    );
  }

  Future<void> saveSkills() async {
    if (state.isLoading) return;
    emit(state.toLoading());
    final Either<AppError, Profile> result = await _profileService.saveProfile(
      name: state.fullName.isEmpty ? state.profile?.name : state.fullName,
      phone: state.normalizedPhone,
      city: state.city,
      jobRole: state.jobRole,
      skills: state.skills,
    );

    await result.fold(
      (AppError error) async => emit(state.toError(error.message)),
      (Profile profile) async {
        if (!await _syncAuthProfile(profile)) return;
        emit(state.toSkillsSaved(profile));
      },
    );
  }

  Future<bool> _syncAuthProfile(Profile profile) async {
    final Either<AppError, AuthSession> result = await _authService
        .updateCachedUserFromProfile(profile);

    return result.fold((AppError error) {
      emit(state.toError(error.message));
      return false;
    }, (_) => true);
  }

  static String _displayPhone(String? phone) {
    final String value = phone ?? '';
    if (value.startsWith('+44')) return value.substring(3);
    return value;
  }

  static String _firstName(String name) {
    final List<String> parts = name.trim().split(RegExp(r'\s+'));
    return parts.isEmpty ? '' : parts.first;
  }

  static String _lastName(String name) {
    final List<String> parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length < 2) return '';
    return parts.skip(1).join(' ');
  }
  void reset (){
    emit(const ProfileOnboardingState());
  }
}
