import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_action_eligibility.freezed.dart';

@freezed
class ShiftActionEligibility with _$ShiftActionEligibility {
  const factory ShiftActionEligibility({
    required ShiftPrimaryActionType action,
    required bool enabled,
    required String label,
    bool? isWithinWorkLocation,
    String? warningMessage,
    ShiftLocationAction? locationAction,
    double? distanceInMeters,
  }) = _ShiftActionEligibility;
}

enum ShiftPrimaryActionType { clockIn, clockOut, completed, cancelled }

enum ShiftLocationAction {
  requestPermission,
  openAppSettings,
  openLocationSettings,
}
