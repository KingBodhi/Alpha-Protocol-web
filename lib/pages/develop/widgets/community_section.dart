import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';
import '../../../components/buttons.dart';

/// Develop Page - Community Section
///
/// Links to Discord, Forum, GitHub, Grants program.
class CommunitySection extends StatelessWidget {
  const CommunitySection({super.key});

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
                // Section Header
                Text(
                  'JOIN THE COMMUNITY',
                  style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                    letterSpacing: 4,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms),

                const SizedBox(height: 12),

                Text(
                  'Get help, share ideas, and connect with other builders',
                  style: AppTypography.bodyLarge(isDark: isDark).copyWith(
                    color: AppColors.textMuted(isDark),
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 100.ms),

                SizedBox(height: isDesktop ? 48 : 32),

                // Community Links Grid
                isDesktop
                    ? Row(
                        children: [
                          Expanded(
                            child: _CommunityCard(
                              icon: Icons.discord,
                              title: 'Discord',
                              description: 'Chat with the team and community',
                              stat: '15K+ members',
                              color: const Color(0xFF5865F2),
                              isDark: isDark,
                              index: 0,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: _CommunityCard(
                              icon: Icons.forum_outlined,
                              title: 'Forum',
                              description: 'Long-form discussions & RFCs',
                              stat: null,
                              color: AppColors.primary,
                              isDark: isDark,
                              index: 1,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: _CommunityCard(
                              icon: Icons.code,
                              title: 'GitHub',
                              description: 'Open source repos & issues',
                              stat: '2.5K+ stars',
                              color: const Color(0xFF333333),
                              isDark: isDark,
                              index: 2,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          _CommunityCard(
                            icon: Icons.discord,
                            title: 'Discord',
                            description: 'Chat with the team and community',
                            stat: '15K+ members',
                            color: const Color(0xFF5865F2),
                            isDark: isDark,
                            index: 0,
                          ),
                          const SizedBox(height: 12),
                          _CommunityCard(
                            icon: Icons.forum_outlined,
                            title: 'Forum',
                            description: 'Long-form discussions & RFCs',
                            stat: null,
                            color: AppColors.primary,
                            isDark: isDark,
                            index: 1,
                          ),
                          const SizedBox(height: 12),
                          _CommunityCard(
                            icon: Icons.code,
                            title: 'GitHub',
                            description: 'Open source repos & issues',
                            stat: '2.5K+ stars',
                            color: const Color(0xFF333333),
                            isDark: isDark,
                            index: 2,
                          ),
                        ],
                      ),

                SizedBox(height: isDesktop ? 48 : 32),

                // Grants CTA
                _GrantsCTA(isDark: isDark, isDesktop: isDesktop),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CommunityCard extends StatefulWidget {
  const _CommunityCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.stat,
    required this.color,
    required this.isDark,
    required this.index,
  });

  final IconData icon;
  final String title;
  final String description;
  final String? stat;
  final Color color;
  final bool isDark;
  final int index;

  @override
  State<_CommunityCard> createState() => _CommunityCardState();
}

class _CommunityCardState extends State<_CommunityCard> {
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
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.card(widget.isDark),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered
                  ? widget.color
                  : AppColors.border(widget.isDark),
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: widget.color.withValues(alpha: 0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: _isHovered
                      ? widget.color.withValues(alpha: 0.2)
                      : widget.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  widget.icon,
                  color: widget.color,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.title,
                          style: AppTypography.titleMedium(isDark: widget.isDark)
                              .copyWith(
                            color: _isHovered ? widget.color : null,
                          ),
                        ),
                        if (widget.stat != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: widget.color.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              widget.stat!,
                              style: AppTypography.labelSmall(isDark: widget.isDark)
                                  .copyWith(
                                color: widget.color,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.description,
                      style: AppTypography.bodySmall(isDark: widget.isDark)
                          .copyWith(
                        color: AppColors.textMuted(widget.isDark),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward,
                size: 18,
                color: _isHovered
                    ? widget.color
                    : AppColors.textMuted(widget.isDark),
              ),
            ],
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(
          duration: 600.ms,
          delay: (150 * widget.index).ms,
        );
  }
}

class _GrantsCTA extends StatefulWidget {
  const _GrantsCTA({required this.isDark, required this.isDesktop});

  final bool isDark;
  final bool isDesktop;

  @override
  State<_GrantsCTA> createState() => _GrantsCTAState();
}

class _GrantsCTAState extends State<_GrantsCTA> {
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
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary.withValues(alpha: _isHovered ? 0.2 : 0.15),
              AppColors.primary.withValues(alpha: _isHovered ? 0.1 : 0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: _isHovered ? 0.6 : 0.4),
          ),
        ),
        child: widget.isDesktop
            ? Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.rocket_launch_outlined,
                      color: AppColors.primary,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GRANTS PROGRAM',
                          style: AppTypography.titleLarge(isDark: widget.isDark)
                              .copyWith(
                            letterSpacing: 2,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Get funded to build on Alpha Protocol. Grants range from '
                          '\$5K to \$100K for impactful projects.',
                          style: AppTypography.bodyMedium(isDark: widget.isDark),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  PrimaryButton(
                    text: 'Apply Now',
                    onPressed: () {},
                  ),
                ],
              )
            : Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.rocket_launch_outlined,
                      color: AppColors.primary,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'GRANTS PROGRAM',
                    style: AppTypography.titleMedium(isDark: widget.isDark)
                        .copyWith(
                      letterSpacing: 2,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Get funded to build on Alpha Protocol. '
                    'Grants range from \$5K to \$100K.',
                    style: AppTypography.bodyMedium(isDark: widget.isDark),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    text: 'Apply Now',
                    onPressed: () {},
                  ),
                ],
              ),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: 500.ms);
  }
}
