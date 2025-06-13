import 'package:flutter/material.dart';
import '../widgets/emotion_wheel.dart';
import '../../data/emotion_wheel_data.dart';

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
    );
  }
}
