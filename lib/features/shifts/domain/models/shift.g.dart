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
  user: _userNameFromJson(json['user']),
  startTime: _dateTimeFromJson(json['startTime']),
  finishTime: _dateTimeFromJson(json['finishTime']),
  numOfShiftsPerDay: (json['numOfShiftsPerDay'] as num).toInt(),
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  status: const ShiftStatusConverter().fromJson(json['status'] as String?),
  clockInTime: _nullableDateTimeFromJson(json['clockInTime']),
  clockOutTime: _nullableDateTimeFromJson(json['clockOutTime']),
  date: _dateTimeFromJson(json['date']),
  createdAt: _nullableDateTimeFromJson(json['createdAt']),
  updatedAt: _nullableDateTimeFromJson(json['updatedAt']),
  pay: json['pay'] as num?,
);

Map<String, dynamic> _$$ShiftImplToJson(_$ShiftImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'role': instance.role,
      'typeOfShift': instance.typeOfShift,
      'user': _userToJson(instance.user),
      'startTime': _dateTimeToJson(instance.startTime),
      'finishTime': _dateTimeToJson(instance.finishTime),
      'numOfShiftsPerDay': instance.numOfShiftsPerDay,
      'location': instance.location.toJson(),
      'status': const ShiftStatusConverter().toJson(instance.status),
      'clockInTime': _nullableDateTimeToJson(instance.clockInTime),
      'clockOutTime': _nullableDateTimeToJson(instance.clockOutTime),
      'date': _dateTimeToJson(instance.date),
      'createdAt': _nullableDateTimeToJson(instance.createdAt),
      'updatedAt': _nullableDateTimeToJson(instance.updatedAt),
      'pay': instance.pay,
    };
