import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../data/emotion_data.dart';
import '../../../../models/emotion.dart';
import '../widgets/center_glow_button.dart';
import '../widgets/emotion_bubble.dart';

class EmotionPickerPage extends StatelessWidget {
  const EmotionPickerPage({super.key});

  static const double _bubbleSize = 150.0;
  static const double _bubbleGap = 4.0;
  static const double _centerButtonSize = 100.0;

  int _ringForIntensity(int intensity) {
    if (intensity >= 5) return 1;
    if (intensity == 4) return 2;
    if (intensity == 3) return 3;
    if (intensity == 2) return 4;
    return 5;
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
    final sectors = mockEmotions.map((e) => e.sector).toSet().toList()..sort();
    const ringCount = 5;

    // Organize emotions by sector and ring
    final Map<String, Map<int, List<Emotion>>> data = {};
    for (final e in mockEmotions) {
      final ring = _ringForIntensity(e.intensity);
      data.putIfAbsent(e.sector, () => <int, List<Emotion>>{});
      data[e.sector]!.putIfAbsent(ring, () => <Emotion>[]);
      data[e.sector]![ring]!.add(e);
    }

    final double wedge = 2 * pi / sectors.length;

    // Determine radius for each ring so bubbles don't overlap
    final List<double> radii = List.filled(ringCount + 1, 0);
    double prevRadius = _centerButtonSize / 2;
    for (var ring = 1; ring <= ringCount; ring++) {
      var maxCount = 0;
      for (final sector in sectors) {
        maxCount = max(maxCount, data[sector]?[ring]?.length ?? 0);
      }
      final double angleBased = (maxCount * (_bubbleSize + _bubbleGap)) / wedge;
      final double needed = prevRadius + _bubbleSize + _bubbleGap;
      final radius = max(angleBased, needed);
      radii[ring] = radius;
      prevRadius = radius;
    }

    final double mapRadius = radii[ringCount] + _bubbleSize;
    final widgets = <Widget>[];

    for (var sIndex = 0; sIndex < sectors.length; sIndex++) {
      final sector = sectors[sIndex];
      final startAngle = wedge * sIndex;

      for (var ring = 1; ring <= ringCount; ring++) {
        final ringEmotions = data[sector]?[ring] ?? const <Emotion>[];
        final count = ringEmotions.length;
        if (count == 0) continue;
        final step = wedge / count;
        for (var i = 0; i < count; i++) {
          final emotion = ringEmotions[i];
          final angle = startAngle + step * (i + 0.5);
          final radius = radii[ring];
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
              size: _bubbleSize,
              onTap: () => _showEmotion(context, emotion),
            ),
          ));
        }
      }
    }

    widgets.add(Positioned(
      left: mapRadius - _centerButtonSize / 2,
      top: mapRadius - _centerButtonSize / 2,
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
