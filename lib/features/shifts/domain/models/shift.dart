// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'shift.freezed.dart';
part 'shift.g.dart';

@freezed
class Shift with _$Shift {
  @JsonSerializable(explicitToJson: true)
  const factory Shift({
    required String id,
    required String title,
    required String role,
    required List<String> typeOfShift,
    @JsonKey(fromJson: _userNameFromJson, toJson: _userToJson)
    required String user,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    required DateTime startTime,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    required DateTime finishTime,
    required int numOfShiftsPerDay,
    required Location location,
    @ShiftStatusConverter() ShiftStatus? status,
    @JsonKey(
      fromJson: _nullableDateTimeFromJson,
      toJson: _nullableDateTimeToJson,
    )
    DateTime? clockInTime,
    @JsonKey(
      fromJson: _nullableDateTimeFromJson,
      toJson: _nullableDateTimeToJson,
    )
    DateTime? clockOutTime,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    required DateTime date,
    @JsonKey(
      fromJson: _nullableDateTimeFromJson,
      toJson: _nullableDateTimeToJson,
    )
    DateTime? createdAt,
    @JsonKey(
      fromJson: _nullableDateTimeFromJson,
      toJson: _nullableDateTimeToJson,
    )
    DateTime? updatedAt,
    num? pay,
  }) = _Shift;

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);
}

enum ShiftStatus {
  scheduled('Scheduled', 'Not Started'),
  inProgress('In Progress', 'In Progress'),
  completed('Completed', 'Completed'),
  cancelled('Cancelled', 'Cancelled');

  const ShiftStatus(this.apiValue, this.label);

  final String apiValue;
  final String label;

  bool matchesFilter(ShiftStatusFilter filter) {
    return switch (filter) {
      ShiftStatusFilter.active ||
      ShiftStatusFilter.inProgress => this == ShiftStatus.inProgress,
      _ => apiValue == filter.value,
    };
  }

  String get normalizedValue => apiValue.toLowerCase().replaceAll(' ', '_');

  static ShiftStatus? fromValue(String? value) {
    return switch (value?.trim().toLowerCase().replaceAll(' ', '_')) {
      'scheduled' || 'not_started' => ShiftStatus.scheduled,
      'in_progress' || 'active' => ShiftStatus.inProgress,
      'completed' => ShiftStatus.completed,
      'cancelled' || 'canceled' => ShiftStatus.cancelled,
      _ => null,
    };
  }
}

class ShiftStatusConverter implements JsonConverter<ShiftStatus?, String?> {
  const ShiftStatusConverter();

  @override
  ShiftStatus? fromJson(String? json) {
    return ShiftStatus.fromValue(json);
  }

  @override
  String? toJson(ShiftStatus? object) {
    return object?.apiValue;
  }
}

String _userNameFromJson(dynamic json) {
  if (json is String) {
    return json;
  }

  if (json is Map) {
    return json['name']?.toString() ?? json['id']?.toString() ?? '';
  }

  return '';
}

String _userToJson(String user) => user;

DateTime _dateTimeFromJson(dynamic json) {
  if (json is DateTime) {
    return json;
  }

  final String? value = json?.toString();
  if (value == null || value.isEmpty) {
    return DateTime.fromMillisecondsSinceEpoch(0);
  }

  final DateTime? parsedDate = DateTime.tryParse(value);
  if (parsedDate != null) {
    return parsedDate;
  }

  final List<String> timeParts = value.split(':');
  if (timeParts.length >= 2) {
    final int hour = int.tryParse(timeParts[0]) ?? 0;
    final int minute = int.tryParse(timeParts[1]) ?? 0;
    return DateTime(1970, 1, 1, hour, minute);
  }

  return DateTime.fromMillisecondsSinceEpoch(0);
}

DateTime? _nullableDateTimeFromJson(dynamic json) {
  if (json == null) {
    return null;
  }

  final String value = json.toString();
  if (value.isEmpty) {
    return null;
  }

  return _dateTimeFromJson(value);
}

String _dateTimeToJson(DateTime value) => value.toIso8601String();

String? _nullableDateTimeToJson(DateTime? value) => value?.toIso8601String();
