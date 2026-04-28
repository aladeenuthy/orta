import 'package:flutter/services.dart';
import 'package:orta/features/features.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key, required this.args});

  final OtpVerificationArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpVerificationCubit, OtpVerificationState>(
      listener: (BuildContext context, OtpVerificationState state) {
        if (state.isError && state.errorMessage != null) {
          AppSnacks.error(context, state.errorMessage!);
        }
        if (state.isResent) {
          AppSnacks.success(context, 'OTP resent');
        }
        if (state.isLoaded) {
          AppRouter.toReplacementNamed(AppRoutes.profileIntro);
        }
      },
      builder: (BuildContext context, OtpVerificationState state) {
        return AppLoadingOverlay(
          loading: state.isLoading,
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              top: false,
              child: Column(
                children: <Widget>[
                  const AuthHeader(),
                  Expanded(
                    child: Padding(
                      padding: AppPaddings.horizontal(16),
                      child: AppAnimatedColumn(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Email verification code',
                            style: context.text.headlineMedium?.copyWith(
                              color: AppColors.textColor,
                              fontSize: 20.0.fontSize,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          AppSpacings.vertical(14),
                          _OtpSubtitle(email: args.email),
                          AppSpacings.vertical(50),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 183.0.width,
                            ),
                            child: _OtpInput(
                              value: state.otp,
                              onChanged: context
                                  .read<OtpVerificationCubit>()
                                  .otpChanged,
                            ),
                          ),
                          if (state.secondsRemaining > 0)
                            AppSpacings.vertical(48),
                          if (state.secondsRemaining > 0)
                            Center(
                              child: Text(
                                'Resend after ${state.secondsRemaining}s.',
                                style: context.text.bodyLarge?.copyWith(
                                  color: AppColors.textSecondary,
                                  fontSize: 14.0.fontSize,
                                ),
                              ),
                            ),
                          AppSpacings.vertical(22),
                          Center(
                            child: _ResendOtpText(
                              enabled: state.canResend,
                              onPressed: () => context
                                  .read<OtpVerificationCubit>()
                                  .resendOtp(args.email),
                            ),
                          ),
                          const Spacer(),
                          AppButton(
                            color: AppColors.primary,
                            enabled: state.canSubmit,
                            height: 42,
                            borderRadius: BorderRadius.circular(10.0.radius),
                            margin: EdgeInsets.zero,
                            onPressed: () => context
                                .read<OtpVerificationCubit>()
                                .verifyOtp(args.email),
                            child: Text(
                              'Confirm OTP',
                              style: context.text.titleMedium?.copyWith(
                                color: AppColors.white,
                                fontSize: 18.0.fontSize,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          AppSpacings.vertical(42),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _OtpSubtitle extends StatelessWidget {
  const _OtpSubtitle({required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.text.bodyLarge?.copyWith(
          color: AppColors.greyDark,
          fontSize: 14.0.fontSize,
          height: 1.3,
        ),
        children: <InlineSpan>[
          const TextSpan(text: 'Enter the 6-digit code we sent to '),
          TextSpan(
            text: email,
            style: TextStyle(color: AppColors.primary),
          ),
          const TextSpan(text: ' to verify your account.'),
        ],
      ),
    );
  }
}

class _OtpInput extends StatefulWidget {
  const _OtpInput({required this.value, required this.onChanged});

  final String value;
  final ValueChanged<String> onChanged;

  @override
  State<_OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<_OtpInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant _OtpInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      _controller.text = widget.value;
      _controller.selection = TextSelection.collapsed(
        offset: _controller.text.length,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      controller: _controller,
      length: 6,
      autoFocus: true,
      enableActiveFill: false,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      cursorColor: AppColors.primary,
      cursorHeight: 20.0.height,
      textStyle: context.text.headlineMedium?.copyWith(
        fontSize: 22.0.fontSize,
        fontWeight: FontWeight.w600,
        color: AppColors.textColor,
      ),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.underline,
        fieldHeight: 48.0.height,
        fieldWidth: 38.0.width,
        borderWidth: 1,
        activeBorderWidth: 1.4,
        selectedBorderWidth: 1.4,
        inactiveBorderWidth: 1,
        activeColor: AppColors.primary,
        selectedColor: AppColors.primary,
        inactiveColor: AppColors.fieldBorder,
      ),
      beforeTextPaste: (String? text) => text != null && text.length <= 6,
      onChanged: widget.onChanged,
    );
  }
}

class _ResendOtpText extends StatelessWidget {
  const _ResendOtpText({required this.enabled, required this.onPressed});

  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onPressed : null,
      child: RichText(
        text: TextSpan(
          style: context.text.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
            fontSize: 13.0.fontSize,
          ),
          children: <InlineSpan>[
            const TextSpan(text: "Have'nt receive code yet?  "),
            TextSpan(
              text: 'Resend code.',
              style: TextStyle(
                color: enabled ? AppColors.primary : AppColors.greyDark,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
