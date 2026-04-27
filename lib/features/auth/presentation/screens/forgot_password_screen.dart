import 'package:orta/features/features.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final ForgotPasswordCubit _cubit = context.read<ForgotPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (BuildContext context, ForgotPasswordState state) {
        if (state.isError && state.errorMessage != null) {
          AppSnacks.error(context, state.errorMessage!);
        }

        if (state.isLoaded) {
          AppSnacks.success(context, 'Password reset link sent.');
          AppRouter.toReplacementNamed(AppRoutes.login);
        }
      },
      builder: (BuildContext context, ForgotPasswordState state) {
        return AppLoadingOverlay(
          loading: state.isLoading,
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              top: false,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: AppAnimatedColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AuthHeader(
                        showBackButton: true,
                        onBackPressed: state.isLoading
                            ? null
                            : () =>
                                  AppRouter.toReplacementNamed(AppRoutes.login),
                      ),
                      Padding(
                        padding: AppPaddings.horizontal(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Forgot Password?',
                              style: context.text.displayLarge?.copyWith(
                                color: AppColors.textColor,
                                fontSize: 27.0.fontSize,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            AppSpacings.vertical(12),
                            Text(
                              'Enter your email to reset your password.',
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
                              onChanged: _cubit.emailChanged,
                            ),
                            AppSpacings.vertical(40),
                            AppButton(
                              color: AppColors.primary,
                              enabled: !state.isLoading,
                              height: 42,
                              borderRadius: BorderRadius.circular(10.0.radius),
                              margin: EdgeInsets.zero,
                              onPressed: _submit,
                              child: Text(
                                "Reset Password",
                                style: context.text.titleMedium?.copyWith(
                                  color: AppColors.white,
                                  fontSize: 16.0.fontSize,
                                  fontWeight: FontWeight.w800,
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

    _cubit.forgotPassword();
  }
}
