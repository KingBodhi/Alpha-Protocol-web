import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';

/// Learn Page - Benefits Section
///
/// Showcases the three core benefits of running an Alpha Node.
class BenefitsSection extends StatelessWidget {
  const BenefitsSection({super.key});

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
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                // Section Header
                Text(
                  'WHY RUN A NODE?',
                  style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                    letterSpacing: 4,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms),

                SizedBox(height: isDesktop ? 64 : 40),

                // Benefits Grid
                isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _BenefitCard(
                              icon: Icons.account_balance_wallet_outlined,
                              title: 'EARN REWARDS',
                              description:
                                  'Receive automatic token rewards for contributing '
                                  'bandwidth and storage to the network. Passive '
                                  'income from your infrastructure.',
                              isDark: isDark,
                              index: 0,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _BenefitCard(
                              icon: Icons.visibility_outlined,
                              title: 'VERIFY YOURSELF',
                              description:
                                  "Don't trust third parties with your data. Run your "
                                  'own node and verify everything directly. True '
                                  'digital sovereignty.',
                              isDark: isDark,
                              index: 1,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _BenefitCard(
                              icon: Icons.shield_outlined,
                              title: 'SECURE BY DESIGN',
                              description:
                                  'End-to-end encryption, isolated containers, and '
                                  'minimal attack surface. Your data stays yours, '
                                  'always.',
                              isDark: isDark,
                              index: 2,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          _BenefitCard(
                            icon: Icons.account_balance_wallet_outlined,
                            title: 'EARN REWARDS',
                            description:
                                'Receive automatic token rewards for contributing '
                                'bandwidth and storage to the network.',
                            isDark: isDark,
                            index: 0,
                          ),
                          const SizedBox(height: 16),
                          _BenefitCard(
                            icon: Icons.visibility_outlined,
                            title: 'VERIFY YOURSELF',
                            description:
                                "Don't trust third parties. Run your own node and "
                                'verify everything directly.',
                            isDark: isDark,
                            index: 1,
                          ),
                          const SizedBox(height: 16),
                          _BenefitCard(
                            icon: Icons.shield_outlined,
                            title: 'SECURE BY DESIGN',
                            description:
                                'End-to-end encryption and minimal attack surface. '
                                'Your data stays yours.',
                            isDark: isDark,
                            index: 2,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BenefitCard extends StatefulWidget {
  const _BenefitCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isDark,
    required this.index,
  });

  final IconData icon;
  final String title;
  final String description;
  final bool isDark;
  final int index;

  @override
  State<_BenefitCard> createState() => _BenefitCardState();
}

class _BenefitCardState extends State<_BenefitCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.card(widget.isDark),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? AppColors.primary.withValues(alpha: 0.5)
                : AppColors.border(widget.isDark),
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            // Icon
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: _isHovered
                    ? AppColors.primary.withValues(alpha: 0.2)
                    : AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                widget.icon,
                size: 36,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 24),

            // Title
            Text(
              widget.title,
              style: AppTypography.titleLarge(isDark: widget.isDark).copyWith(
                letterSpacing: 2,
                color: _isHovered ? AppColors.primary : null,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            // Description
            Text(
              widget.description,
              style: AppTypography.bodyMedium(isDark: widget.isDark).copyWith(
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(
          duration: 600.ms,
          delay: (200 * widget.index).ms,
        )
        .slideY(
          begin: 0.1,
          end: 0,
          duration: 600.ms,
          delay: (200 * widget.index).ms,
        );
  }
}
