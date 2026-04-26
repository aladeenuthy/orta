import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'auth_session.freezed.dart';
part 'auth_session.g.dart';

@freezed
class AuthSession with _$AuthSession {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory AuthSession({required String token, required User user}) =
      _AuthSession;

  factory AuthSession.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionFromJson(json);
}
