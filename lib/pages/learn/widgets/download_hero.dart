import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../components/download_button.dart';
import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';
import '../../../utils/download_helper.dart';
import '../../../utils/download_platform.dart';

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
              ).animate().fadeIn(duration: 600.ms),

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
              ).animate().fadeIn(duration: 600.ms, delay: 100.ms),

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
                ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
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
        DownloadCtaButton(
          title: 'Download for Your Platform',
          subtitle: 'v1.0.0',
          icon: Icons.download_rounded,
          isDesktop: isDesktop,
          onPressed: () => DownloadHelper.launchWithFallback(context),
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 300.ms)
            .scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1)),

        const SizedBox(height: 16),

        // Platform Options
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 12,
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
              icon: FontAwesomeIcons.linux,
              label: 'Linux',
              isDark: isDark,
            ),
          ],
        ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

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
        ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
      ],
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

  void _handleTap() {
    DownloadHelper.launchWithFallback(
      context,
      platformOverride: _platformForLabel(widget.label),
    );
  }

  DownloadPlatform? _platformForLabel(String label) {
    switch (label.toLowerCase()) {
      case 'macos':
        return DownloadPlatform.macOS;
      case 'windows':
        return DownloadPlatform.windows;
      case 'linux':
        return DownloadPlatform.linux;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _handleTap,
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
                style:
                    AppTypography.labelMedium(isDark: widget.isDark).copyWith(
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
    ).animate().fadeIn(duration: 600.ms, delay: 600.ms);
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
