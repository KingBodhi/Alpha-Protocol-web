import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/spacing.dart';
import '../controllers/theme_controller.dart';

/// Alpha Protocol - Button Components
///
/// Reusable button widgets with consistent styling and animations.
/// Includes hover effects and loading states.

// ============================================
// PRIMARY BUTTON (Gold/Filled)
// ============================================

/// Primary call-to-action button with gold background
class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isExpanded = false,
    this.icon,
    this.height,
    this.width,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isExpanded;
  final IconData? icon;
  final double? height;
  final double? width;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.onPressed != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: AppSpacing.durationFast,
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        child: SizedBox(
          width: widget.isExpanded ? double.infinity : widget.width,
          height: widget.height ?? 48,
          child: ElevatedButton(
            onPressed: widget.isLoading ? null : widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  _isHovered ? AppColors.primaryDark : AppColors.primary,
              foregroundColor: Colors.white,
              elevation: _isHovered ? 8 : 0,
              shadowColor: AppColors.primary.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                borderRadius: AppSpacing.borderRadiusRound,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.sm,
              ),
            ),
            child: widget.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.icon != null) ...[
                        Icon(widget.icon, size: 18),
                        AppSpacing.gapHXs,
                      ],
                      Text(
                        widget.text.toUpperCase(),
                        style: AppTypography.button(isDark: true).copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

// ============================================
// SECONDARY BUTTON (Outlined)
// ============================================

/// Secondary outlined button with theme-aware border
class SecondaryButton extends StatefulWidget {
  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isExpanded = false,
    this.icon,
    this.height,
    this.width,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isExpanded;
  final IconData? icon;
  final double? height;
  final double? width;

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;
        final textColor = isDark ? AppColors.darkText : AppColors.lightText;

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: widget.onPressed != null
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          child: AnimatedContainer(
            duration: AppSpacing.durationFast,
            transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
            child: SizedBox(
              width: widget.isExpanded ? double.infinity : widget.width,
              height: widget.height ?? 48,
              child: OutlinedButton(
                onPressed: widget.isLoading ? null : widget.onPressed,
                style: OutlinedButton.styleFrom(
                  foregroundColor: _isHovered ? AppColors.primary : textColor,
                  side: BorderSide(
                    color: _isHovered ? AppColors.primary : textColor,
                    width: _isHovered ? 2 : 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppSpacing.borderRadiusRound,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.sm,
                  ),
                ),
                child: widget.isLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(textColor),
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.icon != null) ...[
                            Icon(widget.icon, size: 18),
                            AppSpacing.gapHXs,
                          ],
                          Text(
                            widget.text.toUpperCase(),
                            style: AppTypography.button(isDark: isDark),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ============================================
// GHOST BUTTON (Text only with hover)
// ============================================

/// Minimal text button with subtle hover effect
class GhostButton extends StatefulWidget {
  const GhostButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.isActive = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isActive;

  @override
  State<GhostButton> createState() => _GhostButtonState();
}

class _GhostButtonState extends State<GhostButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;
        final baseColor = isDark ? AppColors.darkText : AppColors.lightText;

        Color textColor;
        if (widget.isActive || _isHovered) {
          textColor = AppColors.primary;
        } else {
          textColor = baseColor;
        }

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: widget.onPressed,
            child: AnimatedContainer(
              duration: AppSpacing.durationFast,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: widget.isActive || _isHovered
                        ? AppColors.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null) ...[
                    Icon(
                      widget.icon,
                      size: 16,
                      color: textColor,
                    ),
                    AppSpacing.gapHXxs,
                  ],
                  Text(
                    widget.text.toUpperCase(),
                    style: AppTypography.navigation(
                      isDark: isDark,
                      isActive: widget.isActive || _isHovered,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ============================================
// ICON BUTTON WITH HOVER
// ============================================

/// Circular icon button with hover animation
class AppIconButton extends StatefulWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = 40,
    this.iconSize = 20,
    this.tooltip,
    this.showBackground = false,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final double iconSize;
  final String? tooltip;
  final bool showBackground;

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;
        final iconColor = _isHovered
            ? AppColors.primary
            : (isDark ? AppColors.darkText : AppColors.lightText);

        final button = MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: widget.onPressed,
            child: AnimatedContainer(
              duration: AppSpacing.durationFast,
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: widget.showBackground || _isHovered
                    ? (isDark ? AppColors.darkCard : AppColors.lightCard)
                        .withOpacity(_isHovered ? 1 : 0.5)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(widget.size / 2),
              ),
              child: Center(
                child: AnimatedScale(
                  scale: _isHovered ? 1.1 : 1.0,
                  duration: AppSpacing.durationFast,
                  child: Icon(
                    widget.icon,
                    size: widget.iconSize,
                    color: iconColor,
                  ),
                ),
              ),
            ),
          ),
        );

        if (widget.tooltip != null) {
          return Tooltip(
            message: widget.tooltip!,
            child: button,
          );
        }

        return button;
      },
    );
  }
}

// ============================================
// SOCIAL ICON BUTTON
// ============================================

/// Social media icon button with image asset
class SocialIconButton extends StatefulWidget {
  const SocialIconButton({
    super.key,
    required this.assetPath,
    this.onPressed,
    this.size = 32,
    this.tooltip,
  });

  final String assetPath;
  final VoidCallback? onPressed;
  final double size;
  final String? tooltip;

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final button = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _isHovered ? 1.15 : 1.0,
          duration: AppSpacing.durationFast,
          child: AnimatedOpacity(
            opacity: _isHovered ? 1.0 : 0.8,
            duration: AppSpacing.durationFast,
            child: Image.asset(
              widget.assetPath,
              width: widget.size,
              height: widget.size,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );

    if (widget.tooltip != null) {
      return Tooltip(
        message: widget.tooltip!,
        child: button,
      );
    }

    return button;
  }
}

// ============================================
// ANIMATED CTA BUTTON (Premium)
// ============================================

/// Premium animated button with shimmer effect
class AnimatedCtaButton extends StatelessWidget {
  const AnimatedCtaButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.width,
  });

  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: text,
      onPressed: onPressed,
      icon: icon,
      width: width,
    )
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(
          duration: 2000.ms,
          color: AppColors.primaryLight.withOpacity(0.3),
        )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.2, end: 0);
  }
}
