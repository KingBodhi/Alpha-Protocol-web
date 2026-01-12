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
import '../../../widgets/footer.dart';

/// Omega Wireless - Hardware Mesh Network Page
class OmegaWidget extends StatelessWidget {
  const OmegaWidget({super.key});

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
                  // Product Icon
                  Image.asset(
                    isDark
                        ? AppAssets.omegaWirelessIconDark
                        : AppAssets.omegaWirelessIcon,
                    height: isDesktop ? 180 : 140,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.router_outlined,
                      size: isDesktop ? 180 : 140,
                      color: AppColors.primary,
                    ),
                  ).animate().fadeIn(duration: 600.ms).scale(
                      begin: const Offset(0.8, 0.8),
                      end: const Offset(1, 1)),

                  SizedBox(height: isDesktop ? 40 : 28),

                  // Title
                  Text(
                    'OMEGA WIRELESS',
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
                    'DECENTRALIZED MESH NETWORK HARDWARE',
                    style: AppTypography.bodyLarge(isDark: isDark).copyWith(
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms, delay: 300.ms),

                  SizedBox(height: isDesktop ? 24 : 16),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 650),
                    child: Text(
                      'Deploy physical network nodes that extend the Alpha Protocol mesh. '
                      'Earn passive Bitcoin income while providing censorship-resistant connectivity to your community.',
                      style: AppTypography.bodyMedium(isDark: isDark).copyWith(
                        color: AppColors.textSecondary(isDark),
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                  ),

                  const SizedBox(height: 32),

                  SecondaryButton(
                    text: 'VISIT WEBSITE',
                    icon: Icons.open_in_new,
                    onPressed: () async {
                      final uri = Uri.parse('https://omega-wireless.vercel.app');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                  ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
                ],
              ),
            ),

            // Hardware Specs Section
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
                    'NODE SPECIFICATIONS',
                    style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                      letterSpacing: 4,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms),

                  SizedBox(height: isDesktop ? 48 : 32),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      alignment: WrapAlignment.center,
                      children: [
                        _SpecCard(
                          icon: Icons.wifi_outlined,
                          title: 'DUAL-BAND WIFI 6',
                          value: '2.4 + 5 GHz',
                          isDark: isDark,
                          isDesktop: isDesktop,
                          delay: 100,
                        ),
                        _SpecCard(
                          icon: Icons.memory_outlined,
                          title: 'PROCESSING',
                          value: 'ARM Cortex-A72',
                          isDark: isDark,
                          isDesktop: isDesktop,
                          delay: 200,
                        ),
                        _SpecCard(
                          icon: Icons.storage_outlined,
                          title: 'STORAGE',
                          value: '128GB SSD',
                          isDark: isDark,
                          isDesktop: isDesktop,
                          delay: 300,
                        ),
                        _SpecCard(
                          icon: Icons.lan_outlined,
                          title: 'CONNECTIVITY',
                          value: '2.5GbE Ports',
                          isDark: isDark,
                          isDesktop: isDesktop,
                          delay: 400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Benefits Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 24,
                vertical: isDesktop ? 64 : 40,
              ),
              child: Column(
                children: [
                  Text(
                    'WHY RUN A NODE',
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
                        _BenefitCard(
                          icon: Icons.currency_bitcoin,
                          title: 'PASSIVE INCOME',
                          description:
                              'Earn Bitcoin automatically for routing traffic through your node.',
                          isDark: isDark,
                          isDesktop: isDesktop,
                          delay: 100,
                        ),
                        _BenefitCard(
                          icon: Icons.public_outlined,
                          title: 'EXPAND THE NETWORK',
                          description:
                              'Help build censorship-resistant infrastructure for your community.',
                          isDark: isDark,
                          isDesktop: isDesktop,
                          delay: 200,
                        ),
                        _BenefitCard(
                          icon: Icons.bolt_outlined,
                          title: 'PLUG & PLAY',
                          description:
                              'Simple setup - connect power and ethernet, node auto-configures.',
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: AppColors.primary.withValues(alpha: 0.12),
                    ),
                    child: Text(
                      'NOW AVAILABLE',
                      style: AppTypography.labelSmall(isDark: isDark).copyWith(
                        color: AppColors.primary,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ).animate().fadeIn(duration: 600.ms),

                  const SizedBox(height: 24),

                  Text(
                    'GET YOUR NODE',
                    style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                      letterSpacing: 4,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms, delay: 100.ms),

                  const SizedBox(height: 12),

                  Text(
                    'Start earning passive Bitcoin income with your own Omega node.',
                    style: AppTypography.bodyMedium(isDark: isDark).copyWith(
                      color: AppColors.textSecondary(isDark),
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms, delay: 200.ms),

                  const SizedBox(height: 32),

                  PrimaryButton(
                    text: 'SHOP NOW',
                    onPressed: () async {
                      final uri = Uri.parse('https://omega-wireless.vercel.app');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                  ).animate().fadeIn(duration: 600.ms, delay: 300.ms),
                ],
              ),
            ),

            const Footer(),
          ],
        );
      },
    );
  }
}

class _SpecCard extends StatelessWidget {
  const _SpecCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.isDark,
    required this.isDesktop,
    required this.delay,
  });

  final IconData icon;
  final String title;
  final String value;
  final bool isDark;
  final bool isDesktop;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isDesktop ? 200.0 : 150.0,
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 32),
          const SizedBox(height: 12),
          Text(
            title,
            style: AppTypography.labelSmall(isDark: isDark).copyWith(
              letterSpacing: 1,
              color: AppColors.textSecondary(isDark),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTypography.titleMedium(isDark: isDark).copyWith(
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay));
  }
}

class _BenefitCard extends StatelessWidget {
  const _BenefitCard({
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

