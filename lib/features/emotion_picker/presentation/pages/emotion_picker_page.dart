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
  late ScrollController _horizontalController;
  late ScrollController _verticalController;

  @override
  void initState() {
    super.initState();
    _horizontalController = ScrollController();
    _verticalController = ScrollController();

    // Center the content after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _centerContent();
    });
  }

  void _centerContent() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final double visibleHeight = screenHeight;

    // Calculate the offset to center the content in the visible area
    final horizontalOffset = (screenWidth * 2 - screenWidth) / 2;
    final verticalOffset = (visibleHeight) / 2 - visibleHeight / 2;

    _horizontalController.jumpTo(horizontalOffset);
    _verticalController.jumpTo(verticalOffset);
  }

  @override
  void dispose() {
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final double visibleHeight = screenHeight;
    final double pickerSize = 240;

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          controller: _horizontalController,
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            controller: _verticalController,
            child: Container(
              width: screenWidth * 2,
              height: visibleHeight + pickerSize,
              child: Center(
                child: Container(
                  width: pickerSize,
                  height: pickerSize,
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
