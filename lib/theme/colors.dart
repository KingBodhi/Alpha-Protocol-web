import 'package:flutter/material.dart';

/// Alpha Protocol Design System - Colors
///
/// Brand-aligned color palette following PCG/DuckNet patterns.
/// Use these constants throughout the app for consistency.
class AppColors {
  AppColors._();

  // ============================================
  // BRAND COLORS
  // ============================================

  /// Primary brand gold - Use for CTAs, highlights, brand elements
  static const Color primary = Color(0xFFB4914C);

  /// Darker gold - Use for hover states, pressed states
  static const Color primaryDark = Color(0xFF8A6E3A);

  /// Lighter gold - Use for subtle highlights, backgrounds
  static const Color primaryLight = Color(0xFFD4B76A);

  /// Gold with transparency - Use for overlays, glows
  static const Color primaryOverlay = Color(0x33B4914C);

  // ============================================
  // LIGHT THEME COLORS
  // ============================================

  /// Light theme background
  static const Color lightBackground = Color(0xFFFFFFFF);

  /// Light theme surface (cards, containers)
  static const Color lightSurface = Color(0xFFF8F6F3);

  /// Light theme elevated surface
  static const Color lightSurfaceElevated = Color(0xFFFFFFFF);

  /// Light theme card background
  static const Color lightCard = Color(0xFFE8E4E4);

  /// Light theme primary text
  static const Color lightText = Color(0xFF1A1A1A);

  /// Light theme secondary text
  static const Color lightTextSecondary = Color(0xFF666666);

  /// Light theme muted text
  static const Color lightTextMuted = Color(0xFF999999);

  /// Light theme border
  static const Color lightBorder = Color(0xFFE0E0E0);

  /// Light theme divider
  static const Color lightDivider = Color(0xFFEEEEEE);

  // ============================================
  // DARK THEME COLORS
  // ============================================

  /// Dark theme background
  static const Color darkBackground = Color(0xFF000000);

  /// Dark theme surface (cards, containers)
  static const Color darkSurface = Color(0xFF0A0A0A);

  /// Dark theme elevated surface
  static const Color darkSurfaceElevated = Color(0xFF1A1A1A);

  /// Dark theme card background
  static const Color darkCard = Color(0xFF222121);

  /// Dark theme card with transparency
  static const Color darkCardTransparent = Color(0x79222121);

  /// Dark theme primary text
  static const Color darkText = Color(0xFFFFFFFF);

  /// Dark theme secondary text
  static const Color darkTextSecondary = Color(0xFFB3B3B3);

  /// Dark theme muted text
  static const Color darkTextMuted = Color(0xFF666666);

  /// Dark theme border
  static const Color darkBorder = Color(0xFF333333);

  /// Dark theme divider
  static const Color darkDivider = Color(0xFF2A2A2A);

  // ============================================
  // SEMANTIC COLORS
  // ============================================

  /// Success green
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF81C784);
  static const Color successDark = Color(0xFF388E3C);

  /// Error red
  static const Color error = Color(0xFFEF5350);
  static const Color errorLight = Color(0xFFE57373);
  static const Color errorDark = Color(0xFFD32F2F);

  /// Warning amber
  static const Color warning = Color(0xFFFFC107);
  static const Color warningLight = Color(0xFFFFD54F);
  static const Color warningDark = Color(0xFFFFA000);

  /// Info blue
  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFF64B5F6);
  static const Color infoDark = Color(0xFF1976D2);

  // ============================================
  // GRADIENTS
  // ============================================

  /// Primary brand gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLight, primary, primaryDark],
  );

  /// Dark overlay gradient (for images)
  static const LinearGradient darkOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Color(0xCC000000)],
  );

  /// Light overlay gradient (for images)
  static const LinearGradient lightOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Color(0xCCFFFFFF)],
  );

  /// Gold shimmer gradient (for premium elements)
  static const LinearGradient goldShimmer = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFD4B76A),
      Color(0xFFB4914C),
      Color(0xFFD4B76A),
      Color(0xFF8A6E3A),
    ],
    stops: [0.0, 0.3, 0.6, 1.0],
  );

  // ============================================
  // SHADOWS
  // ============================================

  /// Light theme shadow
  static List<BoxShadow> lightShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  /// Dark theme shadow (subtle glow)
  static List<BoxShadow> darkShadow = [
    BoxShadow(
      color: primary.withOpacity(0.1),
      blurRadius: 20,
      offset: const Offset(0, 4),
    ),
  ];

  /// Gold glow effect
  static List<BoxShadow> goldGlow = [
    BoxShadow(
      color: primary.withOpacity(0.3),
      blurRadius: 20,
      spreadRadius: 2,
    ),
  ];

  // ============================================
  // HELPER METHODS
  // ============================================

  /// Get text color based on theme
  static Color textColor(bool isDark) => isDark ? darkText : lightText;

  /// Get secondary text color based on theme
  static Color textSecondary(bool isDark) =>
      isDark ? darkTextSecondary : lightTextSecondary;

  /// Get background color based on theme
  static Color background(bool isDark) =>
      isDark ? darkBackground : lightBackground;

  /// Get surface color based on theme
  static Color surface(bool isDark) => isDark ? darkSurface : lightSurface;

  /// Get card color based on theme
  static Color card(bool isDark) => isDark ? darkCard : lightCard;

  /// Get border color based on theme
  static Color border(bool isDark) => isDark ? darkBorder : lightBorder;

  /// Get divider color based on theme
  static Color divider(bool isDark) => isDark ? darkDivider : lightDivider;

  /// Get shadow based on theme
  static List<BoxShadow> shadow(bool isDark) => isDark ? darkShadow : lightShadow;

  /// Get muted text color based on theme
  static Color textMuted(bool isDark) => isDark ? darkTextMuted : lightTextMuted;
}
