import 'package:flutter/material.dart';
import 'package:mood_sync/core/theme/app_colors.dart';
import 'package:mood_sync/widgets/mood_sync_nav_bar.dart';
import 'package:mood_sync/widgets/mood_sync_header.dart';

class EmotionPickerPage extends StatelessWidget {
  const EmotionPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MoodSyncHeader(
        title: 'How are you feeling?',
        greeting: 'Quick Check-in',
        date: 'Today',
        onSettings: () {
          // TODO: Implement settings navigation
        },
        onNotification: () {
          // TODO: Implement notification navigation
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.neonPurple,
                        AppColors.neonPink,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.neonPurple.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.psychology,
                    size: 60,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
            // TODO: Add emotion grid/quadrant interface
            // TODO: Add intensity slider
            // TODO: Add tags input
            // TODO: Add save button
          ],
        ),
      ),
      bottomNavigationBar: MoodSyncNavBar(
        currentIndex: 1, // Assuming emotion picker is tab 1
        onTabSelected: (index) {
          // TODO: Handle tab navigation
        },
        onFabPressed: () {
          // TODO: Handle FAB action (quick mood entry)
        },
      ),
    );
  }
}
