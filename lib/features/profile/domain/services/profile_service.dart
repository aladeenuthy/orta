import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class ProfileService {
  ProfileService({required ProfileRepository repository})
    : _repository = repository;

  final ProfileRepository _repository;

  Future<Either<AppError, Profile>> getProfile() {
    return _repository.getProfile();
  }

  Either<AppError, Unit> validatePersonalInformation({
    required String phone,
    required String city,
    required String jobRole,
  }) {
    if (phone.trim().isEmpty || city.isEmpty || jobRole.isEmpty) {
      return left(const AppError('Complete all fields'));
    }

    return right(unit);
  }

  Future<Either<AppError, Profile>> saveProfile({
    String? name,
    required String phone,
    required String city,
    required String jobRole,
    required List<String> skills,
    String? profilePictureUrl,
  }) {
    final Either<AppError, Unit> personalValidation =
        validatePersonalInformation(phone: phone, city: city, jobRole: jobRole);

    final AppError? validationError = personalValidation.fold(
      (AppError error) => error,
      (_) => null,
    );
    if (validationError != null) {
      return Future.value(left(validationError));
    }

    if (skills.isEmpty) {
      return Future.value(left(const AppError('Add at least one skill')));
    }

    return _repository.updateProfile(
      phone: phone.trim(),
      name: name?.trim(),
      city: city,
      jobRole: jobRole,
      skills: skills,
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
