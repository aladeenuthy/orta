import 'package:orta/features/features.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final cubit = context.read<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state.isError && state.errorMessage != null) {
          AppSnacks.error(context, state.errorMessage!);
        }

        if (state.isLoaded) {
          AppSnacks.success(context, 'Login successful');
          AppRouter.toCloseAllNamed(AppRoutes.home);
        }
      },
      builder: (BuildContext context, LoginState state) {
        return AppLoadingOverlay(
          loading: state.isLoading,
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              top: false,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const AuthHeader(),
                      Padding(
                        padding: AppPaddings.horizontal(16),
                        child: AppAnimatedColumn(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Welcome Back!',
                              style: context.text.displayLarge?.copyWith(
                                color: AppColors.textColor,
                                fontSize: 27.0.fontSize,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            AppSpacings.vertical(12),
                            Text(
                              'Login to continue.',
                              style: context.text.bodyLarge?.copyWith(
                                color: AppColors.textSecondary,
                                fontSize: 18.0.fontSize,
                              ),
                            ),
                            AppSpacings.vertical(42),
                            AuthFormField(
                              label: 'Email Address',
                              hintText: 'Enter email Address',
                              initialValue: state.email,
                              inputType: TextInputType.emailAddress,
                              validate: Validator.emailValidator,
                              onChanged: cubit.emailChanged,
                            ),
                            AppSpacings.vertical(31),
                            AuthPasswordField(
                              label: 'Password',
                              hintText: 'Enter Password',
                              initialValue: state.password,
                              textInputAction: TextInputAction.done,
                              validate: (String? value) => Validator.emptyField(
                                value,
                                message: 'Enter password',
                              ),
                              onChanged: context
                                  .read<LoginCubit>()
                                  .passwordChanged,
                            ),
                            AppSpacings.vertical(8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: state.isLoading
                                    ? null
                                    : () => AppRouter.toNamed(
                                        AppRoutes.forgotPassword,
                                      ),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'Forgot Password?',
                                  style: context.text.bodyMedium?.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            AppSpacings.vertical(28),
                            AppButton(
                              color: AppColors.primary,
                              enabled: !state.isLoading,
                              height: 42,
                              borderRadius: BorderRadius.circular(10.0.radius),
                              margin: EdgeInsets.zero,
                              onPressed: _submit,
                              child: Text(
                                "Login",
                                style: context.text.titleMedium?.copyWith(
                                  color: AppColors.white,
                                  fontSize: 16.0.fontSize,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            AppSpacings.vertical(22),
                            Center(
                              child: TextButton(
                                onPressed: () => AppRouter.toReplacementNamed(
                                  AppRoutes.register,
                                ),
                                child: Text(
                                  'New here? Get Started',
                                  style: context.text.bodyMedium?.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _submit() {
    final FormState? form = _formKey.currentState;
    if (form == null || !form.validate()) {
      return;
    }

    context.read<LoginCubit>().login();
  }
}
