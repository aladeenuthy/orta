import 'dart:io';

import 'package:orta/features/features.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileCubit _profileCubit;
  late final AvailabilityCubit _availabilityCubit;
  late final UnavailabilityCubit _unavailabilityCubit;

  @override
  void initState() {
    super.initState();
    _profileCubit = locator<ProfileCubit>()..loadProfile();
    _availabilityCubit = locator<AvailabilityCubit>()
      ..initialize(loadSavedTemplate: true);
    _unavailabilityCubit = locator<UnavailabilityCubit>()..load();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<ProfileCubit>(create: (_) => _profileCubit),
        BlocProvider<AvailabilityCubit>.value(value: _availabilityCubit),
        BlocProvider<UnavailabilityCubit>(create: (_) => _unavailabilityCubit),
      ],
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: const _ProfileAppBar(),
          body: AppLoadingOverlay(
            loading: state.isLoading || state.isInitial,
            child: Builder(
              builder: (context) {
                if (state.isLoading || state.isInitial) {
                  return const SizedBox.expand();
                }

                if (state.profile == null) {
                  return AppRetryWidget(
                    errorMessage:
                        state.errorMessage ?? 'Unable to load profile',
                    onRetry: context.read<ProfileCubit>().loadProfile,
                  );
                }
                return _ProfileBody(profile: state.profile!);
              },
            ),
          ),
        );
      },
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody({required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        18.0.width,
        34.0.height,
        18.0.width,
        34.0.height,
      ),
      child: Column(
        children: <Widget>[
          _ProfileAvatar(profile: profile),
          AppSpacings.vertical(26),
          _ProfileName(profile: profile),
          AppSpacings.vertical(14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on_outlined,
                color: AppColors.greyDark,
                size: 22.0.radius,
              ),
              AppSpacings.horizontal(8),
              Text(
                profile.city ?? '-- --',
                style: context.text.bodyLarge?.copyWith(
                  color: AppColors.greyDark,
                  fontSize: 16.0.fontSize,
                ),
              ),
            ],
          ),
          AppSpacings.vertical(22),
          Text(
            profile.jobRole ?? '-- --',
            style: context.text.titleLarge?.copyWith(
              color: AppColors.textColor,
              fontSize: 18.0.fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          AppSpacings.vertical(24),
          _AvailabilityProfileSection(profile: profile),
          const _UnavailabilityProfileSection(),
          _ProfileSection(
            title: 'Skill',
            body: _ProfileDisplay.list(profile.skills, bullet: '-'),
            onEdit: () => _ProfileNavigation.openAndRefresh(
              context,
              AppRoutes.profileSkills,
              arguments: ProfileFlowArgs(editMode: true, profile: profile),
            ),
          ),
          _ProfileSection(
            title: 'Certification',
            body: '- Forklift\n- Packing',
            onEdit: () {},
          ),
          AppSpacings.vertical(18),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (BuildContext context, AuthState state) {
              return AppButton(
                color: AppColors.primary,
                height: 42,
                borderRadius: BorderRadius.circular(8.0.radius),
                margin: EdgeInsets.zero,
                enabled: !state.isLoading,
                onPressed: context.read<AuthCubit>().logout,
                child: Text(
                  'Logout',
                  style: context.text.titleMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final String? path = profile.profilePictureUrl;
    return CircleAvatar(
      radius: 50.0.radius,
      backgroundColor: AppColors.primaryLight,
      backgroundImage:
          path != null && path.isNotEmpty && File(path).existsSync()
          ? FileImage(File(path))
          : null,
      child: path == null || path.isEmpty || !File(path).existsSync()
          ? Icon(Icons.person, color: AppColors.primary, size: 54.0.radius)
          : null,
    );
  }
}

class _ProfileName extends StatelessWidget {
  const _ProfileName({required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Text(
            profile.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.text.displayLarge?.copyWith(
              color: AppColors.textColor.withValues(alpha: .82),
              fontSize: 20.0.fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        AppSpacings.horizontal(12),
        GestureDetector(
          onTap: () =>
              AppRouter.toNamed(
                AppRoutes.profilePersonal,
                arguments: ProfileFlowArgs(editMode: true, profile: profile),
              ).then((_) {
                if (context.mounted) {
                  context.read<ProfileCubit>().loadProfile();
                }
              }),
          child: Icon(Icons.edit_outlined, size: 22.0.radius),
        ),
      ],
    );
  }
}

class _ProfileDisplay {
  const _ProfileDisplay._();

  static String list(
    List<String> items, {
    required String bullet,
    int maxItems = 3,
  }) {
    final List<String> visibleItems = items.take(maxItems).toList();
    final int remainingCount = items.length - visibleItems.length;
    final List<String> lines = visibleItems
        .map((String item) => '$bullet  $item')
        .toList();

    if (remainingCount > 0) {
      lines.add('+ $remainingCount more');
    }

    return lines.join('\n');
  }
}

class _AvailabilityProfileSection extends StatelessWidget {
  const _AvailabilityProfileSection({required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailabilityCubit, AvailabilityState>(
      builder: (BuildContext context, AvailabilityState state) {
        return _ProfileSection(
          icon: Icons.calendar_month_outlined,
          title: 'Availability',
          body: _AvailabilityDisplay.from(state),
          onEdit: () async {
            await AppRouter.toNamed(
              AppRoutes.availabilitySetting,
              arguments: ProfileFlowArgs(editMode: true, profile: profile),
            );
          },
        );
      },
    );
  }
}

class _AvailabilityDisplay {
  const _AvailabilityDisplay._();

  static String from(AvailabilityState state) {
    if (state.isLoading) return 'Loading availability...';
    if (state.isError) return 'Unable to load availability';

    final List<AvailabilityDay> availableDays = state.weeklySchedule
        .where((AvailabilityDay day) => day.isAvailable)
        .toList();
    if (availableDays.isEmpty) return 'No availability set';

    return _ProfileDisplay.list(
      availableDays
          .map(
            (AvailabilityDay day) =>
                '${DateUtils.shortWeekday(day.day)}: ${day.startTime}-${day.endTime}',
          )
          .toList(),
      bullet: '-',
    );
  }
}

class _UnavailabilityProfileSection extends StatelessWidget {
  const _UnavailabilityProfileSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnavailabilityCubit, UnavailabilityState>(
      builder: (BuildContext context, UnavailabilityState state) {
        return _ProfileSection(
          icon: Icons.error_outline,
          iconColor: AppColors.alert,
          title: 'Unavailable Dates',
          body: _UnavailabilityDisplay.from(state),
          onEdit: () async {
            await AppRouter.toNamed(
              AppRoutes.unavailability,
              arguments: UnavailabilityManagementArgs(
                cubit: context.read<UnavailabilityCubit>(),
              ),
            );
          },
        );
      },
    );
  }
}

class _UnavailabilityDisplay {
  const _UnavailabilityDisplay._();

  static String from(UnavailabilityState state) {
    if (state.isLoading) return 'Loading unavailable dates...';
    if (state.isError) return 'Unable to load unavailable dates';
    if (state.items.isEmpty) return 'No unavailable dates';

    return _ProfileDisplay.list(
      state.items
          .map(
            (UnavailabilityPeriod item) =>
                DateUtils.dateRange(item.startDate, item.endDate),
          )
          .toList(),
      bullet: '•',
    );
  }
}

class _ProfileNavigation {
  const _ProfileNavigation._();

  static Future<void> openAndRefresh(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) async {
    await AppRouter.toNamed(routeName, arguments: arguments);
    if (!context.mounted) return;
    await context.read<ProfileCubit>().loadProfile();
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({
    required this.title,
    required this.body,
    required this.onEdit,
    this.icon,
    this.iconColor,
  });

  final String title;
  final String body;
  final VoidCallback onEdit;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 18.0.height),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.cardBorder)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(
              icon,
              color: iconColor ?? AppColors.textColor,
              size: 24.0.radius,
            ),
            AppSpacings.horizontal(14),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: context.text.titleLarge?.copyWith(
                    color: AppColors.textColor.withValues(alpha: .84),
                    fontSize: 16.0.fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                AppSpacings.vertical(8),
                Text(
                  body,
                  style: context.text.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 16.0.fontSize,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onEdit,
            icon: Icon(Icons.edit_outlined, size: 22.0.radius),
          ),
        ],
      ),
    );
  }
}

class _ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ProfileAppBar();

  @override
  Size get preferredSize => Size.fromHeight(70.0.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.orange,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 70.0.height,
      leading: Center(
        child: GestureDetector(
          onTap: AppRouter.back,
          child: Container(
            width: 42.0.width,
            height: 42.0.width,
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withValues(alpha: .95),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.textColor,
              size: 22.0.radius,
            ),
          ),
        ),
      ),
      title: Text(
        'Profile',
        style: context.text.headlineMedium?.copyWith(
          color: AppColors.white,
          fontSize: 20.0.fontSize,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
