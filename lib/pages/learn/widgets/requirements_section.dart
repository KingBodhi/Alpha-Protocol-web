import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';

/// Learn Page - System Requirements & Resources Section
class RequirementsSection extends StatelessWidget {
  const RequirementsSection({super.key});

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
                // Requirements Card
                _RequirementsCard(isDark: isDark, isDesktop: isDesktop),

                SizedBox(height: isDesktop ? 48 : 32),

                // Resources Row
                _ResourcesRow(isDark: isDark, isDesktop: isDesktop),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RequirementsCard extends StatefulWidget {
  const _RequirementsCard({required this.isDark, required this.isDesktop});

  final bool isDark;
  final bool isDesktop;

  @override
  State<_RequirementsCard> createState() => _RequirementsCardState();
}

class _RequirementsCardState extends State<_RequirementsCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.card(widget.isDark),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border(widget.isDark)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(
                Icons.computer_outlined,
                color: AppColors.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'SYSTEM REQUIREMENTS',
                style: AppTypography.titleMedium(isDark: widget.isDark).copyWith(
                  letterSpacing: 2,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                child: Row(
                  children: [
                    Text(
                      _isExpanded ? 'Show less' : 'Show more',
                      style: AppTypography.labelMedium(isDark: widget.isDark)
                          .copyWith(color: AppColors.primary),
                    ),
                    const SizedBox(width: 4),
                    AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.expand_more,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Quick Requirements
          Wrap(
            spacing: widget.isDesktop ? 32 : 16,
            runSpacing: 12,
            children: [
              _RequirementBadge(
                icon: Icons.memory,
                label: '8 GB RAM',
                isDark: widget.isDark,
              ),
              _RequirementBadge(
                icon: Icons.storage,
                label: '50 GB Storage',
                isDark: widget.isDark,
              ),
              _RequirementBadge(
                icon: Icons.wifi,
                label: 'Broadband',
                isDark: widget.isDark,
              ),
            ],
          ),

          // Expanded Details
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: _ExpandedRequirements(
              isDark: widget.isDark,
              isDesktop: widget.isDesktop,
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms);
  }
}

class _RequirementBadge extends StatelessWidget {
  const _RequirementBadge({
    required this.icon,
    required this.label,
    required this.isDark,
  });

  final IconData icon;
  final String label;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surface(isDark),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border(isDark)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: AppColors.textSecondary(isDark)),
          const SizedBox(width: 8),
          Text(
            label,
            style: AppTypography.labelMedium(isDark: isDark),
          ),
        ],
      ),
    );
  }
}

class _ExpandedRequirements extends StatelessWidget {
  const _ExpandedRequirements({required this.isDark, required this.isDesktop});

  final bool isDark;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: AppColors.border(isDark)),
          const SizedBox(height: 20),

          // Minimum Requirements
          Text(
            'Minimum Requirements',
            style: AppTypography.titleSmall(isDark: isDark).copyWith(
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 12),
          _RequirementRow(
            label: 'Operating System',
            value: 'macOS 12+ / Windows 10+ / Ubuntu 20.04+',
            isDark: isDark,
          ),
          _RequirementRow(
            label: 'Memory',
            value: '8 GB RAM',
            isDark: isDark,
          ),
          _RequirementRow(
            label: 'Storage',
            value: '50 GB available (SSD recommended)',
            isDark: isDark,
          ),
          _RequirementRow(
            label: 'Network',
            value: 'Broadband connection (5+ Mbps)',
            isDark: isDark,
          ),

          const SizedBox(height: 20),

          // Recommended
          Text(
            'Recommended for Optimal Performance',
            style: AppTypography.titleSmall(isDark: isDark).copyWith(
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 12),
          _RequirementRow(
            label: 'Memory',
            value: '16 GB RAM',
            isDark: isDark,
          ),
          _RequirementRow(
            label: 'Storage',
            value: '100 GB SSD',
            isDark: isDark,
          ),
          _RequirementRow(
            label: 'Network',
            value: '10+ Mbps upload for better rewards',
            isDark: isDark,
          ),

          const SizedBox(height: 20),

          // Ports
          Text(
            'Port Requirements',
            style: AppTypography.titleSmall(isDark: isDark).copyWith(
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 12),
          _RequirementRow(
            label: 'P2P',
            value: 'TCP/UDP 30303',
            isDark: isDark,
          ),
          _RequirementRow(
            label: 'RPC (Optional)',
            value: 'TCP 8545',
            isDark: isDark,
          ),
        ],
      ),
    );
  }
}

class _RequirementRow extends StatelessWidget {
  const _RequirementRow({
    required this.label,
    required this.value,
    required this.isDark,
  });

  final String label;
  final String value;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: AppTypography.bodySmall(isDark: isDark).copyWith(
                color: AppColors.textMuted(isDark),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTypography.bodySmall(isDark: isDark),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResourcesRow extends StatelessWidget {
  const _ResourcesRow({required this.isDark, required this.isDesktop});

  final bool isDark;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 12,
      children: [
        _ResourceLink(
          icon: Icons.code,
          label: 'GitHub',
          isDark: isDark,
        ),
        _ResourceLink(
          icon: Icons.article_outlined,
          label: 'Documentation',
          isDark: isDark,
        ),
        _ResourceLink(
          icon: Icons.discord,
          label: 'Discord',
          isDark: isDark,
        ),
        _ResourceLink(
          icon: Icons.verified_user_outlined,
          label: 'Security Audit',
          isDark: isDark,
        ),
        _ResourceLink(
          icon: Icons.bug_report_outlined,
          label: 'Bug Bounty',
          isDark: isDark,
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: 200.ms);
  }
}

class _ResourceLink extends StatefulWidget {
  const _ResourceLink({
    required this.icon,
    required this.label,
    required this.isDark,
  });

  final IconData icon;
  final String label;
  final bool isDark;

  @override
  State<_ResourceLink> createState() => _ResourceLinkState();
}

class _ResourceLinkState extends State<_ResourceLink> {
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
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.primary.withValues(alpha: 0.1)
                : AppColors.card(widget.isDark),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered
                  ? AppColors.primary
                  : AppColors.border(widget.isDark),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 18,
                color: _isHovered
                    ? AppColors.primary
                    : AppColors.textSecondary(widget.isDark),
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: AppTypography.labelMedium(isDark: widget.isDark).copyWith(
                  color: _isHovered
                      ? AppColors.primary
                      : AppColors.textColor(widget.isDark),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
