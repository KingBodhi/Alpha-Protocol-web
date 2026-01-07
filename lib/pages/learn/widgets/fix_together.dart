import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';
import '../../../constants/assets.dart';

/// Learn Page - Fix Together Section
class FixTogetherWidget extends StatelessWidget {
  const FixTogetherWidget({super.key});

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
              // Header
              Text(
                'TOGETHER, WE WILL',
                style: AppTypography.headlineLarge(isDark: isDark).copyWith(
                  letterSpacing: 4,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms),

              const SizedBox(height: 8),

              Text(
                'F I X  I T',
                style: (isDesktop
                        ? AppTypography.displayMedium(isDark: isDark)
                        : AppTypography.displaySmall(isDark: isDark))
                    .copyWith(
                  letterSpacing: isDesktop ? 16 : 10,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 100.ms),

              SizedBox(height: isDesktop ? 64 : 40),

              // Feature Cards
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  children: [
                    _FeatureItem(
                      imageIndex: 1,
                      title: 'PEER TO PEER NETWORKING',
                      description:
                          'ENABLING DEVICES TO CONNECT DIRECTLY AND EXCHANGE DATA AS PEERS',
                      isDark: isDark,
                      isDesktop: isDesktop,
                    ),
                    SizedBox(height: isDesktop ? 48 : 32),
                    _FeatureItem(
                      imageIndex: 2,
                      title: 'CROSS-PLATFORM SUPPORT',
                      description:
                          'EXPAND COVERAGE TO COMMON DEVICE TYPES\niOS • ANDROID • WINDOWS • MAC OS • LINUX',
                      isDark: isDark,
                      isDesktop: isDesktop,
                      reversed: true,
                    ),
                    SizedBox(height: isDesktop ? 48 : 32),
                    _FeatureItem(
                      imageIndex: 3,
                      title: 'TOKENIZED REWARDS',
                      description: 'INCENTIVIZE NETWORK PARTICIPATION',
                      isDark: isDark,
                      isDesktop: isDesktop,
                    ),
                    SizedBox(height: isDesktop ? 48 : 32),
                    _FeatureItem(
                      imageIndex: 4,
                      title: 'LOCALIZED MICROGRIDS',
                      description: 'PRIVATE AND PUBLIC USE NETWORKS',
                      isDark: isDark,
                      isDesktop: isDesktop,
                      reversed: true,
                    ),
                    SizedBox(height: isDesktop ? 48 : 32),
                    _FeatureItem(
                      imageIndex: 5,
                      title: 'GLOBAL NETWORK',
                      description:
                          'CONNECT LOCALIZED MICROGRIDS INTO A GLOBAL DECENTRALIZED NETWORK',
                      isDark: isDark,
                      isDesktop: isDesktop,
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

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    required this.imageIndex,
    required this.title,
    required this.description,
    required this.isDark,
    required this.isDesktop,
    this.reversed = false,
  });

  final int imageIndex;
  final String title;
  final String description;
  final bool isDark;
  final bool isDesktop;
  final bool reversed;

  @override
  Widget build(BuildContext context) {
    final imageWidget = Container(
      constraints: BoxConstraints(
        maxWidth: isDesktop ? 200 : 150,
        maxHeight: isDesktop ? 200 : 150,
      ),
      child: Image.asset(
        AppAssets.getLearnImage(imageIndex, isDark),
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => Container(
          width: isDesktop ? 200 : 150,
          height: isDesktop ? 200 : 150,
          decoration: BoxDecoration(
            color: AppColors.card(isDark),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.image_outlined,
            size: 48,
            color: AppColors.textMuted(isDark),
          ),
        ),
      ),
    );

    final textWidget = Expanded(
      child: Column(
        crossAxisAlignment:
            isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTypography.titleLarge(isDark: isDark).copyWith(
              color: AppColors.primary,
              letterSpacing: 2,
            ),
            textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: AppTypography.bodyMedium(isDark: isDark),
            textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          ),
        ],
      ),
    );

    if (!isDesktop) {
      return Column(
        children: [
          imageWidget,
          const SizedBox(height: 16),
          textWidget,
        ],
      )
          .animate()
          .fadeIn(duration: 600.ms)
          .slideY(begin: 0.1, end: 0);
    }

    return Row(
      children: reversed
          ? [textWidget, const SizedBox(width: 48), imageWidget]
          : [imageWidget, const SizedBox(width: 48), textWidget],
    )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideX(begin: reversed ? 0.1 : -0.1, end: 0);
  }
}
