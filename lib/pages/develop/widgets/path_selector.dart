import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';

/// Develop Page - Path Selector Section
///
/// Lets developers choose their path: Web Dev, Protocol Dev, or Operator.
class PathSelector extends StatelessWidget {
  const PathSelector({super.key});

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
                  'CHOOSE YOUR PATH',
                  style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                    letterSpacing: 4,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms),

                SizedBox(height: isDesktop ? 64 : 40),

                // Path Cards
                isDesktop
                    ? Row(
                        children: [
                          Expanded(
                            child: _PathCard(
                              icon: Icons.public_outlined,
                              emoji: '🌐',
                              title: 'WEB DEVELOPER',
                              description:
                                  'Build decentralized frontends, integrate with wallets, '
                                  'and connect to the network.',
                              features: [
                                'JavaScript/TypeScript SDKs',
                                'React/Vue components',
                                'Web3 wallet integration',
                              ],
                              cta: 'Frontend Guide',
                              isDark: isDark,
                              index: 0,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _PathCard(
                              icon: Icons.settings_outlined,
                              emoji: '⚙️',
                              title: 'PROTOCOL DEVELOPER',
                              description:
                                  'Build core protocol features, smart contracts, '
                                  'and low-level infrastructure.',
                              features: [
                                'Rust/Go SDKs',
                                'Contract templates',
                                'Testing framework',
                              ],
                              cta: 'Protocol Guide',
                              isDark: isDark,
                              highlight: true,
                              index: 1,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _PathCard(
                              icon: Icons.link_outlined,
                              emoji: '🔗',
                              title: 'NODE OPERATOR',
                              description:
                                  'Run infrastructure, deploy validators, and earn '
                                  'rewards for securing the network.',
                              features: [
                                'Docker deployment',
                                'Monitoring tools',
                                'Staking guides',
                              ],
                              cta: 'Operator Guide',
                              isDark: isDark,
                              index: 2,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          _PathCard(
                            icon: Icons.public_outlined,
                            emoji: '🌐',
                            title: 'WEB DEVELOPER',
                            description:
                                'Build decentralized frontends and integrate wallets.',
                            features: [
                              'JavaScript/TypeScript SDKs',
                              'React/Vue components',
                              'Web3 integration',
                            ],
                            cta: 'Frontend Guide',
                            isDark: isDark,
                            index: 0,
                          ),
                          const SizedBox(height: 16),
                          _PathCard(
                            icon: Icons.settings_outlined,
                            emoji: '⚙️',
                            title: 'PROTOCOL DEVELOPER',
                            description:
                                'Build core features, contracts, and infrastructure.',
                            features: [
                              'Rust/Go SDKs',
                              'Contract templates',
                              'Testing framework',
                            ],
                            cta: 'Protocol Guide',
                            isDark: isDark,
                            highlight: true,
                            index: 1,
                          ),
                          const SizedBox(height: 16),
                          _PathCard(
                            icon: Icons.link_outlined,
                            emoji: '🔗',
                            title: 'NODE OPERATOR',
                            description:
                                'Run infrastructure and earn rewards.',
                            features: [
                              'Docker deployment',
                              'Monitoring tools',
                              'Staking guides',
                            ],
                            cta: 'Operator Guide',
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

class _PathCard extends StatefulWidget {
  const _PathCard({
    required this.icon,
    required this.emoji,
    required this.title,
    required this.description,
    required this.features,
    required this.cta,
    required this.isDark,
    required this.index,
    this.highlight = false,
  });

  final IconData icon;
  final String emoji;
  final String title;
  final String description;
  final List<String> features;
  final String cta;
  final bool isDark;
  final int index;
  final bool highlight;

  @override
  State<_PathCard> createState() => _PathCardState();
}

class _PathCardState extends State<_PathCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: AppColors.card(widget.isDark),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _isHovered || widget.highlight
                  ? AppColors.primary
                  : AppColors.border(widget.isDark),
              width: widget.highlight ? 2 : 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.15),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: _isHovered || widget.highlight
                          ? AppColors.primary.withValues(alpha: 0.2)
                          : AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        widget.emoji,
                        style: const TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (widget.highlight)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Text(
                        'POPULAR',
                        style: AppTypography.labelSmall(isDark: widget.isDark)
                            .copyWith(
                          color: AppColors.primary,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 20),

              // Title
              Text(
                widget.title,
                style: AppTypography.titleLarge(isDark: widget.isDark).copyWith(
                  letterSpacing: 2,
                  color: _isHovered || widget.highlight
                      ? AppColors.primary
                      : null,
                ),
              ),

              const SizedBox(height: 12),

              // Description
              Text(
                widget.description,
                style: AppTypography.bodyMedium(isDark: widget.isDark).copyWith(
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 20),

              // Features List
              ...widget.features.map((feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 16,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          feature,
                          style: AppTypography.bodySmall(isDark: widget.isDark),
                        ),
                      ],
                    ),
                  )),

              const SizedBox(height: 16),

              // CTA
              Row(
                children: [
                  Text(
                    widget.cta,
                    style: AppTypography.labelLarge(isDark: widget.isDark)
                        .copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
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
