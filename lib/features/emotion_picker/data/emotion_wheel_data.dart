import 'dart:math';

import 'package:flutter/material.dart';

class Emotion {
  final String id;
  final String name;
  final String sector;
  final Color color;
  final Color background;
  final Color textColor;
  final double x;
  final double y;
  final String definition;
  final int? intensity;
  final List<String>? tags;

  const Emotion({
    required this.id,
    required this.name,
    required this.sector,
    required this.color,
    required this.background,
    required this.textColor,
    required this.x,
    required this.y,
    required this.definition,
    this.intensity,
    this.tags,
  });
}

// Define ring radii with increasing spacing for outer rings
const List<double> ringRadii = [0, 100, 180, 260, 340];

// Define how many emotions per ring
const List<int> emotionsPerRing = [0, 8, 16, 24, 32];

// Color coding system for sectors
const Map<String, Color> sectorColors = {
  'joy': Color(0xFFFCD34D), // Yellow
  'trust': Color(0xFF10B981), // Green
  'fear': Color(0xFF0F766E), // Teal
  'surprise': Color(0xFF3B82F6), // Blue
  'sadness': Color(0xFF8B5CF6), // Purple
  'disgust': Color(0xFFEC4899), // Pink
  'anger': Color(0xFFEF4444), // Red
  'anticipation': Color(0xFFF97316), // Orange
};

// Calculate position for an emotion based on its ring and position
Offset getPositionForRing(
    int ring, int position, int totalInRing, double centerX, double centerY) {
  // Ring 0 is empty (for app logo)
  if (ring == 0) {
    return Offset(centerX, centerY);
  }

  final radius = ringRadii[ring];
  final sectorSize = (2 * pi) / 8; // 8 sectors
  final sectorIndex = (position / (totalInRing / 8)).floor();
  final positionInSector = position % (totalInRing / 8);
  final emotionsInSector = totalInRing / 8;

  // Calculate angle within the sector
  final angleInSector =
      (positionInSector + 0.5) * (sectorSize / emotionsInSector);
  // Calculate the full angle (sector start + position within sector)
  final angle = sectorIndex * sectorSize +
      angleInSector -
      pi / 2; // Start at top (12 o'clock)

  return Offset(
    centerX + radius * cos(angle),
    centerY + radius * sin(angle),
  );
}

