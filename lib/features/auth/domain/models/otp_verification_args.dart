import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_verification_args.freezed.dart';

@freezed
class OtpVerificationArgs with _$OtpVerificationArgs {
  const factory OtpVerificationArgs({required String email}) =
      _OtpVerificationArgs;
}
