import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'shift_actions_cubit.freezed.dart';
part 'shift_actions_state.dart';

enum ShiftAction { cancel, clockIn, clockOut }

class ShiftActionsCubit extends Cubit<ShiftActionsState> {
  ShiftActionsCubit({
    required ShiftsService shiftsService,
    LocationService? locationService,
  }) : _shiftsService = shiftsService,
       _locationService = locationService,
       super(const ShiftActionsState());

  final ShiftsService _shiftsService;
  final LocationService? _locationService;

  Future<void> cancelShift(String id) {
    return _runAction(
      action: ShiftAction.cancel,
      request: () => _shiftsService.cancelShift(id),
    );
  }

  Future<void> clockIn(String id) {
    return _runAction(
      action: ShiftAction.clockIn,
      request: () => _verifyLocationThenRun(
        id: id,
        request: () => _shiftsService.clockIn(id),
      ),
    );
  }

  Future<void> clockOut(String id) {
    return _runAction(
      action: ShiftAction.clockOut,
      request: () => _verifyLocationThenRun(
        id: id,
        request: () => _shiftsService.clockOut(id),
      ),
    );
  }

  void resetErrorMessage() {
    emit(state.resetError());
  }

  Future<void> _runAction({
    required ShiftAction action,
    required Future<Either<AppError, Unit>> Function() request,
  }) async {
    if (state.isLoading) return;

    emit(state.toLoading(action));

    final Either<AppError, Unit> result = await request();

    result.fold(
      (AppError error) => emit(state.toError(action, error.message)),
      (_) => emit(state.toLoaded(action)),
    );
  }

  Future<Either<AppError, Unit>> _verifyLocationThenRun({
    required String id,
    required Future<Either<AppError, Unit>> Function() request,
  }) async {
    final LocationService? locationService = _locationService;
    if (locationService == null) {
      return request();
    }

    final Either<AppError, Coordinates> coordinatesResult =
        await locationService.currentCoordinates();

    return coordinatesResult.fold(
      (AppError error) async => left<AppError, Unit>(error),
      (Coordinates coordinates) async {
        final Either<AppError, LocationVerificationResult> verifyResult =
            await _shiftsService.verifyLocation(
              id: id,
              latitude: coordinates.latitude,
              longitude: coordinates.longitude,
            );

        return verifyResult.fold(
          (AppError error) async => left<AppError, Unit>(error),
          (LocationVerificationResult result) async {
            if (!result.withinRange) {
              return left<AppError, Unit>(
                AppError(
                  'You must be within ${result.radiusMeters}m of the work location',
                ),
              );
            }

            return request();
          },
        );
      },
    );
  }
}
