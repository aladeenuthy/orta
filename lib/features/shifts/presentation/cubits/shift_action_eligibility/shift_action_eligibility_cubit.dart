import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'shift_action_eligibility_cubit.freezed.dart';
part 'shift_action_eligibility_state.dart';

class ShiftActionEligibilityCubit extends Cubit<ShiftActionEligibilityState> {
  ShiftActionEligibilityCubit({
    required LocationService locationService,
    required ShiftActionRules shiftActionRules,
    required ShiftsService shiftsService,
  }) : _locationService = locationService,
       _shiftActionRules = shiftActionRules,
       _shiftsService = shiftsService,
       super(const ShiftActionEligibilityState());

  final LocationService _locationService;
  final ShiftActionRules _shiftActionRules;
  final ShiftsService _shiftsService;

  Future<void> evaluate(Shift shift) async {
    emit(state.toLoading());

    final Either<AppError, Coordinates> result = await _locationService
        .currentCoordinates();
    final String? locationWarning = result.fold(
      (AppError error) => error.message,
      (_) => null,
    );
    final ShiftLocationAction? locationAction = result.fold(
      (AppError error) => _locationActionFor(error.message),
      (_) => null,
    );
    final _VerifiedLocation verifiedLocation = await result.fold(
      (_) async => const _VerifiedLocation(),
      (Coordinates coordinates) =>
          _verifyLocation(shift: shift, coordinates: coordinates),
    );

    emit(
      state.toLoaded(
        _shiftActionRules.evaluate(
          shift: shift,
          now: DateTime.now(),
          locationVerification: verifiedLocation.result,
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
    required Coordinates coordinates,
  }) async {
    final Either<AppError, LocationVerificationResult> result =
        await _shiftsService.verifyLocation(
          id: shift.id,
          latitude: coordinates.latitude,
          longitude: coordinates.longitude,
        );

    return result.fold(
      (AppError error) => _VerifiedLocation(warning: error.message),
      (LocationVerificationResult verification) =>
          _VerifiedLocation(result: verification),
    );
  }
}

class _VerifiedLocation {
  const _VerifiedLocation({this.result, this.warning});

  final LocationVerificationResult? result;
  final String? warning;
}
