import 'dart:io';

import 'package:orta/features/features.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AppImagePicker _imagePicker = AppImagePicker();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileOnboardingCubit, ProfileOnboardingState>(
      listener: (BuildContext context, ProfileOnboardingState state) {
        if (state.isError && state.errorMessage != null) {
          AppSnacks.error(context, state.errorMessage!);
        }
        if (state.isLoaded &&
            state.savedStep == ProfileOnboardingStep.personal) {
          AppRouter.toNamed(AppRoutes.profileSkills);
        }
      },
      builder: (BuildContext context, ProfileOnboardingState state) {
        return AppLoadingOverlay(
          loading: state.isLoading,
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: const OnboardingAppBar(title: 'Personal Information'),
            body: SafeArea(
              child: Padding(
                padding: AppPaddings.horizontal(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      AppSpacings.vertical(35),
                      _AvatarPicker(
                        imagePath: state.profilePicturePath,
                        onTap: _pickProfilePicture,
                      ),
                      AppSpacings.vertical(50),
                      _PhoneField(state: state),
                      AppSpacings.vertical(26),
                      OnboardingSelectField(
                        label: 'City',
                        value: state.city,
                        items: WorkerProfileDefaults.cities,
                        onChanged: context
                            .read<ProfileOnboardingCubit>()
                            .cityChanged,
                      ),
                      AppSpacings.vertical(26),
                      OnboardingSelectField(
                        label: 'Role',
                        value: state.jobRole,
                        items: WorkerProfileDefaults.roles,
                        onChanged: context
                            .read<ProfileOnboardingCubit>()
                            .jobRoleChanged,
                      ),
                      const Spacer(),
                      const StepDots(activeIndex: 0, count: 3),
                      AppSpacings.vertical(24),
                      AppButton(
                        color: AppColors.primary,
                        height: 42,
                        borderRadius: BorderRadius.circular(10.0.radius),
                        margin: EdgeInsets.zero,
                        onPressed: _submit,
                        child: Text(
                          'Continue',
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
            ),
          ),
        );
      },
    );
  }

  void _submit() {
    final FormState? form = _formKey.currentState;
    if (form == null || !form.validate()) return;
    context.read<ProfileOnboardingCubit>().savePersonalInformation();
  }

  Future<void> _pickProfilePicture() async {
    try {
      final String? imagePath = await _imagePicker.pickProfileImagePath();

      if (!mounted || imagePath == null) return;

      context.read<ProfileOnboardingCubit>().profilePictureChanged(imagePath);
    } catch (_) {
      if (!mounted) return;
      AppSnacks.error(context, 'Unable to pick image');
    }
  }
}

class _AvatarPicker extends StatelessWidget {
  const _AvatarPicker({required this.imagePath, required this.onTap});

  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool hasImage = imagePath.isNotEmpty;

    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              CircleAvatar(
                radius: 72.0.radius,
                backgroundColor: AppColors.avatarBlue,
                backgroundImage: hasImage ? FileImage(File(imagePath)) : null,
                child: hasImage
                    ? null
                    : Text(
                        'AA',
                        style: context.text.displayLarge?.copyWith(
                          color: AppColors.white,
                          fontSize: 50.0.fontSize,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
              ),
              CircleAvatar(
                radius: 18.0.radius,
                backgroundColor: AppColors.white,
                child: Icon(
                  Icons.edit,
                  color: AppColors.textColor,
                  size: 18.0.radius,
                ),
              ),
            ],
          ),
        ),
        AppSpacings.vertical(16),
        Text(
          hasImage ? 'Change Profile Pic' : 'Add Profile Pic',
          style: context.text.titleMedium?.copyWith(
            color: AppColors.textColor,
            fontSize: 16.0.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField({required this.state});

  final ProfileOnboardingState state;

  @override
  Widget build(BuildContext context) {
    final double fieldHeight = 48.0.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone Number',
          style: context.text.titleMedium?.copyWith(
            color: AppColors.textColor,
            fontSize: 15.0.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        AppSpacings.vertical(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: fieldHeight,
              width: 86.0.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.fieldBorder),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10.0.radius),
                ),
              ),
              child: Text('+44', style: context.text.titleMedium),
            ),
            Expanded(
              child: AppTextField(
                intiaVal: state.phone,

                hintText: 'Enter phone number',
                inputType: TextInputType.phone,
                validate: Validator.validatePhoneNumber,
                onChanged: context.read<ProfileOnboardingCubit>().phoneChanged,
                hasTextfieldLabel: false,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 18.0.width,
                  vertical: 13.0.height,
                ),
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(10.0.radius),
                ),
                borderColor: AppColors.fieldBorder,
                focusedBorderColor: AppColors.primary,
                enabledBorderWidth: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
