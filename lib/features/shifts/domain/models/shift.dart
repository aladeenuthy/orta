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
    required String user,
    required DateTime startTime,
    required DateTime finishTime,
    required int numOfShiftsPerDay,
    required Location location,
    @ShiftStatusConverter() ShiftStatus? status,
    DateTime? clockInTime,
    DateTime? clockOutTime,
    required DateTime date,
    DateTime? createdAt,
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
      _ => normalizedValue == filter.value,
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


