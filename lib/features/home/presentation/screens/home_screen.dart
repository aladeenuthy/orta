import 'package:orta/features/features.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<_PlaceholderTab> _placeholderTabs = <_PlaceholderTab>[
    _PlaceholderTab(icon: CupertinoIcons.chart_pie, label: 'Market'),
    _PlaceholderTab(icon: Icons.chat_bubble_outline, label: 'Chat'),
    _PlaceholderTab(icon: Icons.calendar_today_outlined, label: 'Shift'),
    _PlaceholderTab(icon: Icons.settings_outlined, label: 'Setting'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          const _DashboardHomeBody(),
          ..._placeholderTabs.map(
            (_PlaceholderTab tab) => _EmptyDashboardTab(tab: tab),
          ),
        ],
      ),
    );
  }
}

class _DashboardHomeBody extends StatefulWidget {
  const _DashboardHomeBody();

  @override
  State<_DashboardHomeBody> createState() => _DashboardHomeBodyState();
}

class _DashboardHomeBodyState extends State<_DashboardHomeBody> {
  final GlobalKey<DashboardShiftSectionState> _ongoingSectionKey =
      GlobalKey<DashboardShiftSectionState>();
  final GlobalKey<DashboardShiftSectionState> _assignedSectionKey =
      GlobalKey<DashboardShiftSectionState>();

  Future<void> _refreshDashboard() async {
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
        onRefresh: _refreshDashboard,
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
                    size: 34.0.radius,
                  ),
                  AppSpacings.horizontal(18),
                  CircleAvatar(
                    radius: 22.0.radius,
                    backgroundColor: AppColors.primaryLight,
                    child: Icon(
                      Icons.person,
                      color: AppColors.primary,
                      size: 24.0.radius,
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
                  sortOrder: ShiftSortOrder.desc,
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
                  sortOrder: ShiftSortOrder.desc,
                ),
                showOngoingChip: false,
                showActions: true,
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

class _PlaceholderTab {
  const _PlaceholderTab({required this.icon, required this.label});

  final IconData icon;
  final String label;
}
