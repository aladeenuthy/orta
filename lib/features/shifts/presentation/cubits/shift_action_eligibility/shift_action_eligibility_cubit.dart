import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'shift_action_eligibility_cubit.freezed.dart';
part 'shift_action_eligibility_state.dart';

class ShiftActionEligibilityCubit extends Cubit<ShiftActionEligibilityState> {
  ShiftActionEligibilityCubit({
    required LocationService locationService,
    required ShiftActionRules shiftActionRules,
    ShiftsService? shiftsService,
  }) : _locationService = locationService,
       _shiftActionRules = shiftActionRules,
       _shiftsService = shiftsService,
       super(const ShiftActionEligibilityState());

  final LocationService _locationService;
  final ShiftActionRules _shiftActionRules;
  final ShiftsService? _shiftsService;

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

    final _VerifiedLocation verifiedLocation = await _verifyLocation(
      shift: shift,
      workerCoordinates: workerCoordinates,
      fallbackWarning: locationWarning,
    );

    emit(
      state.toLoaded(
        _shiftActionRules.evaluate(
          shift: shift,
          now: DateTime.now(),
          workerCoordinates: verifiedLocation.coordinates,
          locationWarning: verifiedLocation.warning ?? locationWarning,
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

  Future<_VerifiedLocation> _verifyLocation({
    required Shift shift,
    required Coordinates? workerCoordinates,
    required String? fallbackWarning,
  }) async {
    final ShiftsService? shiftsService = _shiftsService;
    if (shiftsService == null || workerCoordinates == null) {
      return _VerifiedLocation(workerCoordinates, fallbackWarning);
    }

    final Either<AppError, LocationVerificationResult> result =
        await shiftsService.verifyLocation(
          id: shift.id,
          latitude: workerCoordinates.latitude,
          longitude: workerCoordinates.longitude,
        );

    return result.fold(
      (AppError error) => _VerifiedLocation(null, error.message),
      (LocationVerificationResult verification) {
        if (verification.withinRange) {
          return _VerifiedLocation(workerCoordinates, null);
        }
        return const _VerifiedLocation(
          null,
          'You must be within 200m of the work location',
        );
      },
    );
  }
}

class _VerifiedLocation {
  const _VerifiedLocation(this.coordinates, this.warning);

  final Coordinates? coordinates;
  final String? warning;
}
