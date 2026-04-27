import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'reset_password_cubit.freezed.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required AuthService authService})
    : _authService = authService,
      super(const ResetPasswordState());

  final AuthService _authService;

  void passwordChanged(String password) {
    emit(state.copyWith(password: password, errorMessage: null));
  }

  void confirmPasswordChanged(String confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword, errorMessage: null));
  }

  Future<void> resetPassword({
    required String userId,
    required String resetToken,
  }) async {
    if (state.isLoading) return;

    emit(state.toLoading());

    final Either<AppError, Unit> result = await _authService.resetPassword(
      userId: userId,
      resetToken: resetToken,
      newPassword: state.password,
      confirmPassword: state.confirmPassword,
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
