// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_verification_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationVerificationResultImpl _$$LocationVerificationResultImplFromJson(
  Map<String, dynamic> json,
) => _$LocationVerificationResultImpl(
  withinRange: json['withinRange'] as bool,
  distanceMeters: json['distanceMeters'] as num,
  radiusMeters: json['radiusMeters'] as num,
);

Map<String, dynamic> _$$LocationVerificationResultImplToJson(
  _$LocationVerificationResultImpl instance,
) => <String, dynamic>{
  'withinRange': instance.withinRange,
  'distanceMeters': instance.distanceMeters,
  'radiusMeters': instance.radiusMeters,
};
