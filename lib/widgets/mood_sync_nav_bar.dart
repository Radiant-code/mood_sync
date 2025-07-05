import 'package:flutter/material.dart';
import 'package:mood_sync/core/theme/app_colors.dart';

class MoodSyncNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onFabPressed;

  const MoodSyncNavBar({
    super.key,
    this.currentIndex = 0,
    required this.onTabSelected,
    required this.onFabPressed,
  });

  @override
  Widget build(BuildContext context) {
    const backgroundColor = AppColors.background;
    const selectedColor = AppColors.selected;
    const unselectedColor = AppColors.unselected;
    const fabGradient = LinearGradient(
      colors: [AppColors.selected, AppColors.fabGradientEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return SizedBox(
      height: 86,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 70,
            decoration: const BoxDecoration(
              color: backgroundColor,
              border: Border(
                top: BorderSide(color: AppColors.divider, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavBarItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  selected: currentIndex == 0,
                  selectedColor: selectedColor,
                  unselectedColor: unselectedColor,
                  onTap: () => onTabSelected(0),
                ),
                _NavBarItem(
                  icon: Icons.bar_chart_rounded,
                  label: 'Insights',
                  selected: currentIndex == 1,
                  selectedColor: selectedColor,
                  unselectedColor: unselectedColor,
                  onTap: () => onTabSelected(1),
                ),
                const SizedBox(width: 56),
                _NavBarItem(
                  icon: Icons.calendar_today_rounded,
                  label: 'Calendar',
                  selected: currentIndex == 2,
                  selectedColor: selectedColor,
                  unselectedColor: unselectedColor,
                  onTap: () => onTabSelected(2),
                ),
                _NavBarItem(
                  icon: Icons.person_rounded,
                  label: 'Profile',
                  selected: currentIndex == 3,
                  selectedColor: selectedColor,
                  unselectedColor: unselectedColor,
                  onTap: () => onTabSelected(3),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 24,
            child: GestureDetector(
              onTap: onFabPressed,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: fabGradient,
                  boxShadow: [
                    BoxShadow(
                      color: selectedColor.withOpacity(0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final Color selectedColor;
  final Color unselectedColor;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: selected ? selectedColor : unselectedColor,
                size: 28,
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  color: selected ? selectedColor : unselectedColor,
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
