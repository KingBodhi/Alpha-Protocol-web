import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';
import '../../../components/buttons.dart';

/// Alpha Protocol - Network Snapshot Section
///
/// Displays network statistics.
class Snapshot extends StatelessWidget {
  const Snapshot({super.key});

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
          child: isDesktop
              ? _DesktopLayout(isDark: isDark)
              : _MobileLayout(isDark: isDark),
        );
      },
    );
  }
}

/// Desktop layout with side-by-side arrangement
class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left: Title and CTA
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NETWORK',
                  style: AppTypography.headlineLarge(isDark: isDark).copyWith(
                    letterSpacing: 4,
                  ),
                )
                    .animate()
                    .fadeIn(duration: 600.ms),

                Text(
                  'SNAPSHOT',
                  style: AppTypography.displayMedium(isDark: isDark).copyWith(
                    color: AppColors.primary,
                    letterSpacing: 6,
                  ),
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 100.ms),

                const SizedBox(height: 24),

                Text(
                  'Real-time statistics from the Alpha Protocol decentralized network.',
                  style: AppTypography.bodyLarge(isDark: isDark),
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 200.ms),

                const SizedBox(height: 32),

                SecondaryButton(
                  text: 'BECOME A NODE',
                  onPressed: () {},
                  icon: Icons.hub_outlined,
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 300.ms)
                    .slideX(begin: -0.1, end: 0),
              ],
            ),
          ),

          const SizedBox(width: 64),

          // Right: Stats Grid
          Expanded(
            flex: 6,
            child: _StatsGrid(isDark: isDark),
          ),
        ],
      ),
    );
  }
}

/// Mobile layout with stacked arrangement
class _MobileLayout extends StatelessWidget {
  const _MobileLayout({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title
        Text(
          'NETWORK',
          style: AppTypography.headlineMedium(isDark: isDark).copyWith(
            letterSpacing: 4,
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms),

        const SizedBox(height: 4),

        Text(
          'SNAPSHOT',
          style: AppTypography.displaySmall(isDark: isDark).copyWith(
            color: AppColors.primary,
            letterSpacing: 6,
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 100.ms),

        const SizedBox(height: 32),

        // Stats
        _StatsGrid(isDark: isDark),

        const SizedBox(height: 32),

        // CTA
        SecondaryButton(
          text: 'BECOME A NODE',
          onPressed: () {},
          icon: Icons.hub_outlined,
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 500.ms),
      ],
    );
  }
}

/// Stats grid display
class _StatsGrid extends StatelessWidget {
  const _StatsGrid({required this.isDark});

  final bool isDark;

  static const List<Map<String, dynamic>> stats = [
    {
      'title': 'TOTAL NETWORK NODES',
      'value': '11',
      'suffix': '',
      'icon': Icons.devices_outlined,
    },
    {
      'title': 'NETWORK BANDWIDTH',
      'value': '11.11',
      'suffix': 'GB/S',
      'icon': Icons.speed_outlined,
    },
    {
      'title': 'CLOUD DATABASE',
      'value': '5,000',
      'suffix': 'TB',
      'icon': Icons.cloud_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > AppSpacing.tabletMax;

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: stats.asMap().entries.map((entry) {
        return SizedBox(
          width: isDesktop ? 180 : (screenWidth - 80) / 2,
          child: _StatCard(
            title: entry.value['title'],
            value: entry.value['value'],
            suffix: entry.value['suffix'],
            icon: entry.value['icon'],
            isDark: isDark,
            index: entry.key,
          ),
        );
      }).toList(),
    );
  }
}

/// Individual stat card with animation
class _StatCard extends StatefulWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.suffix,
    required this.icon,
    required this.isDark,
    required this.index,
  });

  final String title;
  final String value;
  final String suffix;
  final IconData icon;
  final bool isDark;
  final int index;

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
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
                    color: AppColors.primary.withValues(alpha: 0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _isHovered
                    ? AppColors.primary.withValues(alpha: 0.2)
                    : AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.icon,
                size: 24,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 16),

            // Title
            Text(
              widget.title,
              style: AppTypography.labelSmall(isDark: widget.isDark).copyWith(
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            // Value
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.value,
                  style: AppTypography.statistic(isDark: widget.isDark),
                ),
                if (widget.suffix.isNotEmpty) ...[
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      widget.suffix,
                      style: AppTypography.labelMedium(isDark: widget.isDark)
                          .copyWith(color: AppColors.primary),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(
          duration: 600.ms,
          delay: (150 * widget.index).ms,
        )
        .slideY(
          begin: 0.1,
          end: 0,
          duration: 600.ms,
          delay: (150 * widget.index).ms,
        );
  }
}
