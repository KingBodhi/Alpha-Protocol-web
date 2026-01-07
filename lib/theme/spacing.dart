import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// Alpha Protocol Design System - Spacing & Layout
///
/// Consistent spacing scale and layout utilities.
/// Based on 4px base unit for visual harmony.
class AppSpacing {
  AppSpacing._();

  // ============================================
  // SPACING SCALE (4px base)
  // ============================================

  /// 4px - Minimal spacing
  static const double xxs = 4.0;

  /// 8px - Tight spacing
  static const double xs = 8.0;

  /// 12px - Compact spacing
  static const double sm = 12.0;

  /// 16px - Standard spacing (default)
  static const double md = 16.0;

  /// 24px - Comfortable spacing
  static const double lg = 24.0;

  /// 32px - Spacious
  static const double xl = 32.0;

  /// 48px - Section spacing
  static const double xxl = 48.0;

  /// 64px - Large section spacing
  static const double xxxl = 64.0;

  /// 96px - Hero/major section spacing
  static const double huge = 96.0;

  // ============================================
  // EDGE INSETS PRESETS
  // ============================================

  /// No padding
  static const EdgeInsets zero = EdgeInsets.zero;

  /// All sides xxs (4px)
  static const EdgeInsets allXxs = EdgeInsets.all(xxs);

  /// All sides xs (8px)
  static const EdgeInsets allXs = EdgeInsets.all(xs);

  /// All sides sm (12px)
  static const EdgeInsets allSm = EdgeInsets.all(sm);

  /// All sides md (16px) - Default
  static const EdgeInsets allMd = EdgeInsets.all(md);

  /// All sides lg (24px)
  static const EdgeInsets allLg = EdgeInsets.all(lg);

  /// All sides xl (32px)
  static const EdgeInsets allXl = EdgeInsets.all(xl);

  /// Horizontal md (16px)
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: md);

  /// Horizontal lg (24px)
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: lg);

  /// Horizontal xl (32px)
  static const EdgeInsets horizontalXl = EdgeInsets.symmetric(horizontal: xl);

  /// Vertical md (16px)
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: md);

  /// Vertical lg (24px)
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: lg);

  /// Vertical xl (32px)
  static const EdgeInsets verticalXl = EdgeInsets.symmetric(vertical: xl);

  /// Card padding - comfortable inner spacing
  static const EdgeInsets card = EdgeInsets.all(lg);

  /// Button padding
  static const EdgeInsets button = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: sm,
  );

  /// Page padding (responsive)
  static EdgeInsets get page => EdgeInsets.symmetric(
    horizontal: 5.w,
    vertical: xl,
  );

  /// Section padding (responsive)
  static EdgeInsets get section => EdgeInsets.symmetric(
    horizontal: 5.w,
    vertical: xxl,
  );

  // ============================================
  // GAPS (for Row/Column spacing)
  // ============================================

  /// Vertical gap xxs (4px)
  static const SizedBox gapVXxs = SizedBox(height: xxs);

  /// Vertical gap xs (8px)
  static const SizedBox gapVXs = SizedBox(height: xs);

  /// Vertical gap sm (12px)
  static const SizedBox gapVSm = SizedBox(height: sm);

  /// Vertical gap md (16px)
  static const SizedBox gapVMd = SizedBox(height: md);

  /// Vertical gap lg (24px)
  static const SizedBox gapVLg = SizedBox(height: lg);

  /// Vertical gap xl (32px)
  static const SizedBox gapVXl = SizedBox(height: xl);

  /// Vertical gap xxl (48px)
  static const SizedBox gapVXxl = SizedBox(height: xxl);

  /// Horizontal gap xxs (4px)
  static const SizedBox gapHXxs = SizedBox(width: xxs);

  /// Horizontal gap xs (8px)
  static const SizedBox gapHXs = SizedBox(width: xs);

  /// Horizontal gap sm (12px)
  static const SizedBox gapHSm = SizedBox(width: sm);

  /// Horizontal gap md (16px)
  static const SizedBox gapHMd = SizedBox(width: md);

  /// Horizontal gap lg (24px)
  static const SizedBox gapHLg = SizedBox(width: lg);

  /// Horizontal gap xl (32px)
  static const SizedBox gapHXl = SizedBox(width: xl);

  // ============================================
  // BORDER RADIUS
  // ============================================

  /// No radius
  static const double radiusNone = 0;

  /// Small radius (4px)
  static const double radiusSm = 4.0;

  /// Medium radius (8px)
  static const double radiusMd = 8.0;

  /// Default radius (12px)
  static const double radius = 12.0;

  /// Large radius (16px)
  static const double radiusLg = 16.0;

  /// Extra large radius (20px)
  static const double radiusXl = 20.0;

  /// Round radius (24px)
  static const double radiusRound = 24.0;

  /// Full/pill radius (9999px)
  static const double radiusFull = 9999.0;

  /// Border radius presets
  static BorderRadius get borderRadiusSm => BorderRadius.circular(radiusSm);
  static BorderRadius get borderRadiusMd => BorderRadius.circular(radiusMd);
  static BorderRadius get borderRadius => BorderRadius.circular(radius);
  static BorderRadius get borderRadiusLg => BorderRadius.circular(radiusLg);
  static BorderRadius get borderRadiusXl => BorderRadius.circular(radiusXl);
  static BorderRadius get borderRadiusRound => BorderRadius.circular(radiusRound);
  static BorderRadius get borderRadiusFull => BorderRadius.circular(radiusFull);

  // ============================================
  // BREAKPOINTS (Responsive)
  // ============================================

  /// Mobile max width
  static const double mobileMax = 480;

  /// Tablet max width
  static const double tabletMax = 768;

  /// Desktop min width
  static const double desktopMin = 1024;

  /// Wide desktop min width
  static const double wideDesktopMin = 1440;

  /// Max content width (for large screens)
  static const double maxContentWidth = 1200;

  // ============================================
  // RESPONSIVE HELPERS
  // ============================================

  /// Check if current width is mobile
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= mobileMax;

  /// Check if current width is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > mobileMax && width <= tabletMax;
  }

  /// Check if current width is desktop
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > tabletMax;

  /// Check if current width is wide desktop
  static bool isWideDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= wideDesktopMin;

  /// Get responsive value based on screen size
  static T responsive<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context)) return desktop ?? tablet ?? mobile;
    if (isTablet(context)) return tablet ?? mobile;
    return mobile;
  }

  // ============================================
  // ANIMATION DURATIONS
  // ============================================

  /// Fast animation (150ms)
  static const Duration durationFast = Duration(milliseconds: 150);

  /// Normal animation (300ms)
  static const Duration durationNormal = Duration(milliseconds: 300);

  /// Slow animation (500ms)
  static const Duration durationSlow = Duration(milliseconds: 500);

  /// Page transition duration
  static const Duration durationPage = Duration(milliseconds: 400);

  // ============================================
  // ICON SIZES
  // ============================================

  /// Small icon (16px)
  static const double iconSm = 16.0;

  /// Medium icon (20px)
  static const double iconMd = 20.0;

  /// Default icon (24px)
  static const double icon = 24.0;

  /// Large icon (32px)
  static const double iconLg = 32.0;

  /// Extra large icon (48px)
  static const double iconXl = 48.0;
}
