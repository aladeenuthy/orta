import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class ProfileService {
  ProfileService({required ProfileRepository repository})
    : _repository = repository;

  final ProfileRepository _repository;

  Future<Either<AppError, Profile>> getProfile() {
    return _repository.getProfile();
  }

  Future<Either<AppError, Profile>> savePersonalInformation({
    required String phone,
    required String city,
    required String jobRole,
    String? profilePictureUrl,
  }) {
    if (phone.trim().isEmpty || city.isEmpty || jobRole.isEmpty) {
      return Future.value(left(const AppError('Complete all fields')));
    }

    return _repository.updateProfile(
      phone: phone.trim(),
      city: city,
      jobRole: jobRole,
      profilePictureUrl: profilePictureUrl,
    );
  }

  Future<Either<AppError, Profile>> saveSkills({required List<String> skills}) {
    if (skills.isEmpty) {
      return Future.value(left(const AppError('Add at least one skill')));
    }

    return _repository.updateProfile(skills: skills);
  }
}
