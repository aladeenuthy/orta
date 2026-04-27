import 'package:orta/features/features.dart';

class AuthFormField extends StatelessWidget {
  const AuthFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.initialValue,
    this.obscureText = false,
    this.suffixIcon,
    this.inputType,
    this.textInputAction,
    this.validate,
    this.onChanged,
  });

  final String label;
  final String hintText;
  final String? initialValue;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validate;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: context.text.titleMedium?.copyWith(
            color: AppColors.textColor.withValues(alpha: .84),
            fontSize: 14.5.fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        AppSpacings.vertical(10),
        AppTextField(
          intiaVal: initialValue,
          hintText: hintText,
          obscureText: obscureText,
          suffixIcon: suffixIcon,
          inputType: inputType ?? TextInputType.text,
          textInputAction: textInputAction,
          validate: validate,
          onChanged: onChanged,
          hasTextfieldLabel: false,
          borderRadius: BorderRadius.circular(10.0.radius),
          borderColor: AppColors.fieldBorder,
          focusedBorderColor: AppColors.primary,
          enabledBorderWidth: 1,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.0.width,
            vertical: 11.0.height,
          ),
        ),
      ],
    );
  }
}

class AuthPasswordField extends StatelessWidget {
  const AuthPasswordField({
    super.key,
    required this.label,
    required this.hintText,
    this.initialValue,
    this.textInputAction,
    this.validate,
    this.onChanged,
  });

  final String label;
  final String hintText;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validate;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: context.text.titleMedium?.copyWith(
            color: AppColors.textColor.withValues(alpha: .84),
            fontSize: 14.5.fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        AppSpacings.vertical(10),
        AppTextField(
          intiaVal: initialValue,
          hintText: hintText,
          obscureText: true,
          textInputAction: textInputAction,
          validate: validate,
          onChanged: onChanged,
          hasTextfieldLabel: false,
          borderRadius: BorderRadius.circular(10.0.radius),
          borderColor: AppColors.fieldBorder,
          focusedBorderColor: AppColors.primary,
          enabledBorderWidth: 1,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.0.width,
            vertical: 11.0.height,
          ),
        ),
      ],
    );
  }
}
