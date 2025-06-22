import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../data/emotion_data.dart';
import '../../../../models/emotion.dart';
import '../widgets/center_glow_button.dart';
import '../widgets/emotion_bubble.dart';

class EmotionPickerPage extends StatelessWidget {
  const EmotionPickerPage({super.key});

  static const double _ringSpacing = 120.0;
  static const double _bubbleSize = 60.0;

  int _ringForIntensity(int intensity) {
    if (intensity >= 5) return 1;
    if (intensity == 4) return 2;
    if (intensity == 3) return 3;
    return 4;
  }

  Color _colorForSector(String sector) {
    switch (sector) {
      case 'joy':
        return Colors.yellow.shade300;
      case 'trust':
        return Colors.green.shade300;
      case 'fear':
        return Colors.blue.shade300;
      case 'sadness':
        return Colors.indigo.shade300;
      case 'anger':
        return Colors.red.shade300;
      case 'surprise':
      default:
        return Colors.purple.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sectors = mockEmotions.map((e) => e.sector).toSet().toList();
    sectors.sort();
    const ringCount = 4;
    final double mapRadius = _ringSpacing * ringCount + 80;
    final widgets = <Widget>[];
    final wedge = 2 * pi / sectors.length;

    for (var sIndex = 0; sIndex < sectors.length; sIndex++) {
      final sector = sectors[sIndex];
      final startAngle = wedge * sIndex;

      for (var ring = 1; ring <= ringCount; ring++) {
        final ringEmotions = mockEmotions
            .where((e) => _ringForIntensity(e.intensity) == ring && e.sector == sector)
            .toList();
        final count = ringEmotions.length;
        for (var i = 0; i < count; i++) {
          final emotion = ringEmotions[i];
          final angle = startAngle + wedge * (i + 1) / (count + 1);
          final radius = _ringSpacing * ring;
          final offset = Offset(
            mapRadius + radius * cos(angle),
            mapRadius + radius * sin(angle),
          );
          widgets.add(Positioned(
            left: offset.dx - _bubbleSize / 2,
            top: offset.dy - _bubbleSize / 2,
            child: EmotionBubble(
              emotion: emotion,
              color: _colorForSector(emotion.sector),
              onTap: () => _showEmotion(context, emotion),
            ),
          ));
        }
      }
    }

    widgets.add(Positioned(
      left: mapRadius - 40,
      top: mapRadius - 40,
      child: CenterGlowButton(
        onTap: () {},
      ),
    ));

    return Scaffold(
      body: InteractiveViewer(
        panEnabled: true,
        scaleEnabled: false,
        boundaryMargin: const EdgeInsets.all(200),
        constrained: false,
        child: SizedBox(
          width: mapRadius * 2,
          height: mapRadius * 2,
          child: Stack(children: widgets),
        ),
      ),
    );
  }

  void _showEmotion(BuildContext context, Emotion emotion) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(emotion.name),
        content: Text(emotion.description),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          )
        ],
      ),
    );
  }
}
