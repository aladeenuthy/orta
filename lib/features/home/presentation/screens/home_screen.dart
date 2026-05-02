import 'package:orta/features/features.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<ShiftActionsCubit>(
          create: (_) => locator<ShiftActionsCubit>(),
        ),
        BlocProvider<ProfileCubit>(create: (_) => locator<ProfileCubit>()),
      ],
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  int _selectedIndex = 0;
  final GlobalKey<_DashboardHomeBodyState> _dashboardKey =
      GlobalKey<_DashboardHomeBodyState>();

  static const List<_PlaceholderTab> _placeholderTabs = <_PlaceholderTab>[
    _PlaceholderTab(icon: Icons.chat_bubble_outline, label: 'Chat'),
    _PlaceholderTab(icon: Icons.calendar_today_outlined, label: 'Shift'),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshAccessState();
    });
  }

  Future<void> _refreshAccessState() async {
    await context.read<AuthCubit>().refreshCurrentUser();
    if (!mounted) return;

    final AuthState authState = context.read<AuthCubit>().state;
    if (_DashboardAccessGate.openForOtpState(authState)) return;

    await _loadProfileIfNeeded(authState);
  }

  Future<void> _loadProfileIfNeeded(AuthState authState) async {
    if (!authState.isAuthenticated) return;

    final ProfileState profileState = context.read<ProfileCubit>().state;
    if (!profileState.isInitial) return;

    await context.read<ProfileCubit>().loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: <BlocListener<dynamic, dynamic>>[
        BlocListener<AuthCubit, AuthState>(
          listener: (BuildContext context, AuthState authState) {
            if (authState.isError && authState.errorMessage != null) {
              AppSnacks.error(context, authState.errorMessage!);
            }

            if (authState.isUnauthenticated) {
              AppRouter.toCloseAllNamed(AppRoutes.login);
              return;
            }

            final bool opened = _DashboardAccessGate.openForOtpState(authState);
            if (!opened && authState.isAuthenticated) {
              _loadProfileIfNeeded(authState);
            }
          },
        ),
        BlocListener<ProfileCubit, ProfileState>(
          listener: (BuildContext context, ProfileState profileState) {
            if (profileState.isError && profileState.errorMessage != null) {
              AppSnacks.error(context, profileState.errorMessage!);
            }

            _DashboardAccessGate.openForProfileState(
              authState: context.read<AuthCubit>().state,
              profileState: profileState,
            );
          },
        ),
      ],
      child: BlocConsumer<ShiftActionsCubit, ShiftActionsState>(
        listener: _listenForShiftActions,
        builder: _buildDashboard,
      ),
    );
  }

  void _listenForShiftActions(BuildContext context, ShiftActionsState state) {
    if (state.isError && state.errorMessage != null) {
      AppSnacks.error(context, state.errorMessage!);
    }

    if (state.isLoaded) {
      AppSnacks.success(context, _ShiftActionMessage.from(state.action));
      _dashboardKey.currentState?.refreshDashboard();
    }
  }

  Widget _buildDashboard(BuildContext context, ShiftActionsState state) {
    final bool profileLoading = context.select<ProfileCubit, bool>(
      (ProfileCubit cubit) => cubit.state.isLoading,
    );

    return AppLoadingOverlay(
      loading: state.isLoading || profileLoading,
      child: Scaffold(
        backgroundColor: AppColors.white,
        bottomNavigationBar: DashboardBottomNav(
          selectedIndex: _selectedIndex,
          onItemSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            _DashboardHomeBody(key: _dashboardKey),
            const MarketplaceScreen(),
            ..._placeholderTabs.map(
              (_PlaceholderTab tab) => _EmptyDashboardTab(tab: tab),
            ),
            const _SettingsTab(),
          ],
        ),
      ),
    );
  }
}

class _DashboardAccessGate {
  const _DashboardAccessGate._();

  static bool openForOtpState(AuthState state) {
    final User? user = state.user;
    if (state.requiresEmailVerification && user != null) {
      AppRouter.toCloseAllNamed(
        AppRoutes.otpVerification,
        arguments: OtpVerificationArgs(
          email: user.email,
          successRoute: AppRoutes.home,
          preventBack: true,
          autoSendOtp: true,
        ),
      );
      return true;
    }

    return false;
  }

  static bool openForProfileState({
    required AuthState authState,
    required ProfileState profileState,
  }) {
    if (authState.requiresEmailVerification || !authState.isAuthenticated) {
      return false;
    }

    final Profile? profile = profileState.profile;
    if (profileState.isLoading || profile == null) return false;

    if (!profile.isProfileComplete) {
      AppRouter.toCloseAllNamed(AppRoutes.profileIntro);
      return true;
    }

    return false;
  }
}

class _ShiftActionMessage {
  const _ShiftActionMessage._();

