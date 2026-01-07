import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';

/// Alpha Protocol - Safeguard Section
///
/// Section showcasing connection security features.
class Safeguard extends StatelessWidget {
  const Safeguard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > AppSpacing.tabletMax;

    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80 : 24,
            vertical: isDesktop ? 80 : 48,
          ),
          color: AppColors.surface(isDark),
          child: Column(
            children: [
              // Section Header
              Text(
                'SAFEGUARD YOUR',
                style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms),

              const SizedBox(height: 8),

              Text(
                'C O N N E C T I O N',
                style: (isDesktop
                        ? AppTypography.displayMedium(isDark: isDark)
                        : AppTypography.displaySmall(isDark: isDark))
                    .copyWith(
                  letterSpacing: isDesktop ? 12 : 8,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 100.ms),

              SizedBox(height: isDesktop ? 64 : 40),

              // Step Cards
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  children: [
                    _StepCard(
                      step: 1,
                      title: 'DOWNLOAD & INSTALL',
                      description:
                          'Download and install the Alpha Protocol Network (APN) to your device',
                      isDark: isDark,
                      showPlatforms: true,
                    ),
                    const SizedBox(height: 24),
                    _StepCard(
                      step: 2,
                      title: 'CONFIGURE YOUR CONNECTION',
                      description:
                          'Host your own private network or connect to Alpha Protocol\'s decentralized network',
                      isDark: isDark,
                    ),
                    const SizedBox(height: 24),
                    _StepCard(
                      step: 3,
                      title: 'SECURE & EARN',
                      description:
                          'Secure your systems and earn rewards for your contributions to the network',
                      isDark: isDark,
                      highlight: 'ENJOY!',
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

/// Individual step card
class _StepCard extends StatefulWidget {
  const _StepCard({
    required this.step,
    required this.title,
    required this.description,
    required this.isDark,
    this.showPlatforms = false,
    this.highlight,
  });

  final int step;
  final String title;
  final String description;
  final bool isDark;
  final bool showPlatforms;
  final String? highlight;

  @override
  State<_StepCard> createState() => _StepCardState();
}

class _StepCardState extends State<_StepCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.card(widget.isDark),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? AppColors.primary.withValues(alpha: 0.5)
                : AppColors.border(widget.isDark),
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
        child: Column(
          children: [
            // Step number
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${widget.step}',
                  style: AppTypography.titleLarge(isDark: widget.isDark)
                      .copyWith(color: AppColors.primary),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Title
            Text(
              widget.title,
              style: AppTypography.titleMedium(isDark: widget.isDark).copyWith(
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            // Description
            Text(
              widget.description,
              style: AppTypography.bodyMedium(isDark: widget.isDark),
              textAlign: TextAlign.center,
            ),

            // Highlight text
            if (widget.highlight != null) ...[
              const SizedBox(height: 16),
              Text(
                widget.highlight!,
                style: AppTypography.titleLarge(isDark: widget.isDark).copyWith(
                  color: AppColors.primary,
                  letterSpacing: 2,
                ),
              ),
            ],

            // Platform Icons
            if (widget.showPlatforms) ...[
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _PlatformIcon(
                    icon: Icons.apple,
                    label: 'macOS',
                    isDark: widget.isDark,
                  ),
                  const SizedBox(width: 32),
                  _PlatformIcon(
                    icon: Icons.window,
                    label: 'Windows',
                    isDark: widget.isDark,
                  ),
                  const SizedBox(width: 32),
                  _PlatformIcon(
                    icon: Icons.android,
                    label: 'Android',
                    isDark: widget.isDark,
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(
          duration: 600.ms,
          delay: (200 * widget.step).ms,
        )
        .slideY(
          begin: 0.1,
          end: 0,
          duration: 600.ms,
          delay: (200 * widget.step).ms,
        );
  }
}

/// Platform icon with label
class _PlatformIcon extends StatefulWidget {
  const _PlatformIcon({
    required this.icon,
    required this.label,
    required this.isDark,
  });

  final IconData icon;
  final String label;
  final bool isDark;

  @override
  State<_PlatformIcon> createState() => _PlatformIconState();
}

class _PlatformIconState extends State<_PlatformIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _isHovered
                  ? AppColors.primary.withValues(alpha: 0.2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              widget.icon,
              size: 32,
              color: _isHovered
                  ? AppColors.primary
                  : AppColors.textSecondary(widget.isDark),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.label,
            style: AppTypography.labelSmall(isDark: widget.isDark).copyWith(
              color: _isHovered
                  ? AppColors.primary
                  : AppColors.textMuted(widget.isDark),
            ),
          ),
        ],
      ),
    );
  }
}
