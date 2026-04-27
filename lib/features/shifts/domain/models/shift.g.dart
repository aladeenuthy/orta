// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShiftImpl _$$ShiftImplFromJson(Map<String, dynamic> json) => _$ShiftImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  role: json['role'] as String,
  typeOfShift: (json['typeOfShift'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  user: json['user'] as String,
  startTime: DateTime.parse(json['startTime'] as String),
  finishTime: DateTime.parse(json['finishTime'] as String),
  numOfShiftsPerDay: (json['numOfShiftsPerDay'] as num).toInt(),
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  status: const ShiftStatusConverter().fromJson(json['status'] as String?),
  clockInTime: json['clockInTime'] == null
      ? null
      : DateTime.parse(json['clockInTime'] as String),
  clockOutTime: json['clockOutTime'] == null
      ? null
      : DateTime.parse(json['clockOutTime'] as String),
  date: DateTime.parse(json['date'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  pay: json['pay'] as num?,
);

Map<String, dynamic> _$$ShiftImplToJson(_$ShiftImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'role': instance.role,
      'typeOfShift': instance.typeOfShift,
      'user': instance.user,
      'startTime': instance.startTime.toIso8601String(),
      'finishTime': instance.finishTime.toIso8601String(),
      'numOfShiftsPerDay': instance.numOfShiftsPerDay,
      'location': instance.location.toJson(),
      'status': const ShiftStatusConverter().toJson(instance.status),
      'clockInTime': instance.clockInTime?.toIso8601String(),
      'clockOutTime': instance.clockOutTime?.toIso8601String(),
      'date': instance.date.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'pay': instance.pay,
    };
