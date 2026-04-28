import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'worker_profile_cubit.freezed.dart';
part 'worker_profile_state.dart';

class WorkerProfileCubit extends Cubit<WorkerProfileState> {
  WorkerProfileCubit({required WorkerProfileService workerProfileService})
    : _workerProfileService = workerProfileService,
      super(const WorkerProfileState());

  final WorkerProfileService _workerProfileService;

  Future<void> loadProfile() async {
    emit(state.toLoading());
    final Either<AppError, WorkerProfile> result = await _workerProfileService
        .getProfile();

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (WorkerProfile profile) => emit(state.toLoaded(profile)),
    );
  }
}
