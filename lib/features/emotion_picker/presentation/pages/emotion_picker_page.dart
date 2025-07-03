import 'package:flutter/material.dart';
import 'package:mood_sync/core/theme/app_colors.dart';
import 'package:mood_sync/widgets/mood_sync_nav_bar.dart';
import 'package:mood_sync/widgets/mood_sync_header.dart';
import 'dart:math' as Math;

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
                child: SizedBox(
                  width: 240, // enough for 2 rings of 80 radius
                  height: 240,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Central circle with icon
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
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
                          size: 40,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      // 6 surrounding circles
                      ...List.generate(6, (i) {
                        final double angle = i * 60 * Math.pi / 180;
                        const double r = 80; // distance from center
                        final double x = r * Math.cos(angle);
                        final double y = r * Math.sin(angle);
                        return Positioned(
                          left: 120 + x - 40, // center + offset - radius
                          top: 120 + y - 40,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.neonPurple.withOpacity(0.3),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black12),
                            ),
                          ),
                        );
                      }),
                    ],
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
        currentIndex: -1, // Assuming emotion picker is tab 1
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
