import 'package:orta/features/features.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.args});

  final ResetPasswordArgs args;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final ResetPasswordCubit _cubit = context.read<ResetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (BuildContext context, ResetPasswordState state) {
        if (state.isError && state.errorMessage != null) {
          AppSnacks.error(context, state.errorMessage!);
        }

        if (state.isLoaded) {
          AppSnacks.success(context, 'Password reset successful.');
          AppRouter.toReplacementNamed(AppRoutes.login);
        }
      },
      builder: (BuildContext context, ResetPasswordState state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: AppPaddings.horizontal(16),
                child: AppAnimatedColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AuthHeader(
                      showBackButton: true,
                      onBackPressed: state.isLoading
                          ? null
                          : () => AppRouter.toReplacementNamed(AppRoutes.login),
                    ),
                    Text(
                      'Reset Password',
                      style: context.text.displayLarge?.copyWith(
                        color: AppColors.textColor,
                        fontSize: 24.0.fontSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    AppSpacings.vertical(10),
                    Text(
                      'Create a new password for your account.',
                      style: context.text.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 16.0.fontSize,
                      ),
                    ),
                    AppSpacings.vertical(42),
                    AuthPasswordField(
                      label: 'Password',
                      hintText: 'Enter Password',
                      initialValue: state.password,
                      validate: Validator.password,
                      onChanged: _cubit.passwordChanged,
                    ),
                    AppSpacings.vertical(31),
                    AuthPasswordField(
                      label: 'Confirm Password',
                      hintText: 'Enter Password',
                      initialValue: state.confirmPassword,
                      textInputAction: TextInputAction.done,
                      validate: (String? value) =>
                          Validator.confrimPassword(value, state.password),
                      onChanged: _cubit.confirmPasswordChanged,
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

    _cubit.resetPassword(
      userId: widget.args.userId,
      resetToken: widget.args.resetToken,
    );
  }
}