  static String from(ShiftAction? action) {
    return switch (action) {
      ShiftAction.cancel => 'Shift rejected',
      ShiftAction.clockIn => 'Clocked in successfully',
      ShiftAction.clockOut => 'Clocked out successfully',
      null => 'Shift updated',
    };
  }
}

class _DashboardShiftAction {
  const _DashboardShiftAction._();

  static void accept(BuildContext context, Shift shift) {
    AppRouter.toNamed(
      AppRoutes.shiftDetail,
      arguments: ShiftDetailArgs(shiftId: shift.id),
    );
  }

  static void reject(BuildContext context, Shift shift) {
    context.read<ShiftActionsCubit>().cancelShift(shift.id);
  }
}

class _DashboardHomeBody extends StatefulWidget {
  const _DashboardHomeBody({super.key});

  @override
  State<_DashboardHomeBody> createState() => _DashboardHomeBodyState();
}

class _DashboardHomeBodyState extends State<_DashboardHomeBody> {
  final GlobalKey<DashboardShiftSectionState> _ongoingSectionKey =
      GlobalKey<DashboardShiftSectionState>();
  final GlobalKey<DashboardShiftSectionState> _assignedSectionKey =
      GlobalKey<DashboardShiftSectionState>();

  Future<void> refreshDashboard() async {
    await Future.wait(<Future<void>>[
      _ongoingSectionKey.currentState?.refresh() ?? Future<void>.value(),
      _assignedSectionKey.currentState?.refresh() ?? Future<void>.value(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final String firstName = context.select<AuthCubit, String>((
      AuthCubit cubit,
    ) {
      final String? name = cubit.state.user?.name;
      if (name == null || name.trim().isEmpty) {
        return '---';
      }
      return name.trim().split(' ').first;
    });

    return SafeArea(
      child: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: refreshDashboard,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          padding: EdgeInsets.fromLTRB(
            16.0.width,
            40.0.height,
            16.0.width,
            18.0.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hello $firstName 👋',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.displayLarge?.copyWith(
                            color: AppColors.textColor.withValues(alpha: .87),
                            fontSize: 23.0.fontSize,
                            fontWeight: FontWeight.w700,
                            height: 1.12,
                          ),
                        ),
                        AppSpacings.vertical(4),
                        Text(
                          'Welcome back!',
                          style: context.text.headlineMedium?.copyWith(
                            color: AppColors.textColor.withValues(alpha: .86),
                            fontSize: 17.0.fontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    CupertinoIcons.bell,
                    color: AppColors.textColor,
                    size: 30.0.radius,
                  ),
                  AppSpacings.horizontal(18),
                  GestureDetector(
                    onTap: () => AppRouter.toNamed(AppRoutes.profile),
                    child: CircleAvatar(
                      radius: 20.0.radius,
                      backgroundColor: AppColors.primaryLight,
                      child: Icon(
                        Icons.person,
                        color: AppColors.primary,
                        size: 20.0.radius,
                      ),
                    ),
                  ),
                ],
              ),
              AppSpacings.vertical(50),
              DashboardShiftSection(
                key: _ongoingSectionKey,
                title: 'Ongoing shift',
                filters: const ShiftFilters(
                  status: ShiftStatusFilter.inProgress,
                  sortBy: ShiftSortBy.date,
                  sortOrder: ShiftSortOrder.asc,
                ),
                showOngoingChip: true,
                showActions: false,
              ),
              AppSpacings.vertical(23),
              DashboardShiftSection(
                key: _assignedSectionKey,
                title: 'Assigned shift',
                filters: const ShiftFilters(
                  status: ShiftStatusFilter.scheduled,
                  sortBy: ShiftSortBy.date,
                  sortOrder: ShiftSortOrder.asc,
                ),
                showOngoingChip: false,
                showActions: true,
                onAcceptShift: (Shift shift) =>
                    _DashboardShiftAction.accept(context, shift),
                onRejectShift: (Shift shift) =>
                    _DashboardShiftAction.reject(context, shift),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyDashboardTab extends StatelessWidget {
  const _EmptyDashboardTab({required this.tab});

  final _PlaceholderTab tab;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(tab.icon, color: AppColors.primary, size: 56.0.radius),
            AppSpacings.vertical(12),
            Text(
              tab.label,
              style: context.text.headlineMedium?.copyWith(
                color: AppColors.textColor,
                fontSize: 22.0.fontSize,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsTab extends StatelessWidget {
  const _SettingsTab();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppPaddings.horizontal(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.settings_outlined,
                color: AppColors.primary,
                size: 56.0.radius,
              ),
              AppSpacings.vertical(12),
              Text(
                'Setting',
                style: context.text.headlineMedium?.copyWith(
                  color: AppColors.textColor,
                  fontSize: 22.0.fontSize,
                  fontWeight: FontWeight.w800,
                ),
              ),
              AppSpacings.vertical(28),
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
        ),
      ),
    );
  }
}

class _PlaceholderTab {
  const _PlaceholderTab({required this.icon, required this.label});

  final IconData icon;
  final String label;
}
