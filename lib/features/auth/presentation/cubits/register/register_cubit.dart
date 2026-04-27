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

  void firstNameChanged(String firstName) {
    emit(state.copyWith(firstName: firstName, errorMessage: null));
  }

  void lastNameChanged(String lastName) {
    emit(state.copyWith(lastName: lastName, errorMessage: null));
  }

  void emailChanged(String email) {
    emit(state.copyWith(email: email, errorMessage: null));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password, errorMessage: null));
  }

  void confirmPasswordChanged(String confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword, errorMessage: null));
  }

  Future<void> register() async {
    if (state.isLoading) return;

    emit(state.toLoading());

    final Either<AppError, Unit> result = await _authService.register(
      name: state.fullName,
      email: state.email.trim(),
      password: state.password,
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
