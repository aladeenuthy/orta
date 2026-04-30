import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'marketplace_actions_cubit.freezed.dart';
part 'marketplace_actions_state.dart';

class MarketplaceActionsCubit extends Cubit<MarketplaceActionsState> {
  MarketplaceActionsCubit({required ShiftsService shiftsService})
    : _shiftsService = shiftsService,
      super(const MarketplaceActionsState());

  final ShiftsService _shiftsService;

  Future<void> claimShift(String id) async {
    if (state.isLoading) return;
    emit(state.toLoading());

    final Either<AppError, Shift> result = await _shiftsService.claimShift(id);
    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (Shift shift) => emit(state.toLoaded(shift)),
    );
  }
}
