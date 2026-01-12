import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/spacing.dart';
import '../controllers/theme_controller.dart';

/// Alpha Protocol - Card Components
///
/// Reusable card widgets with consistent styling and hover effects.

// ============================================
// BASE APP CARD
// ============================================

/// Standard card container with theme-aware styling
class AppCard extends StatefulWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.enableHover = true,
    this.elevation = 0,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  });

  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final bool enableHover;
  final double elevation;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? width;
  final double? height;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;
        final bgColor = widget.backgroundColor ??
            (isDark ? AppColors.darkCard : AppColors.lightCard);
        final border = widget.borderColor ??
            (isDark ? AppColors.darkBorder : AppColors.lightBorder);

        return MouseRegion(
          onEnter: widget.enableHover
              ? (_) => setState(() => _isHovered = true)
              : null,
          onExit: widget.enableHover
              ? (_) => setState(() => _isHovered = false)
              : null,
          cursor: widget.onTap != null
              ? SystemMouseCursors.click
              : MouseCursor.defer,
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedScale(
              scale: _isHovered && widget.enableHover ? 1.02 : 1.0,
              duration: AppSpacing.durationFast,
              curve: Curves.easeOut,
              child: AnimatedContainer(
                duration: AppSpacing.durationFast,
                width: widget.width,
                height: widget.height,
                margin: widget.margin,
                padding: widget.padding ?? AppSpacing.card,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius:
                      widget.borderRadius ?? AppSpacing.borderRadiusLg,
                  border: Border.all(
                    color: _isHovered
                        ? AppColors.primary.withValues(alpha: 0.5)
                        : border,
                    width: _isHovered ? 1.5 : 1,
                  ),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.15),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ]
                      : (widget.elevation > 0
                          ? AppColors.shadow(isDark)
                          : null),
                ),
                child: widget.child,
              ),
            ),
          ),
        );
      },
    );
  }
}

// ============================================
// FEATURE CARD
// ============================================

/// Card for displaying features with icon, title, and description
class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    this.icon,
    this.iconWidget,
    this.onTap,
    this.width,
    this.height,
  });

  final String title;
  final String description;
  final IconData? icon;
  final Widget? iconWidget;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;

        return AppCard(
          onTap: onTap,
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              if (icon != null || iconWidget != null)
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primaryOverlay,
                    borderRadius: AppSpacing.borderRadius,
                  ),
                  child: Center(
                    child: iconWidget ??
                        Icon(
                          icon,
                          color: AppColors.primary,
                          size: AppSpacing.iconLg,
                        ),
                  ),
                ),
              if (icon != null || iconWidget != null) AppSpacing.gapVMd,

              // Title
              Text(
                title,
                style: AppTypography.titleLarge(isDark: isDark),
              ),
              AppSpacing.gapVXs,

              // Description
              Text(
                description,
                style: AppTypography.bodyMedium(isDark: isDark),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ============================================
// STAT CARD
// ============================================

/// Card for displaying statistics with large numbers
class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
    this.width,
  });

  final String title;
  final String value;
  final String? subtitle;
  final IconData? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;

        return AppCard(
          width: width,
          padding: AppSpacing.allLg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title with optional icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      size: AppSpacing.iconSm,
                      color: AppColors.primary,
                    ),
                    AppSpacing.gapHXs,
                  ],
                  Text(
                    title.toUpperCase(),
                    style: AppTypography.overline(isDark: isDark),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              AppSpacing.gapVSm,

              // Value
              Text(
                value,
                style: AppTypography.statistic(isDark: isDark),
                textAlign: TextAlign.center,
              ),

              // Subtitle
              if (subtitle != null) ...[
                AppSpacing.gapVXs,
                Text(
                  subtitle!,
                  style: AppTypography.labelSmall(isDark: isDark),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

// ============================================
// PRODUCT CARD
// ============================================

/// Card for displaying products (Alpha Go, Omega Wireless, Spectrum)
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageAsset,
    this.onTap,
    this.badge,
    this.width,
    this.height,
  });

  final String title;
  final String description;
  final String imageAsset;
  final VoidCallback? onTap;
  final String? badge;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;

        return AppCard(
          onTap: onTap,
          width: width,
          height: height,
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image with badge
              Stack(
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkSurface
                          : AppColors.lightSurface,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(AppSpacing.radiusLg),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        imageAsset,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  if (badge != null)
                    Positioned(
                      top: AppSpacing.sm,
                      right: AppSpacing.sm,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm,
                          vertical: AppSpacing.xxs,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: AppSpacing.borderRadiusFull,
                        ),
                        child: Text(
                          badge!.toUpperCase(),
                          style: AppTypography.labelSmall(isDark: false)
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                ],
              ),

              // Content
              Padding(
                padding: AppSpacing.allMd,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.titleMedium(isDark: isDark),
                    ),
                    AppSpacing.gapVXs,
                    Text(
                      description,
                      style: AppTypography.bodySmall(isDark: isDark),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ============================================
// GLASS CARD (Premium)
// ============================================

/// Premium glassmorphism card with blur effect
class GlassCard extends StatefulWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.width,
    this.height,
    this.opacity = 0.1,
  });

  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final double opacity;

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: widget.onTap != null
              ? SystemMouseCursors.click
              : MouseCursor.defer,
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedScale(
              scale: _isHovered ? 1.02 : 1.0,
              duration: AppSpacing.durationFast,
              curve: Curves.easeOut,
              child: AnimatedContainer(
                duration: AppSpacing.durationFast,
                width: widget.width,
                height: widget.height,
                margin: widget.margin,
                padding: widget.padding ?? AppSpacing.card,
                decoration: BoxDecoration(
                  color: (isDark ? Colors.white : Colors.black).withValues(
                    alpha: _isHovered ? widget.opacity + 0.05 : widget.opacity,
                  ),
                  borderRadius: AppSpacing.borderRadiusLg,
                  border: Border.all(
                    color: (isDark ? Colors.white : Colors.black).withValues(
                      alpha: _isHovered ? 0.3 : 0.15,
                    ),
                    width: 1,
                  ),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ]
                      : null,
                ),
                child: widget.child,
              ),
            ),
          ),
        );
      },
    );
  }
}

// ============================================
// SECTION CONTAINER
// ============================================

/// Full-width section container for page sections
class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.constraints,
  });

  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;

        return Container(
          width: double.infinity,
          padding: padding ?? AppSpacing.section,
          decoration: BoxDecoration(
            color: backgroundColor ??
                (isDark ? AppColors.darkBackground : AppColors.lightBackground),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: constraints ??
                  const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
              child: child,
            ),
          ),
        );
      },
    );
  }
}

// ============================================
// ANIMATED CARD ENTRY
// ============================================

/// Extension to add entry animations to cards
extension AnimatedCard on Widget {
  Widget animateEntry({int index = 0}) {
    return animate()
        .fadeIn(
          duration: 600.ms,
          delay: (100 * index).ms,
        )
        .slideY(
          begin: 0.1,
          end: 0,
          duration: 600.ms,
          delay: (100 * index).ms,
          curve: Curves.easeOut,
        );
  }
}
