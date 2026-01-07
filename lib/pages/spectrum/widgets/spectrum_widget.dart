import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';
import '../../../constants/assets.dart';

/// Spectrum - Main Widget
class SpectrumWidget extends StatelessWidget {
  const SpectrumWidget({super.key});

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
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Product Icon
                Image.asset(
                  isDark
                      ? AppAssets.spectrumIconDark
                      : AppAssets.spectrumIcon,
                  height: isDesktop ? 250 : 180,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.blur_circular_outlined,
                    size: isDesktop ? 250 : 180,
                    color: AppColors.primary,
                  ),
                )
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),

                SizedBox(height: isDesktop ? 48 : 32),

                // Title
                Text(
                  'SPECTRUM',
                  style: (isDesktop
                          ? AppTypography.displayMedium(isDark: isDark)
                          : AppTypography.displaySmall(isDark: isDark))
                      .copyWith(
                    letterSpacing: 8,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 200.ms),

                const SizedBox(height: 16),

                Text(
                  'DECENTRALIZED NETWORK INFRASTRUCTURE\nFOR THE MODERN HUMAN',
                  style: AppTypography.bodyLarge(isDark: isDark).copyWith(
                    letterSpacing: 2,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 300.ms),

                SizedBox(height: isDesktop ? 64 : 40),

                // Tagline
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.3),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'ALL FOR ONE AND ONE FOR ALL',
                    style: AppTypography.titleMedium(isDark: isDark).copyWith(
                      letterSpacing: 4,
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 400.ms),
              ],
            ),
          ),
        );
      },
    );
  }
}
