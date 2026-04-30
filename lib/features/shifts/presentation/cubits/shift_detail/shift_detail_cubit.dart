import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'shift_detail_cubit.freezed.dart';
part 'shift_detail_state.dart';

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

  void resetErrorMessage() {
    emit(state.resetError());
  }
}
