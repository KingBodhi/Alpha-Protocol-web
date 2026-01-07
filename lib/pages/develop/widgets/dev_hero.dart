import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';
import '../../../components/buttons.dart';

/// Develop Page - Hero Section
///
/// Main CTA for developers to start building on Alpha Protocol.
class DevHero extends StatelessWidget {
  const DevHero({super.key});

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
              // Pre-headline
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  'BY BUILDERS, FOR BUILDERS',
                  style: AppTypography.labelMedium(isDark: isDark).copyWith(
                    color: AppColors.primary,
                    letterSpacing: 2,
                  ),
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms),

              const SizedBox(height: 24),

              // Main Headline
              Text(
                'BUILD THE',
                style: AppTypography.headlineLarge(isDark: isDark).copyWith(
                  letterSpacing: 4,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 100.ms),

              const SizedBox(height: 8),

              Text(
                'DECENTRALIZED WEB',
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
                  .fadeIn(duration: 600.ms, delay: 200.ms),

              SizedBox(height: isDesktop ? 24 : 16),

              // Subheadline
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'Ship censorship-resistant apps in days, not months. '
                  'Battle-tested SDKs, comprehensive docs, and an active community.',
                  style: AppTypography.bodyLarge(isDark: isDark).copyWith(
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 300.ms),
              ),

              SizedBox(height: isDesktop ? 48 : 32),

              // CTA Buttons
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 12,
                children: [
                  PrimaryButton(
                    text: 'Start Building',
                    onPressed: () {},
                  ),
                  SecondaryButton(
                    text: 'Read Docs',
                    onPressed: () {},
                  ),
                  GhostButton(
                    text: 'Join Discord',
                    onPressed: () {},
                  ),
                ],
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 400.ms),

              SizedBox(height: isDesktop ? 48 : 32),

              // Time to value stat
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: 18,
                    color: AppColors.textMuted(isDark),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '5 minutes to first deployment',
                    style: AppTypography.bodyMedium(isDark: isDark).copyWith(
                      color: AppColors.textMuted(isDark),
                    ),
                  ),
                ],
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 500.ms),
            ],
          ),
        );
      },
    );
  }
}