// Emotion data with intensities - organized by sector
final List<Map<String, dynamic>> emotionData = [
  // Ring 1 - Primary emotions (8) - one for each sector
  {'name': 'Joy', 'sector': 'joy', 'ring': 1, 'position': 0},
  {'name': 'Trust', 'sector': 'trust', 'ring': 1, 'position': 1},
  {'name': 'Fear', 'sector': 'fear', 'ring': 1, 'position': 2},
  {'name': 'Surprise', 'sector': 'surprise', 'ring': 1, 'position': 3},
  {'name': 'Sadness', 'sector': 'sadness', 'ring': 1, 'position': 4},
  {'name': 'Disgust', 'sector': 'disgust', 'ring': 1, 'position': 5},
  {'name': 'Anger', 'sector': 'anger', 'ring': 1, 'position': 6},
  {'name': 'Anticipation', 'sector': 'anticipation', 'ring': 1, 'position': 7},

  // Ring 2 - Secondary emotions (16) - two for each sector
  {'name': 'Ecstasy', 'sector': 'joy', 'ring': 2, 'position': 0},
  {'name': 'Bliss', 'sector': 'joy', 'ring': 2, 'position': 1},
  {'name': 'Love', 'sector': 'trust', 'ring': 2, 'position': 2},
  {'name': 'Compassion', 'sector': 'trust', 'ring': 2, 'position': 3},
  {'name': 'Terror', 'sector': 'fear', 'ring': 2, 'position': 4},
  {'name': 'Panic', 'sector': 'fear', 'ring': 2, 'position': 5},
  {'name': 'Amazement', 'sector': 'surprise', 'ring': 2, 'position': 6},
  {'name': 'Awestruck', 'sector': 'surprise', 'ring': 2, 'position': 7},
  {'name': 'Grief', 'sector': 'sadness', 'ring': 2, 'position': 8},
  {'name': 'Despair', 'sector': 'sadness', 'ring': 2, 'position': 9},
  {'name': 'Loathing', 'sector': 'disgust', 'ring': 2, 'position': 10},
  {'name': 'Repulsed', 'sector': 'disgust', 'ring': 2, 'position': 11},
  {'name': 'Rage', 'sector': 'anger', 'ring': 2, 'position': 12},
  {'name': 'Enraged', 'sector': 'anger', 'ring': 2, 'position': 13},
  {'name': 'Vigilance', 'sector': 'anticipation', 'ring': 2, 'position': 14},
  {'name': 'Eager', 'sector': 'anticipation', 'ring': 2, 'position': 15},

  // Ring 3 - Tertiary emotions (24) - three for each sector
  {'name': 'Happy', 'sector': 'joy', 'ring': 3, 'position': 0},
  {'name': 'Excited', 'sector': 'joy', 'ring': 3, 'position': 1},
  {'name': 'Cheerful', 'sector': 'joy', 'ring': 3, 'position': 2},
  {'name': 'Warm', 'sector': 'trust', 'ring': 3, 'position': 3},
  {'name': 'Caring', 'sector': 'trust', 'ring': 3, 'position': 4},
  {'name': 'Empathy', 'sector': 'trust', 'ring': 3, 'position': 5},
  {'name': 'Scared', 'sector': 'fear', 'ring': 3, 'position': 6},
  {'name': 'Nervous', 'sector': 'fear', 'ring': 3, 'position': 7},
  {'name': 'Worried', 'sector': 'fear', 'ring': 3, 'position': 8},
  {'name': 'Curious', 'sector': 'surprise', 'ring': 3, 'position': 9},
  {'name': 'Intrigued', 'sector': 'surprise', 'ring': 3, 'position': 10},
  {'name': 'Fascinated', 'sector': 'surprise', 'ring': 3, 'position': 11},
  {'name': 'Lonely', 'sector': 'sadness', 'ring': 3, 'position': 12},
  {'name': 'Depressed', 'sector': 'sadness', 'ring': 3, 'position': 13},
  {'name': 'Gloomy', 'sector': 'sadness', 'ring': 3, 'position': 14},
  {'name': 'Shame', 'sector': 'disgust', 'ring': 3, 'position': 15},
  {'name': 'Guilty', 'sector': 'disgust', 'ring': 3, 'position': 16},
  {'name': 'Humiliated', 'sector': 'disgust', 'ring': 3, 'position': 17},
  {'name': 'Frustrated', 'sector': 'anger', 'ring': 3, 'position': 18},
  {'name': 'Hostile', 'sector': 'anger', 'ring': 3, 'position': 19},
  {'name': 'Resentful', 'sector': 'anger', 'ring': 3, 'position': 20},
  {'name': 'Hopeful', 'sector': 'anticipation', 'ring': 3, 'position': 21},
  {'name': 'Determined', 'sector': 'anticipation', 'ring': 3, 'position': 22},
  {'name': 'Focused', 'sector': 'anticipation', 'ring': 3, 'position': 23},

  // Ring 4 - Subtle emotions (32) - four for each sector
  {'name': 'Playful', 'sector': 'joy', 'ring': 4, 'position': 0},
  {'name': 'Vibrant', 'sector': 'joy', 'ring': 4, 'position': 1},
  {'name': 'Energized', 'sector': 'joy', 'ring': 4, 'position': 2},
  {'name': 'Serenity', 'sector': 'joy', 'ring': 4, 'position': 3},
  {'name': 'Safe', 'sector': 'trust', 'ring': 4, 'position': 4},
  {'name': 'Appreciative', 'sector': 'trust', 'ring': 4, 'position': 5},
  {'name': 'Nurturing', 'sector': 'trust', 'ring': 4, 'position': 6},
  {'name': 'Acceptance', 'sector': 'trust', 'ring': 4, 'position': 7},
  {'name': 'Uneasy', 'sector': 'fear', 'ring': 4, 'position': 8},
  {'name': 'Tense', 'sector': 'fear', 'ring': 4, 'position': 9},
  {'name': 'Hesitant', 'sector': 'fear', 'ring': 4, 'position': 10},
  {'name': 'Apprehension', 'sector': 'fear', 'ring': 4, 'position': 11},
  {'name': 'Alert', 'sector': 'surprise', 'ring': 4, 'position': 12},
  {'name': 'Engaged', 'sector': 'surprise', 'ring': 4, 'position': 13},
  {'name': 'Interested', 'sector': 'surprise', 'ring': 4, 'position': 14},
  {'name': 'Observant', 'sector': 'surprise', 'ring': 4, 'position': 15},
  {'name': 'Disappointed', 'sector': 'sadness', 'ring': 4, 'position': 16},
  {'name': 'Melancholy', 'sector': 'sadness', 'ring': 4, 'position': 17},
  {'name': 'Tearful', 'sector': 'sadness', 'ring': 4, 'position': 18},
  {'name': 'Forlorn', 'sector': 'sadness', 'ring': 4, 'position': 19},
  {'name': 'Embarrassed', 'sector': 'disgust', 'ring': 4, 'position': 20},
  {'name': 'Ashamed', 'sector': 'disgust', 'ring': 4, 'position': 21},
  {'name': 'Regret', 'sector': 'disgust', 'ring': 4, 'position': 22},
  {'name': 'Self-conscious', 'sector': 'disgust', 'ring': 4, 'position': 23},
  {'name': 'Irritated', 'sector': 'anger', 'ring': 4, 'position': 24},
  {'name': 'Agitated', 'sector': 'anger', 'ring': 4, 'position': 25},
  {'name': 'Grouchy', 'sector': 'anger', 'ring': 4, 'position': 26},
  {'name': 'Annoyance', 'sector': 'anger', 'ring': 4, 'position': 27},
  {'name': 'Ready', 'sector': 'anticipation', 'ring': 4, 'position': 28},
  {'name': 'Expectant', 'sector': 'anticipation', 'ring': 4, 'position': 29},
  {'name': 'Interest', 'sector': 'anticipation', 'ring': 4, 'position': 30},
  {'name': 'Restless', 'sector': 'anticipation', 'ring': 4, 'position': 31},
];
