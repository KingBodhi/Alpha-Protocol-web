import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';

/// Develop Page - Decentralized Info Section
class DecentralizedInfoWidget extends StatelessWidget {
  const DecentralizedInfoWidget({super.key});

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
                _FeatureCard(
                  icon: Icons.hub_outlined,
                  title: 'DECENTRALIZED WEB NODES',
                  description:
                      'HOST PRIVATE NETWORKS AND CONNECT THE DECENTRALIZED WEB',
                  isDark: isDark,
                  isDesktop: isDesktop,
                  index: 0,
                ),
                SizedBox(height: isDesktop ? 24 : 16),
                _FeatureCard(
                  icon: Icons.fingerprint_outlined,
                  title: 'DECENTRALIZED IDENTIFIERS',
                  description: 'OWN AND CONTROL YOUR IDENTITIES',
                  isDark: isDark,
                  isDesktop: isDesktop,
                  index: 1,
                ),
                SizedBox(height: isDesktop ? 24 : 16),
                _FeatureCard(
                  icon: Icons.apps_outlined,
                  title: 'DECENTRALIZED APPLICATIONS',
                  description: 'BUILD AND DEPLOY APPS ON THE DECENTRALIZED WEB',
                  isDark: isDark,
                  isDesktop: isDesktop,
                  index: 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FeatureCard extends StatefulWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isDark,
    required this.isDesktop,
    required this.index,
  });

  final IconData icon;
  final String title;
  final String description;
  final bool isDark;
  final bool isDesktop;
  final int index;

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.all(widget.isDesktop ? 40 : 24),
        decoration: BoxDecoration(
          color: AppColors.card(widget.isDark),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? AppColors.primary.withValues(alpha: 0.5)
                : AppColors.border(widget.isDark),
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            // Icon
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: widget.isDesktop ? 80 : 60,
              height: widget.isDesktop ? 80 : 60,
              decoration: BoxDecoration(
                color: _isHovered
                    ? AppColors.primary.withValues(alpha: 0.2)
                    : AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                widget.icon,
                size: widget.isDesktop ? 40 : 32,
                color: AppColors.primary,
              ),
            ),

            SizedBox(width: widget.isDesktop ? 32 : 20),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: (widget.isDesktop
                            ? AppTypography.titleLarge(isDark: widget.isDark)
                            : AppTypography.titleMedium(isDark: widget.isDark))
                        .copyWith(
                      letterSpacing: 2,
                      color: _isHovered ? AppColors.primary : null,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: AppTypography.bodyMedium(isDark: widget.isDark),
                  ),
                ],
              ),
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
