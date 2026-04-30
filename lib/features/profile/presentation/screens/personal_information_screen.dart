import 'dart:io';

import 'package:orta/features/features.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({
    super.key,
    this.args = const ProfileFlowArgs(),
  });

  final ProfileFlowArgs args;

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AppImagePicker _imagePicker = AppImagePicker();
  late final ProfileOnboardingCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ProfileOnboardingCubit>();
    if (widget.args.editMode && widget.args.profile != null) {
      cubit.initializeForEdit(widget.args.profile!);
    }
  }

  @override
  void dispose() {
    cubit.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileOnboardingCubit, ProfileOnboardingState>(
      listener: (BuildContext context, ProfileOnboardingState state) {
        if (state.isError && state.errorMessage != null) {
          AppSnacks.error(context, state.errorMessage!);
        }
        if (state.isLoaded &&
            state.savedStep == ProfileOnboardingStep.personal) {
          if (widget.args.editMode) {
            AppSnacks.success(context, 'Profile updated');
            AppRouter.back();
            return;
          }

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
              child: SingleChildScrollView(
                child: Padding(
                  padding: AppPaddings.horizontal(16),
                  child: Form(
                    key: _formKey,
                    child: AppAnimatedColumn(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AppSpacings.vertical(35),
                        _AvatarPicker(
                          imagePath: state.profilePicturePath,
                          initials: StringUtils.initials(
                            context.watch<AuthCubit>().state.user?.name,
                          ),
                          onTap: _pickProfilePicture,
                        ),
                        AppSpacings.vertical(50),
                        if (widget.args.editMode)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Full Name',
                                style: context.text.titleMedium?.copyWith(
                                  color: AppColors.textColor.withValues(
                                    alpha: .84,
                                  ),
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
                                      validate: (String? value) =>
                                          Validator.emptyField(
                                            value,
                                            message: 'Enter first name',
                                          ),
                                      onChanged: cubit.firstNameChanged,
                                      hasTextfieldLabel: false,
                                      borderRadius: BorderRadius.circular(
                                        10.0.radius,
                                      ),
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
                                      validate: (String? value) =>
                                          Validator.emptyField(
                                            value,
                                            message: 'Enter last name',
                                          ),
                                      onChanged: cubit.lastNameChanged,
                                      hasTextfieldLabel: false,
                                      borderRadius: BorderRadius.circular(
                                        10.0.radius,
                                      ),
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
                              AppSpacings.vertical(26),
                            ],
                          ),
                        _PhoneField(state: state),
                        AppSpacings.vertical(26),
                        OnboardingSelectField(
                          label: 'City',
                          value: state.city,
                          items: ProfileDefaults.cities,
                          onChanged: cubit.cityChanged,
                        ),
                        AppSpacings.vertical(26),
                        OnboardingSelectField(
                          label: 'Role',
                          value: state.jobRole,
                          items: ProfileDefaults.roles,
                          onChanged: cubit.jobRoleChanged,
                        ),
                        if (!widget.args.editMode) AppSpacings.vertical(26),
                        if (!widget.args.editMode)
                          const StepDots(activeIndex: 0, count: 2),
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
          ),
        );
      },
    );
  }

  void _submit() {
    final FormState? form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    final ProfileOnboardingCubit cubit = context.read<ProfileOnboardingCubit>();
    widget.args.editMode
        ? cubit.savePersonalInformationEdit()
        : cubit.completePersonalInformation();
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
  const _AvatarPicker({
    required this.imagePath,
    required this.initials,
    required this.onTap,
  });

  final String imagePath;
  final String initials;
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
                        initials,
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
