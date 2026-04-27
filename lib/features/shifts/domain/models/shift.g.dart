// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShiftImpl _$$ShiftImplFromJson(Map<String, dynamic> json) => _$ShiftImpl(
  id: json['id'] as String?,
  title: json['title'] as String,
  role: json['role'] as String,
  typeOfShift: (json['typeOfShift'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  user: json['user'] as String,
  startTime: json['startTime'] as String,
  finishTime: json['finishTime'] as String,
  numOfShiftsPerDay: (json['numOfShiftsPerDay'] as num).toInt(),
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  date: DateTime.parse(json['date'] as String),
  status: json['status'] as String?,
  pay: json['pay'] as num?,
);

Map<String, dynamic> _$$ShiftImplToJson(_$ShiftImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'role': instance.role,
      'typeOfShift': instance.typeOfShift,
      'user': instance.user,
      'startTime': instance.startTime,
      'finishTime': instance.finishTime,
      'numOfShiftsPerDay': instance.numOfShiftsPerDay,
      'location': instance.location.toJson(),
      'date': instance.date.toIso8601String(),
      'status': instance.status,
      'pay': instance.pay,
    };
