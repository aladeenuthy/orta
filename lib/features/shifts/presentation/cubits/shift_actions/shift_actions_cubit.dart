import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'shift_actions_cubit.freezed.dart';
part 'shift_actions_state.dart';

enum ShiftAction { cancel, clockIn, clockOut }

class ShiftActionsCubit extends Cubit<ShiftActionsState> {
  ShiftActionsCubit({required ShiftsService shiftsService})
    : _shiftsService = shiftsService,
      super(const ShiftActionsState());

  final ShiftsService _shiftsService;

  Future<void> cancelShift(String id) {
    return _runAction(
      action: ShiftAction.cancel,
      request: () => _shiftsService.cancelShift(id),
    );
  }

  Future<void> clockIn(String id) {
    return _runAction(
      action: ShiftAction.clockIn,
      request: () => _shiftsService.clockIn(id),
    );
  }

  Future<void> clockOut(String id) {
    return _runAction(
      action: ShiftAction.clockOut,
      request: () => _shiftsService.clockOut(id),
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
}
