import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  late MockAuthService authService;

  const User user = User(
    id: '69edb6a277d24da71a004b3e',
    name: 'Test Doe',
    email: 'Test@example.com',
    role: 'worker',
  );
  const AuthSession session = AuthSession(token: 'token', user: user);

  setUp(() {
    authService = MockAuthService();
    when(
      () => authService.eventStream,
    ).thenAnswer((_) => const Stream<ServiceEvent>.empty());
  });

  group('AuthCubit', () {
    late StreamController<ServiceEvent> eventController;

    tearDown(() async {
      if (!eventController.isClosed) {
        await eventController.close();
      }
    });

    blocTest<AuthCubit, AuthState>(
      'emits loading and authenticated when cached session exists',
      setUp: () {
        eventController = StreamController<ServiceEvent>.broadcast();
        when(
          () => authService.eventStream,
        ).thenAnswer((_) => eventController.stream);
      },
      build: () {
        when(
          () => authService.getCachedSession(),
        ).thenAnswer((_) async => const Right<AppError, AuthSession?>(session));
        return AuthCubit(authService: authService);
      },
      act: (AuthCubit cubit) => cubit.checkAuthentication(),
      expect: () => <AuthState>[
        const AuthState(viewState: ViewState.loading),
        const AuthState(viewState: ViewState.loaded, session: session),
      ],
      verify: (_) {
        verify(() => authService.getCachedSession()).called(1);
      },
    );

    blocTest<AuthCubit, AuthState>(
      'emits loading and unauthenticated when cached session is missing',
      setUp: () {
        eventController = StreamController<ServiceEvent>.broadcast();
        when(
          () => authService.eventStream,
        ).thenAnswer((_) => eventController.stream);
      },
      build: () {
        when(
          () => authService.getCachedSession(),
        ).thenAnswer((_) async => const Right<AppError, AuthSession?>(null));
        return AuthCubit(authService: authService);
      },
      act: (AuthCubit cubit) => cubit.checkAuthentication(),
      expect: () => <AuthState>[
        const AuthState(viewState: ViewState.loading),
        const AuthState(viewState: ViewState.loaded),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'emits loading and error when cached session lookup fails',
      setUp: () {
        eventController = StreamController<ServiceEvent>.broadcast();
        when(
          () => authService.eventStream,
        ).thenAnswer((_) => eventController.stream);
      },
      build: () {
        when(() => authService.getCachedSession()).thenAnswer(
          (_) async =>
              const Left<AppError, AuthSession?>(AppError('Cache failed')),
        );
        return AuthCubit(authService: authService);
      },
      act: (AuthCubit cubit) => cubit.checkAuthentication(),
      expect: () => <AuthState>[
        const AuthState(viewState: ViewState.loading),
        const AuthState(
          viewState: ViewState.error,
          errorMessage: 'Cache failed',
        ),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'sets authenticated session',
      setUp: () {
        eventController = StreamController<ServiceEvent>.broadcast();
        when(
          () => authService.eventStream,
        ).thenAnswer((_) => eventController.stream);
      },
      build: () => AuthCubit(authService: authService),
      act: (AuthCubit cubit) => cubit.setAuthenticated(session),
      expect: () => <AuthState>[
        const AuthState(viewState: ViewState.loaded, session: session),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'clears session and emits unauthenticated on logout',
      setUp: () {
        eventController = StreamController<ServiceEvent>.broadcast();
        when(
          () => authService.eventStream,
        ).thenAnswer((_) => eventController.stream);
      },
      build: () {
        when(
          () => authService.clearSession(),
        ).thenAnswer((_) async => const Right<AppError, Unit>(unit));
        return AuthCubit(authService: authService);
      },
      seed: () =>
          const AuthState(viewState: ViewState.loaded, session: session),
      act: (AuthCubit cubit) => cubit.logout(),
      expect: () => <AuthState>[
        const AuthState(viewState: ViewState.loading, session: session),
        const AuthState(viewState: ViewState.loaded),
      ],
      verify: (_) {
        verify(() => authService.clearSession()).called(1);
      },
    );

    blocTest<AuthCubit, AuthState>(
      'emits loading and error when logout fails',
      setUp: () {
        eventController = StreamController<ServiceEvent>.broadcast();
        when(
          () => authService.eventStream,
        ).thenAnswer((_) => eventController.stream);
      },
      build: () {
        when(() => authService.clearSession()).thenAnswer(
          (_) async => const Left<AppError, Unit>(AppError('Unable to logout')),
        );
        return AuthCubit(authService: authService);
      },
      seed: () =>
          const AuthState(viewState: ViewState.loaded, session: session),
      act: (AuthCubit cubit) => cubit.logout(),
      expect: () => <AuthState>[
        const AuthState(viewState: ViewState.loading, session: session),
        const AuthState(
          viewState: ViewState.error,
          session: session,
          errorMessage: 'Unable to logout',
        ),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'updates session from auth service event',
      setUp: () {
        eventController = StreamController<ServiceEvent>.broadcast();
        when(
          () => authService.eventStream,
        ).thenAnswer((_) => eventController.stream);
      },
      build: () => AuthCubit(authService: authService),
      act: (_) => eventController.add(const AuthSessionUpdated(session)),
      wait: const Duration(milliseconds: 1),
      expect: () => <AuthState>[
        const AuthState(viewState: ViewState.loaded, session: session),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'clears session from auth service event',
      setUp: () {
        eventController = StreamController<ServiceEvent>.broadcast();
        when(
          () => authService.eventStream,
        ).thenAnswer((_) => eventController.stream);
      },
      build: () => AuthCubit(authService: authService),
      seed: () =>
          const AuthState(viewState: ViewState.loaded, session: session),
      act: (_) => eventController.add(const AuthSessionCleared()),
      wait: const Duration(milliseconds: 1),
      expect: () => <AuthState>[const AuthState(viewState: ViewState.loaded)],
    );

    blocTest<AuthCubit, AuthState>(
      'resets error message',
      setUp: () {
        eventController = StreamController<ServiceEvent>.broadcast();
        when(
          () => authService.eventStream,
        ).thenAnswer((_) => eventController.stream);
      },
      build: () => AuthCubit(authService: authService),
      seed: () => const AuthState(
        viewState: ViewState.error,
        errorMessage: 'Cache failed',
      ),
      act: (AuthCubit cubit) => cubit.resetErrorMessage(),
      expect: () => <AuthState>[const AuthState()],
    );
  });

  group('LoginCubit', () {
    blocTest<LoginCubit, LoginState>(
      'emits loading and loaded when login succeeds',
      build: () {
        when(
          () => authService.login(
            email: 'john@example.com',
            password: 'StrongPass123!',
          ),
        ).thenAnswer((_) async => const Right<AppError, AuthSession>(session));
        return LoginCubit(authService: authService);
      },
      seed: () => const LoginState(
        email: 'john@example.com',
        password: 'StrongPass123!',
      ),
      act: (LoginCubit cubit) => cubit.login(),
      expect: () => <LoginState>[
        const LoginState(
          viewState: ViewState.loading,
          email: 'john@example.com',
          password: 'StrongPass123!',
        ),
        const LoginState(
          viewState: ViewState.loaded,
          email: 'john@example.com',
          password: 'StrongPass123!',
          session: session,
        ),
      ],
      verify: (_) {
        verify(
          () => authService.login(
            email: 'john@example.com',
            password: 'StrongPass123!',
          ),
        ).called(1);
      },
    );

    blocTest<LoginCubit, LoginState>(
      'emits loading and error when login fails',
      build: () {
        when(
          () => authService.login(
            email: 'john@example.com',
            password: 'StrongPass123!',
          ),
        ).thenAnswer(
          (_) async =>
              const Left<AppError, AuthSession>(AppError('Invalid login')),
        );
        return LoginCubit(authService: authService);
      },
      seed: () => const LoginState(
        email: 'john@example.com',
        password: 'StrongPass123!',
      ),
      act: (LoginCubit cubit) => cubit.login(),
      expect: () => <LoginState>[
        const LoginState(
          viewState: ViewState.loading,
          email: 'john@example.com',
          password: 'StrongPass123!',
        ),
        const LoginState(
          viewState: ViewState.error,
          email: 'john@example.com',
          password: 'StrongPass123!',
          errorMessage: 'Invalid login',
        ),
      ],
    );

    blocTest<LoginCubit, LoginState>(
      'updates login form fields',
      build: () => LoginCubit(authService: authService),
      act: (LoginCubit cubit) {
        cubit.emailChanged('john@example.com');
        cubit.passwordChanged('StrongPass123!');
      },
      expect: () => <LoginState>[
        const LoginState(email: 'john@example.com'),
        const LoginState(email: 'john@example.com', password: 'StrongPass123!'),
      ],
    );

    blocTest<LoginCubit, LoginState>(
      'resets error message',
      build: () => LoginCubit(authService: authService),
      seed: () => const LoginState(
        viewState: ViewState.error,
        errorMessage: 'Invalid login',
      ),
      act: (LoginCubit cubit) => cubit.resetErrorMessage(),
      expect: () => <LoginState>[const LoginState()],
    );
  });

  group('RegisterCubit', () {
    blocTest<RegisterCubit, RegisterState>(
      'emits loading and loaded when register succeeds',
      build: () {
        when(
          () => authService.register(
            name: 'Test Doe',
            email: 'Test@example.com',
            password: 'Marine345@',
          ),
        ).thenAnswer((_) async => const Right<AppError, Unit>(unit));
        return RegisterCubit(authService: authService);
      },
      seed: () => const RegisterState(
        firstName: 'Test',
        lastName: 'Doe',
        email: 'Test@example.com',
        password: 'Marine345@',
      ),
      act: (RegisterCubit cubit) => cubit.register(),
      expect: () => <RegisterState>[
        const RegisterState(
          viewState: ViewState.loading,
          firstName: 'Test',
          lastName: 'Doe',
          email: 'Test@example.com',
          password: 'Marine345@',
        ),
        const RegisterState(
          viewState: ViewState.loaded,
          firstName: 'Test',
          lastName: 'Doe',
          email: 'Test@example.com',
          password: 'Marine345@',
        ),
      ],
    );

    blocTest<RegisterCubit, RegisterState>(
      'emits loading and error when register fails',
      build: () {
        when(
          () => authService.register(
            name: 'Test Doe',
            email: 'Test@example.com',
            password: 'Marine345@',
          ),
        ).thenAnswer(
          (_) async => const Left<AppError, Unit>(AppError('Email exists')),
        );
        return RegisterCubit(authService: authService);
      },
      seed: () => const RegisterState(
        firstName: 'Test',
        lastName: 'Doe',
        email: 'Test@example.com',
        password: 'Marine345@',
      ),
      act: (RegisterCubit cubit) => cubit.register(),
      expect: () => <RegisterState>[
        const RegisterState(
          viewState: ViewState.loading,
          firstName: 'Test',
          lastName: 'Doe',
          email: 'Test@example.com',
          password: 'Marine345@',
        ),
        const RegisterState(
          viewState: ViewState.error,
          firstName: 'Test',
          lastName: 'Doe',
          email: 'Test@example.com',
          password: 'Marine345@',
          errorMessage: 'Email exists',
        ),
      ],
    );

    blocTest<RegisterCubit, RegisterState>(
      'updates register form fields',
      build: () => RegisterCubit(authService: authService),
      act: (RegisterCubit cubit) {
        cubit.firstNameChanged('Test');
        cubit.lastNameChanged('Doe');
        cubit.emailChanged('Test@example.com');
        cubit.passwordChanged('Marine345@');
        cubit.confirmPasswordChanged('Marine345@');
      },
      expect: () => <RegisterState>[
        const RegisterState(firstName: 'Test'),
        const RegisterState(firstName: 'Test', lastName: 'Doe'),
        const RegisterState(
          firstName: 'Test',
          lastName: 'Doe',
          email: 'Test@example.com',
        ),
        const RegisterState(
          firstName: 'Test',
          lastName: 'Doe',
          email: 'Test@example.com',
          password: 'Marine345@',
        ),
        const RegisterState(
          firstName: 'Test',
          lastName: 'Doe',
          email: 'Test@example.com',
          password: 'Marine345@',
          confirmPassword: 'Marine345@',
        ),
      ],
    );

    blocTest<RegisterCubit, RegisterState>(
      'resets error message',
      build: () => RegisterCubit(authService: authService),
      seed: () => const RegisterState(
        viewState: ViewState.error,
        errorMessage: 'Email exists',
      ),
      act: (RegisterCubit cubit) => cubit.resetErrorMessage(),
      expect: () => <RegisterState>[const RegisterState()],
    );
  });

  group('ForgotPasswordCubit', () {
    blocTest<ForgotPasswordCubit, ForgotPasswordState>(
      'emits loading and loaded when forgot password succeeds',
      build: () {
        when(
          () => authService.forgotPassword(email: 'john@example.com'),
        ).thenAnswer((_) async => const Right<AppError, Unit>(unit));
        return ForgotPasswordCubit(authService: authService);
      },
      seed: () => const ForgotPasswordState(email: 'john@example.com'),
      act: (ForgotPasswordCubit cubit) => cubit.forgotPassword(),
      expect: () => <ForgotPasswordState>[
        const ForgotPasswordState(
          viewState: ViewState.loading,
          email: 'john@example.com',
        ),
        const ForgotPasswordState(
          viewState: ViewState.loaded,
          email: 'john@example.com',
        ),
      ],
    );

    blocTest<ForgotPasswordCubit, ForgotPasswordState>(
      'emits loading and error when forgot password fails',
      build: () {
        when(
          () => authService.forgotPassword(email: 'john@example.com'),
        ).thenAnswer(
          (_) async => const Left<AppError, Unit>(AppError('Email not found')),
        );
        return ForgotPasswordCubit(authService: authService);
      },
      seed: () => const ForgotPasswordState(email: 'john@example.com'),
      act: (ForgotPasswordCubit cubit) => cubit.forgotPassword(),
      expect: () => <ForgotPasswordState>[
        const ForgotPasswordState(
          viewState: ViewState.loading,
          email: 'john@example.com',
        ),
        const ForgotPasswordState(
          viewState: ViewState.error,
          email: 'john@example.com',
          errorMessage: 'Email not found',
        ),
      ],
    );

    blocTest<ForgotPasswordCubit, ForgotPasswordState>(
      'updates forgot password email field',
      build: () => ForgotPasswordCubit(authService: authService),
      act: (ForgotPasswordCubit cubit) =>
          cubit.emailChanged('john@example.com'),
      expect: () => <ForgotPasswordState>[
        const ForgotPasswordState(email: 'john@example.com'),
      ],
    );

    blocTest<ForgotPasswordCubit, ForgotPasswordState>(
      'resets error message',
      build: () => ForgotPasswordCubit(authService: authService),
      seed: () => const ForgotPasswordState(
        viewState: ViewState.error,
        errorMessage: 'Email not found',
      ),
      act: (ForgotPasswordCubit cubit) => cubit.resetErrorMessage(),
      expect: () => <ForgotPasswordState>[const ForgotPasswordState()],
    );
  });

  group('ResetPasswordCubit', () {
    blocTest<ResetPasswordCubit, ResetPasswordState>(
      'emits loading and loaded when reset password succeeds',
      build: () {
        when(
          () => authService.resetPassword(
            userId: 'user-id',
            resetToken: 'reset-token',
            newPassword: 'NewPass123!',
            confirmPassword: 'NewPass123!',
          ),
        ).thenAnswer((_) async => const Right<AppError, Unit>(unit));
        return ResetPasswordCubit(authService: authService);
      },
      seed: () => const ResetPasswordState(
        password: 'NewPass123!',
        confirmPassword: 'NewPass123!',
      ),
      act: (ResetPasswordCubit cubit) =>
          cubit.resetPassword(userId: 'user-id', resetToken: 'reset-token'),
      expect: () => <ResetPasswordState>[
        const ResetPasswordState(
          viewState: ViewState.loading,
          password: 'NewPass123!',
          confirmPassword: 'NewPass123!',
        ),
        const ResetPasswordState(
          viewState: ViewState.loaded,
          password: 'NewPass123!',
          confirmPassword: 'NewPass123!',
        ),
      ],
    );

    blocTest<ResetPasswordCubit, ResetPasswordState>(
      'emits loading and error when reset password fails',
      build: () {
        when(
          () => authService.resetPassword(
            userId: 'user-id',
            resetToken: 'reset-token',
            newPassword: 'NewPass123!',
            confirmPassword: 'DifferentPass123!',
          ),
        ).thenAnswer(
          (_) async =>
              const Left<AppError, Unit>(AppError('Passwords do not match')),
        );
        return ResetPasswordCubit(authService: authService);
      },
      seed: () => const ResetPasswordState(
        password: 'NewPass123!',
        confirmPassword: 'DifferentPass123!',
      ),
      act: (ResetPasswordCubit cubit) =>
          cubit.resetPassword(userId: 'user-id', resetToken: 'reset-token'),
      expect: () => <ResetPasswordState>[
        const ResetPasswordState(
          viewState: ViewState.loading,
          password: 'NewPass123!',
          confirmPassword: 'DifferentPass123!',
        ),
        const ResetPasswordState(
          viewState: ViewState.error,
          password: 'NewPass123!',
          confirmPassword: 'DifferentPass123!',
          errorMessage: 'Passwords do not match',
        ),
      ],
    );

    blocTest<ResetPasswordCubit, ResetPasswordState>(
      'updates reset password form fields',
      build: () => ResetPasswordCubit(authService: authService),
      act: (ResetPasswordCubit cubit) {
        cubit.passwordChanged('NewPass123!');
        cubit.confirmPasswordChanged('NewPass123!');
      },
      expect: () => <ResetPasswordState>[
        const ResetPasswordState(password: 'NewPass123!'),
        const ResetPasswordState(
          password: 'NewPass123!',
          confirmPassword: 'NewPass123!',
        ),
      ],
    );

    blocTest<ResetPasswordCubit, ResetPasswordState>(
      'resets error message',
      build: () => ResetPasswordCubit(authService: authService),
      seed: () => const ResetPasswordState(
        viewState: ViewState.error,
        errorMessage: 'Passwords do not match',
      ),
      act: (ResetPasswordCubit cubit) => cubit.resetErrorMessage(),
      expect: () => <ResetPasswordState>[const ResetPasswordState()],
    );
  });

  group('GetUserCubit', () {
    blocTest<GetUserCubit, GetUserState>(
      'emits loading and loaded when get user succeeds',
      build: () {
        when(
          () => authService.getUser(),
        ).thenAnswer((_) async => const Right<AppError, User>(user));
        return GetUserCubit(authService: authService);
      },
      act: (GetUserCubit cubit) => cubit.getUser(),
      expect: () => <GetUserState>[
        const GetUserState(viewState: ViewState.loading),
        const GetUserState(viewState: ViewState.loaded, user: user),
      ],
    );

    blocTest<GetUserCubit, GetUserState>(
      'emits loading and error when get user fails',
      build: () {
        when(() => authService.getUser()).thenAnswer(
          (_) async => const Left<AppError, User>(AppError('Unauthorized')),
        );
        return GetUserCubit(authService: authService);
      },
      act: (GetUserCubit cubit) => cubit.getUser(),
      expect: () => <GetUserState>[
        const GetUserState(viewState: ViewState.loading),
        const GetUserState(
          viewState: ViewState.error,
          errorMessage: 'Unauthorized',
        ),
      ],
    );

    blocTest<GetUserCubit, GetUserState>(
      'resets error message',
      build: () => GetUserCubit(authService: authService),
      seed: () => const GetUserState(
        viewState: ViewState.error,
        errorMessage: 'Unauthorized',
      ),
      act: (GetUserCubit cubit) => cubit.resetErrorMessage(),
      expect: () => <GetUserState>[const GetUserState()],
    );
  });
}
