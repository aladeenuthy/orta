import 'package:orta/features/features.dart';

class DashboardBottomNav extends StatelessWidget {
  const DashboardBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(14.0.radius)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.textColor.withValues(alpha: .1),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(14.0.radius)),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemSelected,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.bottomNavInactive,
          selectedFontSize: 12.0.fontSize,
          unselectedFontSize: 12.0.fontSize,
          selectedLabelStyle: context.text.labelMedium?.copyWith(
            fontSize: 12.0.fontSize,
            fontWeight: FontWeight.w800,
          ),
          unselectedLabelStyle: context.text.labelMedium?.copyWith(
            fontSize: 12.0.fontSize,
            fontWeight: FontWeight.w600,
          ),
          iconSize: 27.0.radius,
          elevation: 0,
          items: _DashboardNavItem.items
              .map(
                (_DashboardNavItem item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.label,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _DashboardNavItem {
  const _DashboardNavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;

  static const List<_DashboardNavItem> items = <_DashboardNavItem>[
    _DashboardNavItem(icon: Icons.home_outlined, label: 'Home'),
    _DashboardNavItem(icon: CupertinoIcons.chart_pie, label: 'Market'),
    _DashboardNavItem(icon: Icons.chat_bubble_outline, label: 'Chat'),
    _DashboardNavItem(icon: Icons.calendar_today_outlined, label: 'Shift'),
    _DashboardNavItem(icon: Icons.settings_outlined, label: 'Setting'),
  ];
}
