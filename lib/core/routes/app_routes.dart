import 'package:flutter/material.dart';
import 'package:mood_sync/features/emotion_picker/presentation/pages/emotion_picker_page.dart';

class AppRoutes {
  static const String emotionPicker = '/emotion-picker';

  static Map<String, WidgetBuilder> get routes => {
        emotionPicker: (context) => const EmotionPickerPage(),
      };
}
