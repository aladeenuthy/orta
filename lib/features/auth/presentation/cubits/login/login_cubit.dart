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

  void emailChanged(String email) {
    emit(state.copyWith(email: email, errorMessage: null));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password, errorMessage: null));
  }

  Future<void> login() async {
    if (state.isLoading) return;

    emit(state.toLoading());

    final Either<AppError, AuthSession> result = await _authService.login(
      email: state.email.trim(),
      password: state.password,
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
