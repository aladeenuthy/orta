import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'shift_action_eligibility_cubit.freezed.dart';
part 'shift_action_eligibility_state.dart';

class ShiftActionEligibilityCubit extends Cubit<ShiftActionEligibilityState> {
  ShiftActionEligibilityCubit({
    required LocationService locationService,
    required ShiftActionRules shiftActionRules,
  }) : _locationService = locationService,
       _shiftActionRules = shiftActionRules,
       super(const ShiftActionEligibilityState());

  final LocationService _locationService;
  final ShiftActionRules _shiftActionRules;

  Future<void> evaluate(Shift shift) async {
    emit(state.toLoading());

    final Either<AppError, Coordinates> result = await _locationService
        .currentCoordinates();
    final Coordinates? workerCoordinates = result.fold(
      (_) => null,
      (Coordinates coordinates) => coordinates,
    );
    final String? locationWarning = result.fold(
      (AppError error) => error.message,
      (_) => null,
    );
    final ShiftLocationAction? locationAction = result.fold(
      (AppError error) => _locationActionFor(error.message),
      (_) => null,
    );

    emit(
      state.toLoaded(
        _shiftActionRules.evaluate(
          shift: shift,
          now: DateTime.now(),
          workerCoordinates: workerCoordinates,
          locationWarning: locationWarning,
          locationAction: locationAction,
        ),
      ),
    );
  }

  Future<void> openAppSettings(Shift shift) async {
    await _locationService.openAppSettings();
    await evaluate(shift);
  }

  Future<void> openLocationSettings(Shift shift) async {
    await _locationService.openLocationSettings();
    await evaluate(shift);
  }

  ShiftLocationAction? _locationActionFor(String message) {
    return switch (message) {
      GeolocatorLocationService.permissionRequiredMessage =>
        ShiftLocationAction.requestPermission,
      GeolocatorLocationService.permissionDeniedForeverMessage =>
        ShiftLocationAction.openAppSettings,
      GeolocatorLocationService.serviceDisabledMessage =>
        ShiftLocationAction.openLocationSettings,
      _ => ShiftLocationAction.requestPermission,
    };
  }
}
