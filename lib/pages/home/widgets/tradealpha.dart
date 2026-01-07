import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';
import '../../../components/buttons.dart';

/// Alpha Protocol - Trade Alpha Section
///
/// Section promoting Alpha Runes trading on Luminex.
class TradeAlpha extends StatelessWidget {
  const TradeAlpha({super.key});

  static const String _luminexUrl = 'https://luminex.io';

  Future<void> _launchLuminex() async {
    final uri = Uri.parse(_luminexUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

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
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: isDesktop
                ? _DesktopLayout(
                    isDark: isDark,
                    onTapLuminex: _launchLuminex,
                  )
                : _MobileLayout(
                    isDark: isDark,
                    onTapLuminex: _launchLuminex,
                  ),
          ),
        );
      },
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout({
    required this.isDark,
    required this.onTapLuminex,
  });

  final bool isDark;
  final VoidCallback onTapLuminex;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image placeholder
        Expanded(
          child: _ImagePlaceholder(isDark: isDark),
        ),
        const SizedBox(width: 64),
        // Content
        Expanded(
          child: _Content(isDark: isDark, onTapLuminex: onTapLuminex),
        ),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({
    required this.isDark,
    required this.onTapLuminex,
  });

  final bool isDark;
  final VoidCallback onTapLuminex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ImagePlaceholder(isDark: isDark),
        const SizedBox(height: 32),
        _Content(isDark: isDark, onTapLuminex: onTapLuminex),
      ],
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card(isDark),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border(isDark)),
        ),
        child: Center(
          child: Icon(
            Icons.image_outlined,
            size: 64,
            color: AppColors.textMuted(isDark),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideX(begin: -0.1, end: 0);
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.isDark,
    required this.onTapLuminex,
  });

  final bool isDark;
  final VoidCallback onTapLuminex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'ALPHA RUNES',
          style: AppTypography.displaySmall(isDark: isDark).copyWith(
            letterSpacing: 4,
          ),
          textAlign: TextAlign.center,
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 100.ms),

        const SizedBox(height: 16),

        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: AppTypography.bodyLarge(isDark: isDark),
            children: [
              const TextSpan(text: 'BUY, SELL, AND TRADE BITCOIN INSCRIBED '),
              TextSpan(
                text: 'ALPHA RUNES',
                style: AppTypography.bodyLarge(isDark: isDark).copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const TextSpan(text: ' ON LUMINEX'),
            ],
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 200.ms),

        const SizedBox(height: 32),

        SecondaryButton(
          text: 'LUMINEX DEX',
          onPressed: onTapLuminex,
          icon: Icons.open_in_new,
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 300.ms),
      ],
    );
  }
}
