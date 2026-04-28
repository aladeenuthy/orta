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

    final Either<AppError, Unit> result = await _availabilityService
        .saveAvailability(weeklySchedule: state.weeklySchedule);

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (_) => emit(state.toLoaded()),
    );
  }
}
