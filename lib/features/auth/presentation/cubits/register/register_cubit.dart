import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required AuthService authService})
    : _authService = authService,
      super(const RegisterState());

  final AuthService _authService;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    if (state.isLoading) return;

    emit(state.toLoading());

    final Either<AppError, Unit> result = await _authService.register(
      name: name,
      email: email,
      password: password,
    );

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (_) => emit(state.toLoaded()),
    );
  }

  void resetErrorMessage() {
    emit(state.resetError());
  }
}
