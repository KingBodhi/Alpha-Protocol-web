import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'typography.dart';
import 'spacing.dart';

/// Alpha Protocol - Theme Configuration
///
/// Comprehensive Material3 theming with full component styling.
/// Uses the design system colors, typography, and spacing.
class AppTheme {
  AppTheme._();

  // ============================================
  // LIGHT THEME
  // ============================================

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // Colors
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      primaryContainer: AppColors.primaryLight,
      onPrimaryContainer: AppColors.primaryDark,
      secondary: AppColors.lightCard,
      onSecondary: AppColors.lightText,
      secondaryContainer: AppColors.lightSurface,
      onSecondaryContainer: AppColors.lightText,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightText,
      error: AppColors.error,
      onError: Colors.white,
      outline: AppColors.lightBorder,
      shadow: Colors.black12,
    ),

    scaffoldBackgroundColor: AppColors.lightBackground,
    canvasColor: AppColors.lightBackground,
    cardColor: AppColors.lightCard,
    dividerColor: AppColors.lightDivider,

    // Typography
    textTheme: AppTypography.textTheme(isDark: false),
    fontFamily: GoogleFonts.cinzel().fontFamily,

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.lightText,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleTextStyle: AppTypography.titleLarge(isDark: false),
      iconTheme: const IconThemeData(
        color: AppColors.lightText,
        size: AppSpacing.icon,
      ),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: AppSpacing.button,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusRound,
        ),
        textStyle: AppTypography.labelLarge(isDark: true),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.lightText,
        padding: AppSpacing.button,
        side: const BorderSide(color: AppColors.lightText, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusRound,
        ),
        textStyle: AppTypography.labelLarge(isDark: false),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        padding: AppSpacing.button,
        textStyle: AppTypography.labelMedium(isDark: false),
      ),
    ),

    // Input fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightSurface,
      border: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadius,
        borderSide: const BorderSide(color: AppColors.lightBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadius,
        borderSide: const BorderSide(color: AppColors.lightBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadius,
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadius,
        borderSide: const BorderSide(color: AppColors.error),
      ),
      contentPadding: AppSpacing.allMd,
      hintStyle: AppTypography.bodyMedium(isDark: false),
      labelStyle: AppTypography.labelMedium(isDark: false),
    ),

    // Cards
    cardTheme: CardThemeData(
      color: AppColors.lightCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.borderRadiusLg,
      ),
      margin: EdgeInsets.zero,
    ),

    // Divider
    dividerTheme: const DividerThemeData(
      color: AppColors.lightDivider,
      thickness: 1,
      space: AppSpacing.lg,
    ),

    // Icons
    iconTheme: const IconThemeData(
      color: AppColors.lightText,
      size: AppSpacing.icon,
    ),

    // Drawer
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.lightBackground,
      surfaceTintColor: Colors.transparent,
    ),

    // Bottom Sheet
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.lightBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
      ),
    ),

    // Dialog
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.lightBackground,
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.borderRadiusLg,
      ),
      titleTextStyle: AppTypography.headlineSmall(isDark: false),
      contentTextStyle: AppTypography.bodyMedium(isDark: false),
    ),

    // Chips
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.lightSurface,
      labelStyle: AppTypography.labelSmall(isDark: false),
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.borderRadiusFull,
      ),
      side: const BorderSide(color: AppColors.lightBorder),
    ),

    // Tooltip
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.lightText,
        borderRadius: AppSpacing.borderRadiusSm,
      ),
      textStyle: AppTypography.bodySmall(isDark: true),
    ),

    // Snackbar
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.lightText,
      contentTextStyle: AppTypography.bodyMedium(isDark: true),
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.borderRadius,
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );

  // ============================================
  // DARK THEME
  // ============================================

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // Colors
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: Colors.black,
      primaryContainer: AppColors.primaryDark,
      onPrimaryContainer: AppColors.primaryLight,
      secondary: AppColors.darkCard,
      onSecondary: AppColors.darkText,
      secondaryContainer: AppColors.darkSurface,
      onSecondaryContainer: AppColors.darkText,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkText,
      error: AppColors.error,
      onError: Colors.white,
      outline: AppColors.darkBorder,
      shadow: Colors.black45,
    ),

    scaffoldBackgroundColor: AppColors.darkBackground,
    canvasColor: AppColors.darkBackground,
    cardColor: AppColors.darkCard,
    dividerColor: AppColors.darkDivider,

    // Typography
    textTheme: AppTypography.textTheme(isDark: true),
    fontFamily: GoogleFonts.cinzel().fontFamily,

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkText,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleTextStyle: AppTypography.titleLarge(isDark: true),
      iconTheme: const IconThemeData(
        color: AppColors.darkText,
        size: AppSpacing.icon,
      ),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.black,
        elevation: 0,
        padding: AppSpacing.button,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusRound,
        ),
        textStyle: AppTypography.labelLarge(isDark: false),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.darkText,
        padding: AppSpacing.button,
        side: const BorderSide(color: AppColors.darkText, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusRound,
        ),
        textStyle: AppTypography.labelLarge(isDark: true),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        padding: AppSpacing.button,
        textStyle: AppTypography.labelMedium(isDark: true),
      ),
    ),

    // Input fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      border: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadius,
        borderSide: const BorderSide(color: AppColors.darkBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadius,
        borderSide: const BorderSide(color: AppColors.darkBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadius,
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppSpacing.borderRadius,
        borderSide: const BorderSide(color: AppColors.error),
      ),
      contentPadding: AppSpacing.allMd,
      hintStyle: AppTypography.bodyMedium(isDark: true),
      labelStyle: AppTypography.labelMedium(isDark: true),
    ),

    // Cards
    cardTheme: CardThemeData(
      color: AppColors.darkCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.borderRadiusLg,
      ),
      margin: EdgeInsets.zero,
    ),

    // Divider
    dividerTheme: const DividerThemeData(
      color: AppColors.darkDivider,
      thickness: 1,
      space: AppSpacing.lg,
    ),

    // Icons
    iconTheme: const IconThemeData(
      color: AppColors.darkText,
      size: AppSpacing.icon,
    ),

    // Drawer
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.darkBackground,
      surfaceTintColor: Colors.transparent,
    ),

    // Bottom Sheet
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.darkBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
      ),
    ),

    // Dialog
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.darkSurface,
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.borderRadiusLg,
      ),
      titleTextStyle: AppTypography.headlineSmall(isDark: true),
      contentTextStyle: AppTypography.bodyMedium(isDark: true),
    ),

    // Chips
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.darkSurface,
      labelStyle: AppTypography.labelSmall(isDark: true),
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.borderRadiusFull,
      ),
      side: const BorderSide(color: AppColors.darkBorder),
    ),

    // Tooltip
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.darkText,
        borderRadius: AppSpacing.borderRadiusSm,
      ),
      textStyle: AppTypography.bodySmall(isDark: false),
    ),

    // Snackbar
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.darkSurfaceElevated,
      contentTextStyle: AppTypography.bodyMedium(isDark: true),
      shape: RoundedRectangleBorder(
        borderRadius: AppSpacing.borderRadius,
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

// ============================================
// LEGACY SUPPORT (For gradual migration)
// ============================================

/// Legacy theme class for backward compatibility
@Deprecated('Use AppTheme instead')
class MyAppThemes {
  static ThemeData get lightTheme => AppTheme.light;
  static ThemeData get darkTheme => AppTheme.dark;
}
