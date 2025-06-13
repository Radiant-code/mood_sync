import 'package:flutter/material.dart';
import 'package:mood_sync/widgets/mood_sync_nav_bar.dart';
import '../widgets/emotion_wheel.dart';

class EmotionPickerPage extends StatelessWidget {
  const EmotionPickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Stack(
          children: [
            // Emotion wheel
            EmotionWheel(
              onEmotionSelected: (emotion) {
                // TODO: Handle emotion selection
                print('Selected emotion: ${emotion.name}');
              },
            ),
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
