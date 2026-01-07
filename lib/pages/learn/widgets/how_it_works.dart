import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';

/// Learn Page - How It Works Section
///
/// Shows the 4-step process to get a node running.
class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

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
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              children: [
                // Section Header
                Text(
                  'GET STARTED IN',
                  style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                    letterSpacing: 4,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms),

                const SizedBox(height: 8),

                Text(
                  '4 SIMPLE STEPS',
                  style: AppTypography.displaySmall(isDark: isDark).copyWith(
                    letterSpacing: 6,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 100.ms),

                SizedBox(height: isDesktop ? 64 : 40),

                // Steps
                isDesktop
                    ? Row(
                        children: [
                          Expanded(
                            child: _StepItem(
                              number: 1,
                              icon: Icons.download_rounded,
                              title: 'Download',
                              description: 'Get the installer for your platform',
                              time: '1 min',
                              isDark: isDark,
                            ),
                          ),
                          _StepConnector(isDark: isDark),
                          Expanded(
                            child: _StepItem(
                              number: 2,
                              icon: Icons.install_desktop_rounded,
                              title: 'Install',
                              description: 'Run the setup wizard',
                              time: '2 min',
                              isDark: isDark,
                            ),
                          ),
                          _StepConnector(isDark: isDark),
                          Expanded(
                            child: _StepItem(
                              number: 3,
                              icon: Icons.tune_rounded,
                              title: 'Configure',
                              description: 'Set your preferences & wallet',
                              time: '3 min',
                              isDark: isDark,
                            ),
                          ),
                          _StepConnector(isDark: isDark),
                          Expanded(
                            child: _StepItem(
                              number: 4,
                              icon: Icons.rocket_launch_rounded,
                              title: 'Earn',
                              description: 'Start earning rewards',
                              time: 'Auto',
                              isDark: isDark,
                              highlight: true,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          _StepItemMobile(
                            number: 1,
                            icon: Icons.download_rounded,
                            title: 'Download',
                            description: 'Get the installer for your platform',
                            time: '1 min',
                            isDark: isDark,
                          ),
                          _VerticalConnector(isDark: isDark),
                          _StepItemMobile(
                            number: 2,
                            icon: Icons.install_desktop_rounded,
                            title: 'Install',
                            description: 'Run the setup wizard',
                            time: '2 min',
                            isDark: isDark,
                          ),
                          _VerticalConnector(isDark: isDark),
                          _StepItemMobile(
                            number: 3,
                            icon: Icons.tune_rounded,
                            title: 'Configure',
                            description: 'Set your preferences & wallet',
                            time: '3 min',
                            isDark: isDark,
                          ),
                          _VerticalConnector(isDark: isDark),
                          _StepItemMobile(
                            number: 4,
                            icon: Icons.rocket_launch_rounded,
                            title: 'Earn',
                            description: 'Start earning rewards automatically',
                            time: 'Auto',
                            isDark: isDark,
                            highlight: true,
                          ),
                        ],
                      ),

                SizedBox(height: isDesktop ? 48 : 32),

                // Total time indicator
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.schedule_rounded,
                        size: 20,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Running in under 10 minutes',
                        style: AppTypography.labelLarge(isDark: isDark).copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 800.ms),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StepItem extends StatelessWidget {
  const _StepItem({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    required this.isDark,
    this.highlight = false,
  });

  final int number;
  final IconData icon;
  final String title;
  final String description;
  final String time;
  final bool isDark;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Step number
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: highlight
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$number',
              style: AppTypography.titleLarge(isDark: isDark).copyWith(
                color: highlight ? Colors.white : AppColors.primary,
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Icon
        Icon(
          icon,
          size: 32,
          color: highlight ? AppColors.primary : AppColors.textColor(isDark),
        ),

        const SizedBox(height: 12),

        // Title
        Text(
          title.toUpperCase(),
          style: AppTypography.titleMedium(isDark: isDark).copyWith(
            letterSpacing: 2,
            color: highlight ? AppColors.primary : null,
          ),
        ),

        const SizedBox(height: 8),

        // Description
        Text(
          description,
          style: AppTypography.bodySmall(isDark: isDark),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 8),

        // Time
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.card(isDark),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            time,
            style: AppTypography.labelSmall(isDark: isDark).copyWith(
              color: AppColors.textMuted(isDark),
            ),
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: (200 * number).ms);
  }
}

class _StepItemMobile extends StatelessWidget {
  const _StepItemMobile({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    required this.isDark,
    this.highlight = false,
  });

  final int number;
  final IconData icon;
  final String title;
  final String description;
  final String time;
  final bool isDark;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Step number
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: highlight
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$number',
              style: AppTypography.titleLarge(isDark: isDark).copyWith(
                color: highlight ? Colors.white : AppColors.primary,
              ),
            ),
          ),
        ),

        const SizedBox(width: 16),

        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 20,
                    color: highlight
                        ? AppColors.primary
                        : AppColors.textColor(isDark),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title.toUpperCase(),
                    style: AppTypography.titleMedium(isDark: isDark).copyWith(
                      letterSpacing: 1,
                      color: highlight ? AppColors.primary : null,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.card(isDark),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      time,
                      style: AppTypography.labelSmall(isDark: isDark),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: AppTypography.bodySmall(isDark: isDark),
              ),
            ],
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: (150 * number).ms)
        .slideX(begin: -0.1, end: 0);
  }
}

class _StepConnector extends StatelessWidget {
  const _StepConnector({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 2,
      margin: const EdgeInsets.only(bottom: 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.3),
            AppColors.primary.withValues(alpha: 0.1),
          ],
        ),
      ),
    );
  }
}

class _VerticalConnector extends StatelessWidget {
  const _VerticalConnector({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 24,
      margin: const EdgeInsets.only(left: 23),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary.withValues(alpha: 0.3),
            AppColors.primary.withValues(alpha: 0.1),
          ],
        ),
      ),
    );
  }
}
