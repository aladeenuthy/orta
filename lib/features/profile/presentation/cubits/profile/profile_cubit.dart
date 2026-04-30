import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required ProfileService profileService})
    : _profileService = profileService,
      super(const ProfileState());

  final ProfileService _profileService;

  Future<void> loadProfile() async {
    emit(state.toLoading());
    final Either<AppError, Profile> result = await _profileService.getProfile();

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (Profile profile) => emit(state.toLoaded(profile)),
    );
  }
}
