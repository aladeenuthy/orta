import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String id,
    required String name,
    required String email,
    String? phone,
    String? city,
    String? jobRole,
    @Default(<String>[]) List<String> skills,
    String? profilePictureUrl,
    @Default(false) bool isProfileComplete,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
