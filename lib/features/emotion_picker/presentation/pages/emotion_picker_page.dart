import 'package:flutter/material.dart';
import 'package:mood_sync/core/theme/app_colors.dart';
import 'package:mood_sync/widgets/mood_sync_nav_bar.dart';
import 'package:mood_sync/widgets/mood_sync_header.dart';
import 'dart:math' as math;

class EmotionPickerPage extends StatelessWidget {
  const EmotionPickerPage({super.key});

  static const double circleSize = 120;

  static double pickerSizeForRings(int rings, double circleSize) {
    return circleSize * (2 * rings + 1);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    const int rings = 4;
    final double pickerSize = pickerSizeForRings(rings, circleSize);
    final double center = pickerSize / 2;

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
        scaleEnabled: false,
        boundaryMargin: EdgeInsets.only(
          left: screenWidth * 0.2,
          right: screenWidth * 0.2,
        ),
        minScale: 1.0,
        maxScale: 1.0,
        child: SizedBox(
          width: pickerSize,
          height: pickerSize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ..._buildHexPackedCircles(rings, circleSize, center),
              Align(
                alignment: Alignment.center,
                child: _buildCenterCircle(),
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

  List<Offset> _generateHexPackedCenters(int rings, double diameter) {
    final List<Offset> centers = [];
    final double radius = diameter / 2;
    final double dx = diameter;
    final double dy = math.sqrt(3) * radius;

    centers.add(const Offset(0, 0));

    for (int r = 1; r <= rings; r++) {
      for (int side = 0; side < 6; side++) {
        double angle = math.pi / 3 * side;
        double startX = r * dx * math.cos(angle);
        double startY = r * dx * math.sin(angle);

        double stepAngle = angle + math.pi / 3;
        double stepX = dx * math.cos(stepAngle);
        double stepY = dx * math.sin(stepAngle);

        for (int i = 0; i < r; i++) {
          double x = startX - i * stepX;
          double y = startY - i * stepY;
          centers.add(Offset(x, y));
        }
      }
    }
    return centers;
  }

  List<Widget> _buildHexPackedCircles(
      int rings, double circleSize, double center) {
    final centers = _generateHexPackedCenters(rings, circleSize);
    return centers.map((offset) {
      return Positioned(
        left: center + offset.dx - circleSize / 2,
        top: center + offset.dy - circleSize / 2,
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
    }).toList();
  }
}
