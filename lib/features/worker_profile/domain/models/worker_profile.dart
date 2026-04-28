import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker_profile.freezed.dart';
part 'worker_profile.g.dart';

@freezed
class WorkerProfile with _$WorkerProfile {
  const factory WorkerProfile({
    required String id,
    required String name,
    required String email,
    String? phone,
    String? city,
    String? jobRole,
    @Default(<String>[]) List<String> skills,
    String? profilePictureUrl,
    @Default(false) bool isProfileComplete,
  }) = _WorkerProfile;

  factory WorkerProfile.fromJson(Map<String, dynamic> json) =>
      _$WorkerProfileFromJson(json);
}
