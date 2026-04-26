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
      act: (LoginCubit cubit) =>
          cubit.login(email: 'john@example.com', password: 'StrongPass123!'),
      expect: () => <LoginState>[
        const LoginState(viewState: ViewState.loading),
        const LoginState(viewState: ViewState.loaded, session: session),
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
      act: (LoginCubit cubit) =>
          cubit.login(email: 'john@example.com', password: 'StrongPass123!'),
      expect: () => <LoginState>[
        const LoginState(viewState: ViewState.loading),
        const LoginState(
          viewState: ViewState.error,
          errorMessage: 'Invalid login',
        ),
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
      act: (RegisterCubit cubit) => cubit.register(
        name: 'Test Doe',
        email: 'Test@example.com',
        password: 'Marine345@',
      ),
      expect: () => <RegisterState>[
        const RegisterState(viewState: ViewState.loading),
        const RegisterState(viewState: ViewState.loaded),
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
      act: (RegisterCubit cubit) => cubit.register(
        name: 'Test Doe',
        email: 'Test@example.com',
        password: 'Marine345@',
      ),
      expect: () => <RegisterState>[
        const RegisterState(viewState: ViewState.loading),
        const RegisterState(
          viewState: ViewState.error,
          errorMessage: 'Email exists',
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
      act: (ForgotPasswordCubit cubit) =>
          cubit.forgotPassword(email: 'john@example.com'),
      expect: () => <ForgotPasswordState>[
        const ForgotPasswordState(viewState: ViewState.loading),
        const ForgotPasswordState(viewState: ViewState.loaded),
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
      act: (ForgotPasswordCubit cubit) =>
          cubit.forgotPassword(email: 'john@example.com'),
      expect: () => <ForgotPasswordState>[
        const ForgotPasswordState(viewState: ViewState.loading),
        const ForgotPasswordState(
          viewState: ViewState.error,
          errorMessage: 'Email not found',
        ),
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
      act: (ResetPasswordCubit cubit) => cubit.resetPassword(
        userId: 'user-id',
        resetToken: 'reset-token',
        newPassword: 'NewPass123!',
        confirmPassword: 'NewPass123!',
      ),
      expect: () => <ResetPasswordState>[
        const ResetPasswordState(viewState: ViewState.loading),
        const ResetPasswordState(viewState: ViewState.loaded),
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
      act: (ResetPasswordCubit cubit) => cubit.resetPassword(
        userId: 'user-id',
        resetToken: 'reset-token',
        newPassword: 'NewPass123!',
        confirmPassword: 'DifferentPass123!',
      ),
      expect: () => <ResetPasswordState>[
        const ResetPasswordState(viewState: ViewState.loading),
        const ResetPasswordState(
          viewState: ViewState.error,
          errorMessage: 'Passwords do not match',
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
