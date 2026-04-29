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

  Future<void> load({DateTime? requestedVisibleMonth}) async {
    final DateTime visibleMonth =
        requestedVisibleMonth ??
        state.visibleMonth ??
        DateTime(DateTime.now().year, DateTime.now().month);
    emit(state.toLoading().copyWith(visibleMonth: visibleMonth));
    final Either<AppError, List<UnavailabilityPeriod>> result =
        await _unavailabilityService.getUnavailability();

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (List<UnavailabilityPeriod> items) =>
          emit(state.toLoaded(items, visibleMonth: visibleMonth)),
    );
  }

  void changeVisibleMonth(DateTime month) {
    emit(state.copyWith(visibleMonth: DateTime(month.year, month.month)));
  }

  Future<bool> add({
    required DateTime startDate,
    required DateTime endDate,
    String? reason,
  }) async {
    emit(state.toLoading());
    final UnavailabilityPeriod item = UnavailabilityPeriod(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      startDate: startDate,
      endDate: endDate,
      reason: reason,
    );
    final Either<AppError, List<UnavailabilityPeriod>> result =
        await _unavailabilityService.saveUnavailability(
          unavailableDates: <UnavailabilityPeriod>[item],
        );

    bool saved = false;
    await result.fold(
      (AppError error) async {
        emit(state.toError(error.message));
      },
      (List<UnavailabilityPeriod> items) async {
        emit(state.toLoaded(items));
        saved = true;
      },
    );
    return saved;
  }

  Future<bool> remove(String id) async {
    emit(state.toLoading());
    final Either<AppError, Unit> result = await _unavailabilityService
        .deleteUnavailability(id);

    bool removed = false;
    await result.fold(
      (AppError error) async {
        emit(state.toError(error.message));
      },
      (_) async {
        await load();
        removed = true;
      },
    );
    return removed;
  }
}
