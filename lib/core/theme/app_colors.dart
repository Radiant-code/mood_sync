import 'package:flutter/material.dart';

/// Central color definitions for Mood Sync app.
/// Reference these in all widgets for consistency.
class AppColors {
  // Base Palette
  static const Color background = Color(0xFF121212); // Deep neutral base
  static const Color surface = Color(0xFF1C1C1E); // Cards, panels, overlays
  static const Color textPrimary = Color(0xFFFAFAFA); // Crisp white text
  static const Color textSecondary =
      Color(0xFFA1A1AA); // For descriptions and metadata
  static const Color divider = Color(0xFF2C2C2E); // Soft, subtle lines

  // Core Accent Styling – Neon Vibe
  static const Color neonPurple =
      Color(0xFFBB86FC); // Main brand accent, buttons, icons
  static const Color neonYellow = Color(0xFFFCE83A); // Highlights, focus rings
  static const Color neonPink =
      Color(0xFFFF85B3); // Secondary CTA, friendly touches
  static const Color electricBlue =
      Color(0xFF56CFFF); // Navigation, interactive hovers
  static const Color signalGreen =
      Color(0xFF6CF4A1); // Confirm states, small indicators

  // Additional
  static const Color unselected = Color(0xFFA1A1AA); // Unselected nav/icon

  // Aliases for migration and gradients
  static const Color purple = neonPurple; // For legacy code
  static const Color pink = neonPink; // For legacy code
  static const Color dark = background; // For legacy code
  static const Color fabGradientEnd = neonPink; // For FAB gradients
  static const Color selected = neonPurple; // For selected nav/icon

  // New colors for the Current State card
  static const Color stateContent =
      Color(0xFF4ADE80); // Soft green for 'Content' state (emoji bg)
  static const Color progressBarBg =
      Color(0xFF232325); // Subtle dark for progress bar background
  static const Color progressBarFg =
      Color(0xFF6CF4A1); // Neon green for progress bar foreground
}
