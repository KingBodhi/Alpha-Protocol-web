import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';
import '../../../constants/assets.dart';

/// Spectrum - Smart Home Section
class SpectrumHome extends StatelessWidget {
  const SpectrumHome({super.key});

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
            child: Column(
              children: [
                // Section Title
                Text(
                  'SPECTRUM',
                  style: AppTypography.headlineLarge(isDark: isDark).copyWith(
                    letterSpacing: 4,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms),

                const SizedBox(height: 8),

                Text(
                  'SMART HOME',
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
                    .fadeIn(duration: 600.ms, delay: 100.ms),

                SizedBox(height: isDesktop ? 48 : 32),

                // Home Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    AppAssets.getSpectrumHome(isDark),
                    width: double.infinity,
                    height: isDesktop ? 500 : 300,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: double.infinity,
                      height: isDesktop ? 500 : 300,
                      decoration: BoxDecoration(
                        color: AppColors.card(isDark),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_outlined,
                            size: 64,
                            color: AppColors.textMuted(isDark),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Smart Home Preview',
                            style: AppTypography.bodyLarge(isDark: isDark),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 200.ms)
                    .slideY(begin: 0.1, end: 0),

                SizedBox(height: isDesktop ? 32 : 24),

                // Description
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Text(
                    'BRINGING DECENTRALIZED CONNECTIVITY TO YOUR HOME. '
                    'SECURE, PRIVATE, AND COMPLETELY UNDER YOUR CONTROL.',
                    style: AppTypography.bodyLarge(isDark: isDark).copyWith(
                      height: 1.8,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 400.ms),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
