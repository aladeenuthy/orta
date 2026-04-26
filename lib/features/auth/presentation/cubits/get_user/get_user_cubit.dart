import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'get_user_cubit.freezed.dart';
part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit({required AuthService authService})
    : _authService = authService,
      super(const GetUserState());

  final AuthService _authService;

  Future<void> getUser() async {
    if (state.isLoading) return;

    emit(state.toLoading());

    final Either<AppError, User> result = await _authService.getUser();

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (User user) => emit(state.toLoaded(user)),
    );
  }

  void resetErrorMessage() {
    emit(state.resetError());
  }
}
