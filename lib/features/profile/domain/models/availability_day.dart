import 'package:freezed_annotation/freezed_annotation.dart';

part 'availability_day.freezed.dart';
part 'availability_day.g.dart';

@freezed
class AvailabilityDay with _$AvailabilityDay {
  const factory AvailabilityDay({
    required String day,
    @Default(false) bool isAvailable,
    @Default('08:00') String startTime,
    @Default('21:00') String endTime,
  }) = _AvailabilityDay;

  factory AvailabilityDay.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityDayFromJson(json);
}
