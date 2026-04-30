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
    @JsonKey(fromJson: _shiftTypesFromJson, toJson: _shiftTypesToJson)
    required List<ShiftType> typeOfShift,
    @JsonKey(fromJson: _userNameFromJson, toJson: _userToJson)
    required String user,
    @JsonKey(fromJson: _timeFromJson, toJson: _timeToJson)
    required DateTime startTime,
    @JsonKey(fromJson: _timeFromJson, toJson: _timeToJson)
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
  inProgress('In Progress', 'Ongoing'),
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
      'scheduled' => ShiftStatus.scheduled,
      'in_progress' => ShiftStatus.inProgress,
      'completed' => ShiftStatus.completed,
      'cancelled' => ShiftStatus.cancelled,
      _ => null,
    };
  }
}

enum ShiftType {
  morning('Morning'),
  evening('Evening'),
  night('Night'),
  weekday('Weekday'),
  weekend('Weekend');

  const ShiftType(this.apiValue);

  final String apiValue;

  static ShiftType? fromValue(String? value) {
    return switch (value?.trim().toLowerCase()) {
      'weekend' => ShiftType.weekend,
      'weekday' => ShiftType.weekday,
      'evening' => ShiftType.evening,
      'morning' => ShiftType.morning,
      'night' => ShiftType.night,
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

List<ShiftType> _shiftTypesFromJson(dynamic json) {
  if (json is! List) return const <ShiftType>[];

  return json
      .map((dynamic item) => ShiftType.fromValue(item?.toString()))
      .whereType<ShiftType>()
      .toList();
}

List<String> _shiftTypesToJson(List<ShiftType> types) {
  return types.map((ShiftType type) => type.apiValue).toList();
}

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

DateTime _timeFromJson(dynamic json) {
  if (json is DateTime) {
    return DateTime(1970, 1, 1, json.hour, json.minute, json.second);
  }

  final String? value = json?.toString();
  if (value == null || value.isEmpty) {
    return DateTime.fromMillisecondsSinceEpoch(0);
  }

  final RegExpMatch? isoTimeMatch = RegExp(
    r'T(\d{2}):(\d{2})(?::(\d{2}))?',
  ).firstMatch(value);
  if (isoTimeMatch != null) {
    return DateTime(
      1970,
      1,
      1,
      int.parse(isoTimeMatch.group(1)!),
      int.parse(isoTimeMatch.group(2)!),
      int.tryParse(isoTimeMatch.group(3) ?? '0') ?? 0,
    );
  }

  final List<String> timeParts = value.split(':');
  if (timeParts.length >= 2) {
    final int hour = int.tryParse(timeParts[0]) ?? 0;
    final int minute = int.tryParse(timeParts[1]) ?? 0;
    final int second = timeParts.length > 2
        ? int.tryParse(timeParts[2]) ?? 0
        : 0;
    return DateTime(1970, 1, 1, hour, minute, second);
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

String _timeToJson(DateTime value) {
  return '${_twoDigits(value.hour)}:${_twoDigits(value.minute)}';
}

String? _nullableDateTimeToJson(DateTime? value) => value?.toIso8601String();

String _twoDigits(int value) => value.toString().padLeft(2, '0');
