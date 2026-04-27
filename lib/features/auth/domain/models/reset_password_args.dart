import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_args.freezed.dart';

@freezed
class ResetPasswordArgs with _$ResetPasswordArgs {
  const factory ResetPasswordArgs({
    required String userId,
    required String resetToken,
  }) = _ResetPasswordArgs;

  static ResetPasswordArgs? fromUri(Uri uri) {
    final String? userId =
        uri.queryParameters['uid'] ?? uri.queryParameters['id'];
    final String? resetToken =
        uri.queryParameters['token'] ?? uri.queryParameters['resetToken'];

    if (userId == null ||
        userId.isEmpty ||
        resetToken == null ||
        resetToken.isEmpty) {
      return null;
    }

    return ResetPasswordArgs(userId: userId, resetToken: resetToken);
  }
}
