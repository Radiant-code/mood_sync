import 'package:flutter/material.dart';
import 'package:mood_sync/core/theme/app_colors.dart';
import 'package:mood_sync/widgets/mood_sync_nav_bar.dart';
import 'package:mood_sync/widgets/mood_sync_header.dart';
import 'dart:math' as Math;

class EmotionPickerPage extends StatelessWidget {
  const EmotionPickerPage({super.key});

  static const double pickerSize = 240;
  static const double circleSize = 80;
  static const double center = pickerSize / 2;

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
                  width: pickerSize,
                  height: pickerSize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _buildCenterCircle(),
                      ..._buildOuterRing(6, 80),
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

  Widget _buildCenterCircle() {
    return Container(
      width: circleSize,
      height: circleSize,
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
    );
  }

  List<Widget> _buildOuterRing(int count, double radius) {
    return List.generate(count, (i) {
      final angle = i * 2 * Math.pi / count;
      final x = radius * Math.cos(angle);
      final y = radius * Math.sin(angle);

      return Positioned(
        left: center + x - circleSize / 2,
        top: center + y - circleSize / 2,
        child: Container(
          width: circleSize,
          height: circleSize,
          decoration: BoxDecoration(
            color: AppColors.neonPurple.withOpacity(0.3),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black12),
          ),
        ),
      );
    });
  }
}
