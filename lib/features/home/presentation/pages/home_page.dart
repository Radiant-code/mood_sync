import 'package:flutter/material.dart';
import 'package:mood_sync/core/theme/app_colors.dart';
import 'package:mood_sync/widgets/mood_sync_nav_bar.dart';
import 'package:mood_sync/widgets/mood_sync_header.dart';
import '../widgets/reflection_prompt_card.dart';
import '../widgets/current_state_card.dart';
import '../widgets/gentle_insight_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MoodSyncHeader(
        title: 'Mood Sync',
        greeting: 'Hi, Rayaan!',
        date: 'Wednesday, Jun 11',
        onSettings: () {
          // TODO: Implement settings navigation
        },
        onNotification: () {
          // TODO: Implement notification navigation
        },
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ReflectionPromptCard(),
            CurrentStateCard(
              stateName: 'Content',
              subtitle: 'Feeling balanced',
              timeAgo: '2h ago',
              progress: 0.7,
              supportingText:
                  "You've been maintaining a steady emotional state today",
            ),
            GentleInsightCard(
              insightText:
                  'Your mood tends to lift in the afternoons.\nConsider scheduling meaningful activities during this time.',
              patternColors: [
                AppColors.progressContent,
                AppColors.progressContent,
                AppColors.progressContent,
                AppColors.progressContent,
                AppColors.progressContent,
                AppColors.progressBarBg,
                AppColors.progressBarBg,
              ],
            ),
            // TODO: Add other homepage cards below
          ],
        ),
      ),
      bottomNavigationBar: MoodSyncNavBar(
        currentIndex: 0,
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
