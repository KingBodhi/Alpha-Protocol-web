import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';

/// Learn Page - Internet Broken Section
class InternetBrokenWidget extends StatelessWidget {
  const InternetBrokenWidget({super.key});

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
                'THE INTERNET IS',
                style: AppTypography.headlineLarge(isDark: isDark).copyWith(
                  letterSpacing: 4,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms),

              const SizedBox(height: 8),

              Text(
                'B R O K E N',
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
                  'TODAY THE WORLD WIDE WEB IS CONTROLLED BY AN EXTREMELY '
                  'CONCENTRATED GROUP OF CORPORATIONS WHO USE THEIR '
                  'MONOPOLIZATION OF ACCESS TO SENSOR, SURVEIL, AND PROFIT '
                  'FROM THE INDIVIDUALS WHO USE IT.',
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
