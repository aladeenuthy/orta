import 'package:orta/features/features.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final cubit = context.read<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (BuildContext context, RegisterState state) {
        if (state.isError && state.errorMessage != null) {
          AppSnacks.error(context, state.errorMessage!);
        }

        if (state.isLoaded) {
          AppRouter.toReplacementNamed(
            AppRoutes.otpVerification,
            arguments: OtpVerificationArgs(email: state.email.trim()),
          );
        }
      },
      builder: (BuildContext context, RegisterState state) {
        return AppLoadingOverlay(
          loading: state.isLoading,
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: AppPaddings.horizontal(16),
                  child: AppAnimatedColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AuthHeader(),
                      Text(
                        'Get Started!',
                        style: context.text.displayLarge?.copyWith(
                          color: AppColors.textColor,
                          fontSize: 24.0.fontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      AppSpacings.vertical(10),
                      Text(
                        'Sign up to get started.',
                        style: context.text.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 16.0.fontSize,
                        ),
                      ),
                      AppSpacings.vertical(30),
                      Text(
                        'Full Name',
                        style: context.text.titleMedium?.copyWith(
                          color: AppColors.textColor.withValues(alpha: .84),
                          fontSize: 14.5.fontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      AppSpacings.vertical(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: AppTextField(
                              intiaVal: state.firstName,
                              hintText: 'First Name',
                              validate: (String? value) => Validator.emptyField(
                                value,
                                message: 'Enter first name',
                              ),
                              onChanged: cubit.firstNameChanged,
                              hasTextfieldLabel: false,
                              borderRadius: BorderRadius.circular(10.0.radius),
                              borderColor: AppColors.fieldBorder,
                              focusedBorderColor: AppColors.primary,
                              enabledBorderWidth: 1,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0.width,
                                vertical: 11.0.height,
                              ),
                            ),
                          ),
                          AppSpacings.horizontal(20),
                          Expanded(
                            child: AppTextField(
                              intiaVal: state.lastName,
                              hintText: 'Last Name',
                              validate: (String? value) => Validator.emptyField(
                                value,
                                message: 'Enter last name',
                              ),
                              onChanged: cubit.lastNameChanged,
                              hasTextfieldLabel: false,
                              borderRadius: BorderRadius.circular(10.0.radius),
                              borderColor: AppColors.fieldBorder,
                              focusedBorderColor: AppColors.primary,
                              enabledBorderWidth: 1,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0.width,
                                vertical: 11.0.height,
                              ),
                            ),
                          ),
                        ],
                      ),
                      AppSpacings.vertical(31),
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
                        validate: Validator.password,
                        onChanged: cubit.passwordChanged,
                      ),
                      AppSpacings.vertical(31),
                      AuthPasswordField(
                        label: 'Confirm Password',
                        hintText: 'Enter Password',
                        initialValue: state.confirmPassword,
                        textInputAction: TextInputAction.done,
                        validate: (String? value) =>
                            Validator.confrimPassword(value, state.password),
                        onChanged: cubit.confirmPasswordChanged,
                      ),
                      AppSpacings.vertical(34),
                      AppButton(
                        color: AppColors.primary,
                        enabled: !state.isLoading,
                        height: 42,
                        borderRadius: BorderRadius.circular(10.0.radius),
                        margin: EdgeInsets.zero,
                        onPressed: _submit,
                        child: Text(
                          "Register",
                          style: context.text.titleMedium?.copyWith(
                            color: AppColors.white,
                            fontSize: 16.0.fontSize,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      AppSpacings.vertical(12),
                      Center(
                        child: TextButton(
                          onPressed: () =>
                              AppRouter.toReplacementNamed(AppRoutes.login),
                          child: Text(
                            'Already have an account? Login',
                            style: context.text.bodyMedium?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      AppSpacings.vertical(22),
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

    context.read<RegisterCubit>().register();
  }
}
