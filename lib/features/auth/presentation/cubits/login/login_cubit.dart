import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthService authService})
    : _authService = authService,
      super(const LoginState());

  final AuthService _authService;

  Future<void> login({required String email, required String password}) async {
    if (state.isLoading) return;

    emit(state.toLoading());

    final Either<AppError, AuthSession> result = await _authService.login(
      email: email,
      password: password,
    );

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (AuthSession session) => emit(state.toLoaded(session)),
    );
  }

  void resetErrorMessage() {
    emit(state.resetError());
  }
}
