import 'package:orta/features/features.dart';

class ProfileSkillsScreen extends StatefulWidget {
  const ProfileSkillsScreen({super.key, this.args = const ProfileFlowArgs()});

  final ProfileFlowArgs args;

  @override
  State<ProfileSkillsScreen> createState() => _ProfileSkillsScreenState();
}

class _ProfileSkillsScreenState extends State<ProfileSkillsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _skillController;
  late final FocusNode _skillFocusNode;

  @override
  void initState() {
    super.initState();
    if (widget.args.editMode && widget.args.profile != null) {
      context.read<ProfileOnboardingCubit>().initializeForEdit(
        widget.args.profile!,
      );
    }
    final ProfileOnboardingState state = context
        .read<ProfileOnboardingCubit>()
        .state;
    _skillController = TextEditingController(text: state.skillInput);
    _skillFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _skillController.dispose();
    _skillFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileOnboardingCubit, ProfileOnboardingState>(
      listenWhen:
          (ProfileOnboardingState previous, ProfileOnboardingState current) =>
              previous.skillInput != current.skillInput ||
              previous.viewState != current.viewState ||
              previous.savedStep != current.savedStep,
      listener: (BuildContext context, ProfileOnboardingState state) {
        if (state.skillInput.isEmpty && _skillController.text.isNotEmpty) {
          _skillController.clear();
        }
        if (state.isError && state.errorMessage != null) {
          AppSnacks.error(context, state.errorMessage!);
        }
        if (state.isLoaded && state.savedStep == ProfileOnboardingStep.skills) {
          if (widget.args.editMode) {
            AppSnacks.success(context, 'Skills updated');
            AppRouter.back();
            return;
          }
          AppRouter.toCloseAllNamed(AppRoutes.home);
        }
      },
      builder: (BuildContext context, ProfileOnboardingState state) {
        final bool canAddSkill = state.canAddSkill;

        return AppLoadingOverlay(
          loading: state.isLoading,
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: const OnboardingAppBar(title: 'Skill'),
            body: SafeArea(
              child: Padding(
                padding: AppPaddings.horizontal(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppSpacings.vertical(50),
                      _SkillInputField(
                        controller: _skillController,
                        focusNode: _skillFocusNode,
                      ),
                      AppSpacings.vertical(22),
                      AppButton(
                        enabled: canAddSkill,
                        color: canAddSkill
                            ? AppColors.primary
                            : AppColors.ongoingChipBg,
                        textColor: canAddSkill
                            ? AppColors.white
                            : AppColors.textSecondary,
                        height: 42,
                        borderRadius: BorderRadius.circular(8.0.radius),
                        margin: EdgeInsets.zero,
                        onPressed: canAddSkill
                            ? () {
                                context
                                    .read<ProfileOnboardingCubit>()
                                    .addSkill();
                                _skillFocusNode.requestFocus();
                              }
                            : null,
                        child: Text(
                          'Add Skill',
                          style: context.text.titleMedium?.copyWith(
                            color: canAddSkill
                                ? AppColors.white
                                : AppColors.textSecondary,
                            fontSize: 18.0.fontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      AppSpacings.vertical(22),
                      Divider(color: AppColors.fieldBorder),
                      AppSpacings.vertical(16),
                      _SkillChips(skills: state.skills),
                      const Spacer(),
                      if (!widget.args.editMode)
                        const StepDots(activeIndex: 1, count: 2),
                      AppSpacings.vertical(24),
                      AppButton(
                        color: AppColors.primary,
                        height: 42,
                        borderRadius: BorderRadius.circular(10.0.radius),
                        margin: EdgeInsets.zero,
                        onPressed: context
                            .read<ProfileOnboardingCubit>()
                            .saveSkills,
                        child: Text(
                          widget.args.editMode ? 'Save' : 'Continue',
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
}

class _SkillInputField extends StatelessWidget {
  const _SkillInputField({required this.controller, required this.focusNode});

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Skill',
          style: context.text.titleMedium?.copyWith(
            color: AppColors.textColor.withValues(alpha: .84),
            fontSize: 14.5.fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        AppSpacings.vertical(10),
        AppTextField(
          controller: controller,
          focusNode: focusNode,
          hintText: 'Type a skill....',
          textInputAction: TextInputAction.done,
          validate: (String? value) => null,
          onChanged: context.read<ProfileOnboardingCubit>().skillChanged,
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

class _SkillChips extends StatelessWidget {
  const _SkillChips({required this.skills});

  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    final List<String> displaySkills = skills.isEmpty ? <String>[] : skills;

    return Wrap(
      spacing: 10.0.width,
      runSpacing: 12.0.height,
      children: displaySkills.map((String skill) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.0.width,
            vertical: 8.0.height,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(4.0.radius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                skill,
                style: context.text.bodyMedium?.copyWith(
                  color: AppColors.white,
                  fontSize: 13.0.fontSize,
                ),
              ),
              AppSpacings.horizontal(8),
              GestureDetector(
                onTap: () =>
                    context.read<ProfileOnboardingCubit>().removeSkill(skill),
                child: Icon(
                  Icons.cancel_outlined,
                  color: AppColors.white,
                  size: 17.0.radius,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
