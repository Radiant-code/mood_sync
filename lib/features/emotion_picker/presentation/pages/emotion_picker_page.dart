import 'package:flutter/material.dart';
import 'package:mood_sync/core/theme/app_colors.dart';
import 'package:mood_sync/widgets/mood_sync_nav_bar.dart';
import 'package:mood_sync/widgets/mood_sync_header.dart';
import 'dart:math' as Math;

class EmotionPickerPage extends StatefulWidget {
  const EmotionPickerPage({super.key});

  @override
  State<EmotionPickerPage> createState() => _EmotionPickerPageState();
}

class _EmotionPickerPageState extends State<EmotionPickerPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const double pickerSize = 240;

    const double appBarHeight = kToolbarHeight + 70;
    const double bottomNavBarHeight = 70;
    final double availableHeight =
        screenHeight - appBarHeight - bottomNavBarHeight;

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
      body: InteractiveViewer(
        constrained: false,
        boundaryMargin: EdgeInsets.zero,
        minScale: 1.0,
        maxScale: 1.0,
        child: SizedBox(
          width: screenWidth * 2,
          height: availableHeight * 2,
          child: Stack(
            children: [
              // Position the emotion picker at the center of the canvas
              Positioned(
                left: screenWidth - pickerSize / 2,
                top: availableHeight - pickerSize / 2,
                child: SizedBox(
                  width: pickerSize,
                  height: pickerSize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Center glow bubble
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

                      // 6 outer bubbles
                      ...List.generate(6, (i) {
                        final double angle = i * 60 * Math.pi / 180;
                        const double r = 80;
                        final double x = r * Math.cos(angle);
                        final double y = r * Math.sin(angle);
                        return Positioned(
                          left: 120 + x - 40,
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
            ],
          ),
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
