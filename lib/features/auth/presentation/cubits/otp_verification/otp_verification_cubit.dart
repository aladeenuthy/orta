import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'otp_verification_cubit.freezed.dart';
part 'otp_verification_state.dart';

class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  OtpVerificationCubit({required AuthService authService})
    : _authService = authService,
      super(const OtpVerificationState()) {
    startCountdown();
  }

  final AuthService _authService;
  Timer? _timer;

  void otpChanged(String otp) {
    emit(state.copyWith(otp: otp, errorMessage: null));
  }

  void startCountdown() {
    _timer?.cancel();
    emit(
      state.copyWith(secondsRemaining: 30, canResend: false, otpResent: false),
    );
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      final int next = state.secondsRemaining - 1;
      if (next <= 0) {
        timer.cancel();
        emit(state.copyWith(secondsRemaining: 0, canResend: true));
        return;
      }

      emit(state.copyWith(secondsRemaining: next));
    });
  }

  Future<void> resendOtp(String email) async {
    if (!state.canResend || state.isLoading) return;

    emit(state.toLoading());
    final Either<AppError, Unit> result = await _authService.resendOtp(
      email: email,
    );

    result.fold((AppError error) => emit(state.toError(error.message)), (_) {
      emit(state.toResent());
      startCountdown();
    });
  }

  Future<void> verifyOtp(String email) async {
    if (state.isLoading) return;

    emit(state.toLoading());
    final Either<AppError, AuthSession> result = await _authService.verifyOtp(
      email: email,
      otp: state.otp,
    );

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (_) => emit(state.toLoaded()),
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
