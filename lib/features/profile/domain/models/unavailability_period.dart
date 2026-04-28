import 'package:freezed_annotation/freezed_annotation.dart';

part 'unavailability_period.freezed.dart';
part 'unavailability_period.g.dart';

@freezed
class UnavailabilityPeriod with _$UnavailabilityPeriod {
  const factory UnavailabilityPeriod({
    required String id,
    required DateTime startDate,
    required DateTime endDate,
    String? reason,
  }) = _UnavailabilityPeriod;

  factory UnavailabilityPeriod.fromJson(Map<String, dynamic> json) =>
      _$UnavailabilityPeriodFromJson(json);
}
