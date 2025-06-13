import 'package:flutter/material.dart';
import '../../data/emotion_wheel_data.dart';

class EmotionBubble extends StatefulWidget {
  final Emotion emotion;
  final VoidCallback onTap;

  const EmotionBubble({
    Key? key,
    required this.emotion,
    required this.onTap,
  }) : super(key: key);

  @override
  State<EmotionBubble> createState() => _EmotionBubbleState();
}

class _EmotionBubbleState extends State<EmotionBubble> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.emotion.color,
              width: 2,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: widget.emotion.color.withOpacity(0.25),
                      blurRadius: 15,
                      spreadRadius: 2,
                    )
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              widget.emotion.name,
              style: TextStyle(
                color: widget.emotion.color,
                fontSize: widget.emotion.name.length > 8 ? 10 : 12,
                fontWeight: FontWeight.w600,
                height: widget.emotion.name.length > 8 ? 1.1 : 1.2,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
