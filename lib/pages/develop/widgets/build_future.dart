import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';

/// Develop Page - Build Future Section
class BuildFutureWidget extends StatelessWidget {
  const BuildFutureWidget({super.key});

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
            vertical: isDesktop ? 120 : 80,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BUILDING THE',
                style: AppTypography.headlineLarge(isDark: isDark).copyWith(
                  letterSpacing: 4,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms),

              const SizedBox(height: 8),

              Text(
                'F U T U R E',
                style: (isDesktop
                        ? AppTypography.displayLarge(isDark: isDark)
                        : AppTypography.displayMedium(isDark: isDark))
                    .copyWith(
                  letterSpacing: isDesktop ? 16 : 10,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms),

              SizedBox(height: isDesktop ? 48 : 32),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'DECENTRALIZED INTERNET IS THE NEXT EVOLUTION '
                  'OF THE WORLD WIDE WEB.',
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
        );
      },
    );
  }
}
