part of 'otp_verification_cubit.dart';

@freezed
class OtpVerificationState with _$OtpVerificationState {
  const factory OtpVerificationState({
    @Default(ViewState.initial) ViewState viewState,
    @Default('') String otp,
    @Default(30) int secondsRemaining,
    @Default(false) bool canResend,
    @Default(false) bool otpResent,
    String? errorMessage,
  }) = _OtpVerificationState;

  const OtpVerificationState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isError => viewState == ViewState.error;
  bool get isResent => otpResent;
  bool get canSubmit => otp.length == 6 && !isLoading;

  OtpVerificationState toLoading() => copyWith(
    viewState: ViewState.loading,
    otpResent: false,
    errorMessage: null,
  );

  OtpVerificationState toLoaded() =>
      copyWith(viewState: ViewState.loaded, errorMessage: null);

  OtpVerificationState toResent() => copyWith(
    viewState: ViewState.initial,
    otpResent: true,
    errorMessage: null,
  );

  OtpVerificationState toError(String message) =>
      copyWith(viewState: ViewState.error, errorMessage: message);
}
