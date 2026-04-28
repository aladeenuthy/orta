// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unavailability_period.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnavailabilityPeriodImpl _$$UnavailabilityPeriodImplFromJson(
  Map<String, dynamic> json,
) => _$UnavailabilityPeriodImpl(
  id: json['id'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$$UnavailabilityPeriodImplToJson(
  _$UnavailabilityPeriodImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate.toIso8601String(),
  'reason': instance.reason,
};
