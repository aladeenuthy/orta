import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orta/features/features.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required AuthService authService})
    : _authService = authService,
      super(const AuthState()) {
    _serviceEventSubscription = _authService.eventStream.listen(
      _onServiceEvent,
    );
  }

  final AuthService _authService;
  late final StreamSubscription<ServiceEvent> _serviceEventSubscription;

  Future<void> checkAuthentication() async {
    if (state.isLoading) return;

    emit(state.toLoading());

    final Either<AppError, AuthSession?> result = await _authService
        .getCachedSession();

    result.fold((AppError error) => emit(state.toError(error.message)), (
      AuthSession? session,
    ) {
      if (session == null) {
        emit(state.toUnauthenticated());
        return;
      }

      emit(state.toAuthenticated(session));
    });
  }

  void setAuthenticated(AuthSession session) {
    emit(state.toAuthenticated(session));
  }

  Future<void> refreshCurrentUser() async {
    if (!state.isAuthenticated) return;

    final Either<AppError, User> result = await _authService.getUser();

    result.fold((AppError error) => emit(state.toError(error.message)), (_) {});
  }

  Future<void> logout() async {
    if (state.isLoading) return;

    emit(state.toLoading());

    final Either<AppError, Unit> result = await _authService.clearSession();

    result.fold(
      (AppError error) => emit(state.toError(error.message)),
      (_) => emit(state.toUnauthenticated()),
    );
  }

  void resetErrorMessage() {
    emit(state.resetError());
  }

  void _onServiceEvent(ServiceEvent event) {
    if (event is AuthSessionUpdated) {
      emit(state.toAuthenticated(event.session));
    }

    if (event is AuthSessionCleared) {
      emit(state.toUnauthenticated());
    }
  }

  @override
  Future<void> close() async {
    await _serviceEventSubscription.cancel();
    return super.close();
  }
}
