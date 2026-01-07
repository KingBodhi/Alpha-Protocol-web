import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

/// Alpha Protocol Design System - Typography
///
/// Consistent text styles using Cinzel font family.
/// Uses fixed pixel sizes that work well on both mobile and desktop.
class AppTypography {
  AppTypography._();

  // ============================================
  // FONT FAMILIES
  // ============================================

  /// Primary display font - elegant serif for headlines
  static String get fontFamily => GoogleFonts.cinzel().fontFamily!;

  /// Secondary font - for body text (more readable)
  static String get fontFamilyBody => GoogleFonts.inter().fontFamily!;

  // ============================================
  // DISPLAY STYLES (Hero, Page Titles)
  // ============================================

  /// Display Large - Hero headlines (48px desktop, 32px mobile)
  static TextStyle displayLarge({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 48,
    fontWeight: FontWeight.w900,
    letterSpacing: 2.0,
    height: 1.1,
    color: isDark ? AppColors.darkText : AppColors.lightText,
  );

  /// Display Medium - Section titles (36px desktop, 28px mobile)
  static TextStyle displayMedium({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    letterSpacing: 1.5,
    height: 1.2,
    color: isDark ? AppColors.darkText : AppColors.lightText,
  );

  /// Display Small - Subsection titles (28px desktop, 22px mobile)
  static TextStyle displaySmall({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.0,
    height: 1.2,
    color: isDark ? AppColors.darkText : AppColors.lightText,
  );

  // ============================================
  // HEADLINE STYLES
  // ============================================

  /// Headline Large (24px)
  static TextStyle headlineLarge({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    height: 1.3,
    color: isDark ? AppColors.darkText : AppColors.lightText,
  );

  /// Headline Medium (20px)
  static TextStyle headlineMedium({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 1.3,
    color: isDark ? AppColors.darkText : AppColors.lightText,
  );

  /// Headline Small (18px)
  static TextStyle headlineSmall({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
    height: 1.4,
    color: isDark ? AppColors.darkText : AppColors.lightText,
  );

  // ============================================
  // TITLE STYLES
  // ============================================

  /// Title Large - Card titles, dialog titles (18px)
  static TextStyle titleLarge({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.4,
    color: isDark ? AppColors.darkText : AppColors.lightText,
  );

  /// Title Medium (16px)
  static TextStyle titleMedium({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.4,
    color: isDark ? AppColors.darkText : AppColors.lightText,
  );

  /// Title Small (14px)
  static TextStyle titleSmall({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.4,
    color: isDark ? AppColors.darkText : AppColors.lightText,
  );

  // ============================================
  // BODY STYLES (Using Inter for readability)
  // ============================================

  /// Body Large (16px)
  static TextStyle bodyLarge({bool isDark = false}) => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    height: 1.6,
    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
  );

  /// Body Medium (14px)
  static TextStyle bodyMedium({bool isDark = false}) => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.6,
    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
  );

  /// Body Small (12px)
  static TextStyle bodySmall({bool isDark = false}) => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.5,
    color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
  );

  // ============================================
  // LABEL STYLES (Buttons, Tags, Chips)
  // ============================================

  /// Label Large - Primary buttons (14px)
  static TextStyle labelLarge({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
    height: 1.2,
    color: isDark ? AppColors.darkText : AppColors.lightText,
  );

  /// Label Medium - Secondary buttons (12px)
  static TextStyle labelMedium({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    height: 1.2,
    color: isDark ? AppColors.darkText : AppColors.lightText,
  );

  /// Label Small - Tags, chips, captions (10px)
  static TextStyle labelSmall({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.0,
    height: 1.2,
    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
  );

  // ============================================
  // SPECIAL STYLES
  // ============================================

  /// Brand accent text - Gold colored
  static TextStyle accent({double? fontSize}) => GoogleFonts.cinzel(
    fontSize: fontSize ?? 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.0,
    color: AppColors.primary,
  );

  /// Navigation text (13px)
  static TextStyle navigation({bool isDark = false, bool isActive = false}) =>
      GoogleFonts.cinzel(
    fontSize: 13,
    fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
    letterSpacing: 1.5,
    color: isActive
        ? AppColors.primary
        : (isDark ? AppColors.darkText : AppColors.lightText),
  );

  /// Button text with uppercase (14px)
  static TextStyle button({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.0,
    height: 1.2,
    color: isDark ? AppColors.darkText : AppColors.lightText,
  );

  /// Overline text (10px)
  static TextStyle overline({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 2.5,
    height: 1.4,
    color: AppColors.primary,
  );

  /// Quote/testimonial style (20px)
  static TextStyle quote({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    letterSpacing: 0.5,
    height: 1.6,
    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
  );

  /// Statistic/number display (32px)
  static TextStyle statistic({bool isDark = false}) => GoogleFonts.cinzel(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.0,
    color: AppColors.primary,
  );

  // ============================================
  // TEXT THEME FOR MATERIAL
  // ============================================

  /// Generate TextTheme for ThemeData
  static TextTheme textTheme({bool isDark = false}) => TextTheme(
    displayLarge: displayLarge(isDark: isDark),
    displayMedium: displayMedium(isDark: isDark),
    displaySmall: displaySmall(isDark: isDark),
    headlineLarge: headlineLarge(isDark: isDark),
    headlineMedium: headlineMedium(isDark: isDark),
    headlineSmall: headlineSmall(isDark: isDark),
    titleLarge: titleLarge(isDark: isDark),
    titleMedium: titleMedium(isDark: isDark),
    titleSmall: titleSmall(isDark: isDark),
    bodyLarge: bodyLarge(isDark: isDark),
    bodyMedium: bodyMedium(isDark: isDark),
    bodySmall: bodySmall(isDark: isDark),
    labelLarge: labelLarge(isDark: isDark),
    labelMedium: labelMedium(isDark: isDark),
    labelSmall: labelSmall(isDark: isDark),
  );
}
