import 'package:flutter/material.dart';
import '../../data/emotion_wheel_data.dart';
import 'emotion_bubble.dart';

class EmotionWheel extends StatefulWidget {
  final Function(Emotion) onEmotionSelected;

  const EmotionWheel({
    Key? key,
    required this.onEmotionSelected,
  }) : super(key: key);

  @override
  State<EmotionWheel> createState() => _EmotionWheelState();
}

class _EmotionWheelState extends State<EmotionWheel> {
  double scale = 1.7;
  Offset position = Offset.zero;
  bool isDragging = false;
  Offset dragStart = Offset.zero;
  final List<Emotion> emotions = [];

  double canvasSize = 1364;
  bool isFirstBuild = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeEmotions();
  }

  void _centerWheel() {
    final screenSize = MediaQuery.of(context).size;
    final screenCenter = Offset(screenSize.width / 2, screenSize.height / 2);

    setState(() {
      // With scale applied first, translation is also scaled
      // So we need to translate by the unscaled amount to center the wheel
      position = Offset(
        (screenCenter.dx - canvasSize / 2) / scale,
        (screenCenter.dy - canvasSize / 2) / scale - 120,
      );
    });
  }

  void _initializeEmotions() {
    emotions.clear();
    final centerX = canvasSize / 2;
    final centerY = canvasSize / 2;

    for (final data in emotionData) {
      final position = getPositionForRing(
        data['ring'] as int,
        data['position'] as int,
        emotionsPerRing[data['ring'] as int],
        centerX,
        centerY,
      );

      emotions.add(Emotion(
        id: '${data['sector']}_${data['name']}',
        name: data['name'] as String,
        sector: data['sector'] as String,
        color: sectorColors[data['sector'] as String]!,
        background: sectorColors[data['sector'] as String]!,
        textColor: Colors.white,
        x: position.dx,
        y: position.dy,
        definition: '',
        intensity: data['ring'] as int,
      ));
    }

    // Center the wheel immediately after emotions are initialized
    if (isFirstBuild && emotions.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _centerWheel();
      });
    }
  }

  void _handleDragStart(DragStartDetails details) {
    isDragging = true;
    dragStart = details.localPosition;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (!isDragging) return;
    setState(() {
      position += details.delta;
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    isDragging = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDragStart,
      onPanUpdate: _handleDragUpdate,
      onPanEnd: _handleDragEnd,
      child: OverflowBox(
        maxWidth: double.infinity,
        maxHeight: double.infinity,
        child: Transform(
          transform: Matrix4.identity()
            ..scale(scale)
            ..translate(position.dx, position.dy),
          child: Center(
            child: SizedBox(
              width: canvasSize,
              height: canvasSize,
              child: Stack(
                children: [
                  // Wheel background
                  Positioned.fill(
                    child: CustomPaint(
                      painter: WheelGuidelinesPainter(),
                    ),
                  ),

                  // Center icon
                  Positioned(
                    left: canvasSize / 2 - 48,
                    top: canvasSize / 2 - 48,
                    child: Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFBB86FC), Color(0xFFFF85B3)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        size: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Emotion bubbles
                  ...emotions.map((emotion) => Positioned(
                        left: emotion.x - 32,
                        top: emotion.y - 32,
                        child: EmotionBubble(
                          emotion: emotion,
                          onTap: () => widget.onEmotionSelected(emotion),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WheelGuidelinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    for (final radius in ringRadii) {
      if (radius == 0) continue;
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = const Color(0xFF2C2C2E).withOpacity(0.2)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
