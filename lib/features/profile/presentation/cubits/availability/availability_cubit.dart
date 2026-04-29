import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'availability_cubit.freezed.dart';
part 'availability_state.dart';

class AvailabilityCubit extends Cubit<AvailabilityState> {
  AvailabilityCubit({required AvailabilityService availabilityService})
    : _availabilityService = availabilityService,
      super(AvailabilityState(weeklySchedule: ProfileDefaults.availability));

  final AvailabilityService _availabilityService;

  void initialize({required bool loadSavedTemplate}) {
    emit(
      AvailabilityState(
        weeklySchedule: ProfileDefaults.availability,
        referenceWeekStart: AvailabilityState.currentWeekStart(),
      ),
    );

    if (loadSavedTemplate) {
      loadAvailability();
    }
  }

  Future<void> loadAvailability() async {
    emit(state.toLoading());

    final Either<AppError, List<AvailabilityDay>> result =
        await _availabilityService.getAvailability();

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (List<AvailabilityDay> schedule) => emit(
        state.copyWith(
          viewState: ViewState.loaded,
          weeklySchedule: schedule.isEmpty
              ? ProfileDefaults.availability
              : schedule,
          errorMessage: '',
          saveSucceeded: false,
        ),
      ),
    );
  }

  void toggleDay(String day) {
    emit(
      state.copyWith(
        weeklySchedule: state.weeklySchedule.map((AvailabilityDay item) {
          if (item.day != day) return item;
          return item.copyWith(isAvailable: !item.isAvailable);
        }).toList(),
      ),
    );
  }

  void previousWeek() {
    emit(
      state.copyWith(
        referenceWeekStart: state.weekStart.subtract(const Duration(days: 7)),
      ),
    );
  }

  void nextWeek() {
    emit(
      state.copyWith(
        referenceWeekStart: state.weekStart.add(const Duration(days: 7)),
      ),
    );
  }

  Future<void> saveAvailability() async {
    if (state.isLoading) return;
    emit(state.toLoading());

    final Either<AppError, List<AvailabilityDay>> result =
        await _availabilityService.saveAvailability(
          weeklySchedule: state.weeklySchedule,
        );

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (List<AvailabilityDay> schedule) => emit(
        state.copyWith(
          viewState: ViewState.loaded,
          weeklySchedule: schedule,
          errorMessage: '',
          saveSucceeded: true,
        ),
      ),
    );
  }
}
