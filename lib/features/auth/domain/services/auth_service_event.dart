import 'package:orta/features/features.dart';

abstract class AuthServiceEvent extends ServiceEvent {
  const AuthServiceEvent();
}

class AuthSessionUpdated extends AuthServiceEvent {
  const AuthSessionUpdated(this.session);

  final AuthSession session;
}

class AuthSessionCleared extends AuthServiceEvent {
  const AuthSessionCleared();
}
