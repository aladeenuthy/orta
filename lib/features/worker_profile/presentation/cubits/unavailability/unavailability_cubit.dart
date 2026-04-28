import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'unavailability_cubit.freezed.dart';
part 'unavailability_state.dart';

class UnavailabilityCubit extends Cubit<UnavailabilityState> {
  UnavailabilityCubit({required UnavailabilityService unavailabilityService})
    : _unavailabilityService = unavailabilityService,
      super(const UnavailabilityState());

  final UnavailabilityService _unavailabilityService;

  Future<void> load() async {
    emit(state.toLoading());
    final Either<AppError, List<UnavailabilityPeriod>> result =
        await _unavailabilityService.getUnavailability();

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (List<UnavailabilityPeriod> items) => emit(state.toLoaded(items)),
    );
  }

  Future<void> add({
    required DateTime startDate,
    required DateTime endDate,
    String? reason,
  }) async {
    final UnavailabilityPeriod item = UnavailabilityPeriod(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      startDate: startDate,
      endDate: endDate,
      reason: reason,
    );
    final Either<AppError, Unit> result = await _unavailabilityService
        .saveUnavailability(unavailableDates: <UnavailabilityPeriod>[item]);

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (_) => emit(state.toLoaded(<UnavailabilityPeriod>[...state.items, item])),
    );
  }

  Future<void> remove(String id) async {
    final Either<AppError, Unit> result = await _unavailabilityService
        .deleteUnavailability(id);

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (_) => emit(
        state.toLoaded(
          state.items
              .where((UnavailabilityPeriod item) => item.id != id)
              .toList(),
        ),
      ),
    );
  }
}
