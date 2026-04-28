// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvailabilityDayImpl _$$AvailabilityDayImplFromJson(
  Map<String, dynamic> json,
) => _$AvailabilityDayImpl(
  day: json['day'] as String,
  isAvailable: json['isAvailable'] as bool? ?? false,
  startTime: json['startTime'] as String? ?? '08:00',
  endTime: json['endTime'] as String? ?? '21:00',
);

Map<String, dynamic> _$$AvailabilityDayImplToJson(
  _$AvailabilityDayImpl instance,
) => <String, dynamic>{
  'day': instance.day,
  'isAvailable': instance.isAvailable,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
};
