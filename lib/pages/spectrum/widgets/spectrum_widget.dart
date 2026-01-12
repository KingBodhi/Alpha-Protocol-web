import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';
import '../../../constants/assets.dart';
import '../../../components/buttons.dart';

/// Spectrum Galactic - Satellite Connectivity Startup Page
class SpectrumWidget extends StatelessWidget {
  const SpectrumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > AppSpacing.tabletMax;

    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;

        return Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 24,
                vertical: isDesktop ? 100 : 64,
              ),
              child: Column(
                children: [
                  // Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Text(
                      'ALPHA PROTOCOL VENTURE',
                      style: AppTypography.labelSmall(isDark: isDark).copyWith(
                        color: AppColors.primary,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ).animate().fadeIn(duration: 600.ms),

                  const SizedBox(height: 32),

                  // Product Icon
                  Image.asset(
                    isDark ? AppAssets.spectrumIconDark : AppAssets.spectrumIcon,
                    height: isDesktop ? 160 : 120,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.satellite_alt_outlined,
                      size: isDesktop ? 160 : 120,
                      color: AppColors.primary,
                    ),
                  ).animate().fadeIn(duration: 600.ms, delay: 100.ms).scale(
                      begin: const Offset(0.8, 0.8),
                      end: const Offset(1, 1)),

                  SizedBox(height: isDesktop ? 40 : 28),

                  // Title
                  Text(
                    'SPECTRUM GALACTIC',
                    style: (isDesktop
                            ? AppTypography.displayMedium(isDark: isDark)
                            : AppTypography.displaySmall(isDark: isDark))
                        .copyWith(
                      letterSpacing: 6,
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms, delay: 200.ms),

                  const SizedBox(height: 12),

                  Text(
                    'GLOBAL SATELLITE CONNECTIVITY',
                    style: AppTypography.bodyLarge(isDark: isDark).copyWith(
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms, delay: 300.ms),

                  SizedBox(height: isDesktop ? 24 : 16),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Text(
                      'Spectrum Galactic is building the infrastructure to bring decentralized connectivity to every corner of Earth. '
                      'Our mission: deploy a constellation of low-earth orbit satellites integrated with the Alpha Protocol network.',
                      style: AppTypography.bodyMedium(isDark: isDark).copyWith(
                        color: AppColors.textSecondary(isDark),
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                  ),
                ],
              ),
            ),

            // Mission Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 24,
                vertical: isDesktop ? 64 : 40,
              ),
              color: AppColors.surface(isDark),
              child: Column(
                children: [
                  Text(
                    'THE MISSION',
                    style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                      letterSpacing: 4,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms),

                  SizedBox(height: isDesktop ? 48 : 32),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      alignment: WrapAlignment.center,
                      children: [
                        _MissionCard(
                          icon: Icons.public_outlined,
                          title: 'UNIVERSAL ACCESS',
                          description:
                              'Connectivity for the 3 billion people without reliable internet access.',
                          isDark: isDark,
                          isDesktop: isDesktop,
                          delay: 100,
                        ),
                        _MissionCard(
                          icon: Icons.lock_outline,
                          title: 'CENSORSHIP RESISTANT',
                          description:
                              'Satellite links that bypass terrestrial infrastructure and government control.',
                          isDark: isDark,
                          isDesktop: isDesktop,
                          delay: 200,
                        ),
                        _MissionCard(
                          icon: Icons.hub_outlined,
                          title: 'MESH INTEGRATED',
                          description:
                              'Seamlessly connects with ground-based Alpha Protocol nodes.',
                          isDark: isDark,
                          isDesktop: isDesktop,
                          delay: 300,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Roadmap Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 24,
                vertical: isDesktop ? 64 : 40,
              ),
              child: Column(
                children: [
                  Text(
                    'ROADMAP',
                    style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                      letterSpacing: 4,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms),

                  SizedBox(height: isDesktop ? 48 : 32),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Column(
                      children: [
                        _RoadmapItem(
                          phase: '01',
                          title: 'FOUNDATION',
                          description:
                              'Secure funding, assemble aerospace engineering team, begin satellite design.',
                          status: 'IN PROGRESS',
                          isDark: isDark,
                          delay: 100,
                        ),
                        _RoadmapItem(
                          phase: '02',
                          title: 'DEVELOPMENT',
                          description:
                              'Build and test prototype satellites, develop ground station network.',
                          status: 'UPCOMING',
                          isDark: isDark,
                          delay: 200,
                        ),
                        _RoadmapItem(
                          phase: '03',
                          title: 'LAUNCH',
                          description:
                              'Deploy initial constellation, begin beta service in select regions.',
                          status: 'UPCOMING',
                          isDark: isDark,
                          delay: 300,
                        ),
                        _RoadmapItem(
                          phase: '04',
                          title: 'EXPANSION',
                          description:
                              'Scale to global coverage, integrate with Alpha Protocol mainnet.',
                          status: 'UPCOMING',
                          isDark: isDark,
                          delay: 400,
                          isLast: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // CTA Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 24,
                vertical: isDesktop ? 80 : 48,
              ),
              color: AppColors.surface(isDark),
              child: Column(
                children: [
                  Text(
                    'JOIN THE JOURNEY',
                    style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                      letterSpacing: 4,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms),

                  const SizedBox(height: 12),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Text(
                      'Follow our progress as we work to bring decentralized satellite connectivity to the world.',
                      style: AppTypography.bodyMedium(isDark: isDark).copyWith(
                        color: AppColors.textSecondary(isDark),
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(duration: 600.ms, delay: 100.ms),
                  ),

                  const SizedBox(height: 32),

                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      SecondaryButton(
                        text: 'VISIT WEBSITE',
                        icon: Icons.open_in_new,
                        onPressed: () async {
                          final uri =
                              Uri.parse('https://spectrum-galactic.vercel.app');
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri,
                                mode: LaunchMode.externalApplication);
                          }
                        },
                      ),
                      SecondaryButton(
                        text: 'FOLLOW UPDATES',
                        icon: Icons.notifications_outlined,
                        onPressed: () {},
                      ),
                    ],
                  ).animate().fadeIn(duration: 600.ms, delay: 200.ms),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _MissionCard extends StatelessWidget {
  const _MissionCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isDark,
    required this.isDesktop,
    required this.delay,
  });

  final IconData icon;
  final String title;
  final String description;
  final bool isDark;
  final bool isDesktop;
  final int delay;

  @override
  Widget build(BuildContext context) {
    final cardWidth = isDesktop ? 300.0 : double.infinity;

    return SizedBox(
      width: cardWidth,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.card(isDark),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border(isDark)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primary, size: 28),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: AppTypography.titleSmall(isDark: isDark).copyWith(
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppTypography.bodySmall(isDark: isDark).copyWith(
                color: AppColors.textSecondary(isDark),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay));
  }
}

class _RoadmapItem extends StatelessWidget {
  const _RoadmapItem({
    required this.phase,
    required this.title,
    required this.description,
    required this.status,
    required this.isDark,
    required this.delay,
    this.isLast = false,
  });

  final String phase;
  final String title;
  final String description;
  final String status;
  final bool isDark;
  final int delay;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final isActive = status == 'IN PROGRESS';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline
        Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? AppColors.primary
                    : AppColors.card(isDark),
                border: Border.all(
                  color: isActive
                      ? AppColors.primary
                      : AppColors.border(isDark),
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  phase,
                  style: AppTypography.titleSmall(isDark: isDark).copyWith(
                    color: isActive ? Colors.white : AppColors.textMuted(isDark),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 60,
                color: AppColors.border(isDark),
              ),
          ],
        ),

        const SizedBox(width: 20),

        // Content
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: AppTypography.titleMedium(isDark: isDark).copyWith(
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: isActive
                            ? AppColors.primary.withValues(alpha: 0.12)
                            : AppColors.surface(isDark),
                      ),
                      child: Text(
                        status,
                        style: AppTypography.labelSmall(isDark: isDark).copyWith(
                          color: isActive
                              ? AppColors.primary
                              : AppColors.textMuted(isDark),
                          fontSize: 10,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: AppTypography.bodySmall(isDark: isDark).copyWith(
                    color: AppColors.textSecondary(isDark),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ).animate().fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay));
  }
}
