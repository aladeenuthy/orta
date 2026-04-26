import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'forgot_password_cubit.freezed.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({required AuthService authService})
    : _authService = authService,
      super(const ForgotPasswordState());

  final AuthService _authService;

  Future<void> forgotPassword({required String email}) async {
    if (state.isLoading) return;

    emit(state.toLoading());

    final Either<AppError, Unit> result = await _authService.forgotPassword(
      email: email,
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
