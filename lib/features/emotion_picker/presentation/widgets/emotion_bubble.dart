import 'package:flutter/material.dart';
import '../../../../models/emotion.dart';

class EmotionBubble extends StatelessWidget {
  final Emotion emotion;
  final Color color;
  final double size;
  final VoidCallback onTap;
  const EmotionBubble({
    Key? key,
    required this.emotion,
    required this.color,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            emotion.name,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
