import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'shift.freezed.dart';
part 'shift.g.dart';

@freezed
class Shift with _$Shift {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory Shift({
    String? id,
    required String title,
    required String role,
    required List<String> typeOfShift,
    required String user,
    required String startTime,
    required String finishTime,
    required int numOfShiftsPerDay,
    required Location location,
    required DateTime date,
    String? status,
    num? pay,
  }) = _Shift;

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);
}
