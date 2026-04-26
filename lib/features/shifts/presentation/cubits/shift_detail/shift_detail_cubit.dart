import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'shift_detail_cubit.freezed.dart';
part 'shift_detail_state.dart';

enum ShiftDetailAction { cancel, clockIn, clockOut }

class ShiftDetailCubit extends Cubit<ShiftDetailState> {
  ShiftDetailCubit({required ShiftsService shiftsService})
    : _shiftsService = shiftsService,
      super(const ShiftDetailState());

  final ShiftsService _shiftsService;

  Future<void> getShiftDetail(String id) async {
    if (state.isLoading) return;

    emit(state.toLoading());

    final Either<AppError, Shift> result = await _shiftsService.getShiftDetail(
      id,
    );

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (Shift shift) => emit(state.toLoaded(shift)),
    );
  }

  Future<void> cancelShift(String id) {
    return _runAction(
      action: ShiftDetailAction.cancel,
      request: () => _shiftsService.cancelShift(id),
    );
  }

  Future<void> clockIn(String id) {
    return _runAction(
      action: ShiftDetailAction.clockIn,
      request: () => _shiftsService.clockIn(id),
    );
  }

  Future<void> clockOut(String id) {
    return _runAction(
      action: ShiftDetailAction.clockOut,
      request: () => _shiftsService.clockOut(id),
    );
  }

  void resetErrorMessage() {
    emit(state.resetError());
  }

  Future<void> _runAction({
    required ShiftDetailAction action,
    required Future<Either<AppError, Unit>> Function() request,
  }) async {
    if (state.isLoading) return;

    emit(state.toActionLoading(action));

    final Either<AppError, Unit> result = await request();

    result.fold(
      (AppError error) => emit(state.toActionError(action, error.message)),
      (_) => emit(state.toActionLoaded(action)),
    );
  }
}
