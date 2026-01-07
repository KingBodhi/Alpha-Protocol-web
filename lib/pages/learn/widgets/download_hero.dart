import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';

/// Learn Page - Download Hero Section
///
/// Main CTA for downloading the Alpha Protocol Node application.
/// Features OS detection, trust signals, and clear value proposition.
class DownloadHero extends StatelessWidget {
  const DownloadHero({super.key});

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
            vertical: isDesktop ? 100 : 64,
          ),
          child: Column(
            children: [
              // Main Headline
              Text(
                'RUN THE NETWORK',
                style: AppTypography.headlineLarge(isDark: isDark).copyWith(
                  letterSpacing: 4,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms),

              const SizedBox(height: 8),

              Text(
                'OWN YOUR SOVEREIGNTY',
                style: (isDesktop
                        ? AppTypography.displayLarge(isDark: isDark)
                        : AppTypography.displayMedium(isDark: isDark))
                    .copyWith(
                  letterSpacing: isDesktop ? 8 : 4,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 100.ms),

              SizedBox(height: isDesktop ? 24 : 16),

              // Subheadline
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'Host an Alpha Node in minutes. Earn rewards automatically. '
                  'Help build censorship-resistant infrastructure.',
                  style: AppTypography.bodyLarge(isDark: isDark).copyWith(
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 200.ms),
              ),

              SizedBox(height: isDesktop ? 48 : 32),

              // Download Button Section
              _DownloadSection(isDark: isDark, isDesktop: isDesktop),

              SizedBox(height: isDesktop ? 48 : 32),

              // Trust Signals
              _TrustSignals(isDark: isDark, isDesktop: isDesktop),
            ],
          ),
        );
      },
    );
  }
}

/// Download button section
class _DownloadSection extends StatelessWidget {
  const _DownloadSection({required this.isDark, required this.isDesktop});

  final bool isDark;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Primary Download Button
        _PrimaryDownloadButton(
          text: 'Download for Your Platform',
          icon: Icons.download_rounded,
          version: 'v1.0.0',
          isDark: isDark,
          isDesktop: isDesktop,
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 300.ms)
            .scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1)),

        const SizedBox(height: 16),

        // Platform Options
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PlatformChip(
              icon: Icons.apple,
              label: 'macOS',
              isDark: isDark,
            ),
            _PlatformChip(
              icon: Icons.window,
              label: 'Windows',
              isDark: isDark,
            ),
            _PlatformChip(
              icon: Icons.terminal,
              label: 'Linux',
              isDark: isDark,
            ),
          ],
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 400.ms),

        const SizedBox(height: 12),

        // Release notes link
        TextButton(
          onPressed: () {},
          child: Text(
            'View release notes →',
            style: AppTypography.bodySmall(isDark: isDark).copyWith(
              color: AppColors.primary,
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 500.ms),
      ],
    );
  }
}

/// Primary download button with hover effects
class _PrimaryDownloadButton extends StatefulWidget {
  const _PrimaryDownloadButton({
    required this.text,
    required this.icon,
    required this.version,
    required this.isDark,
    required this.isDesktop,
  });

  final String text;
  final IconData icon;
  final String version;
  final bool isDark;
  final bool isDesktop;

  @override
  State<_PrimaryDownloadButton> createState() => _PrimaryDownloadButtonState();
}

class _PrimaryDownloadButtonState extends State<_PrimaryDownloadButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // TODO: Trigger download
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: widget.isDesktop ? 48 : 32,
            vertical: widget.isDesktop ? 20 : 16,
          ),
          decoration: BoxDecoration(
            gradient: _isHovered
                ? LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.primaryLight,
                    ],
                  )
                : null,
            color: _isHovered ? null : AppColors.primary,
            borderRadius: BorderRadius.circular(16),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.4),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: Colors.white,
                size: widget.isDesktop ? 28 : 24,
              ),
              SizedBox(width: widget.isDesktop ? 16 : 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.text,
                    style: AppTypography.titleMedium(isDark: true).copyWith(
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    widget.version,
                    style: AppTypography.labelSmall(isDark: true).copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
              SizedBox(width: widget.isDesktop ? 16 : 12),
              AnimatedRotation(
                turns: _isHovered ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.arrow_downward_rounded,
                  color: Colors.white,
                  size: widget.isDesktop ? 24 : 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Platform selection chip
class _PlatformChip extends StatefulWidget {
  const _PlatformChip({
    required this.icon,
    required this.label,
    required this.isDark,
  });

  final IconData icon;
  final String label;
  final bool isDark;

  @override
  State<_PlatformChip> createState() => _PlatformChipState();
}

class _PlatformChipState extends State<_PlatformChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.primary.withValues(alpha: 0.1)
                : Colors.transparent,
            border: Border.all(
              color: _isHovered
                  ? AppColors.primary
                  : AppColors.border(widget.isDark),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 18,
                color: _isHovered
                    ? AppColors.primary
                    : AppColors.textSecondary(widget.isDark),
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: AppTypography.labelMedium(isDark: widget.isDark).copyWith(
                  color: _isHovered
                      ? AppColors.primary
                      : AppColors.textSecondary(widget.isDark),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Trust signals row
class _TrustSignals extends StatelessWidget {
  const _TrustSignals({required this.isDark, required this.isDesktop});

  final bool isDark;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: isDesktop ? 32 : 16,
      runSpacing: 12,
      children: [
        _TrustBadge(
          icon: Icons.code,
          label: 'Open Source',
          isDark: isDark,
        ),
        _TrustBadge(
          icon: Icons.verified_user_outlined,
          label: 'Security Audited',
          isDark: isDark,
        ),
        _TrustBadge(
          icon: Icons.hub_outlined,
          label: '12,847 Active Nodes',
          isDark: isDark,
          highlight: true,
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: 600.ms);
  }
}

class _TrustBadge extends StatelessWidget {
  const _TrustBadge({
    required this.icon,
    required this.label,
    required this.isDark,
    this.highlight = false,
  });

  final IconData icon;
  final String label;
  final bool isDark;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 18,
          color: highlight ? AppColors.primary : AppColors.textMuted(isDark),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: AppTypography.labelMedium(isDark: isDark).copyWith(
            color: highlight ? AppColors.primary : AppColors.textMuted(isDark),
            fontWeight: highlight ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
