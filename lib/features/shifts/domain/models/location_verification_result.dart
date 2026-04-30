import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_verification_result.freezed.dart';
part 'location_verification_result.g.dart';

@freezed
class LocationVerificationResult with _$LocationVerificationResult {
  const factory LocationVerificationResult({
    required bool withinRange,
    required num distanceMeters,
    required num radiusMeters,
  }) = _LocationVerificationResult;

  factory LocationVerificationResult.fromJson(Map<String, dynamic> json) =>
      _$LocationVerificationResultFromJson(json);
}
