import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';

/// Develop Page - Developer Tools Grid
///
/// Showcases the available developer tools: CLI, SDKs, Components, etc.
class ToolsGrid extends StatelessWidget {
  const ToolsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > AppSpacing.tabletMax;
    final isTablet = screenWidth > AppSpacing.mobileMax;

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
                  'DEVELOPER TOOLS',
                  style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                    letterSpacing: 4,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms),

                const SizedBox(height: 12),

                Text(
                  'Everything you need to build, test, and deploy',
                  style: AppTypography.bodyLarge(isDark: isDark).copyWith(
                    color: AppColors.textMuted(isDark),
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 100.ms),

                SizedBox(height: isDesktop ? 64 : 40),

                // Tools Grid
                _buildGrid(isDark, isDesktop, isTablet),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGrid(bool isDark, bool isDesktop, bool isTablet) {
    final tools = [
      _ToolData(
        icon: Icons.terminal,
        title: 'CLI',
        description: 'Scaffold projects, deploy contracts, manage keys',
        tag: 'v2.0',
      ),
      _ToolData(
        icon: Icons.code,
        title: 'SDKs',
        description: 'TypeScript, Rust, Go, Python libraries',
        tag: '4 languages',
      ),
      _ToolData(
        icon: Icons.widgets_outlined,
        title: 'UI Components',
        description: 'Pre-built React/Vue components',
        tag: 'NEW',
        isHighlighted: true,
      ),
      _ToolData(
        icon: Icons.search,
        title: 'Explorer',
        description: 'Browse transactions, blocks, addresses',
        tag: null,
      ),
      _ToolData(
        icon: Icons.dashboard_outlined,
        title: 'Dashboard',
        description: 'Monitor your apps and usage',
        tag: null,
      ),
      _ToolData(
        icon: Icons.science_outlined,
        title: 'Testnet',
        description: 'Free test tokens, instant deployment',
        tag: null,
      ),
    ];

    if (isDesktop) {
      return GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 1.6,
        children: tools.asMap().entries.map((entry) {
          return _ToolCard(
            data: entry.value,
            isDark: isDark,
            index: entry.key,
          );
        }).toList(),
      );
    } else if (isTablet) {
      return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.4,
        children: tools.asMap().entries.map((entry) {
          return _ToolCard(
            data: entry.value,
            isDark: isDark,
            index: entry.key,
          );
        }).toList(),
      );
    } else {
      return Column(
        children: tools.asMap().entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _ToolCardMobile(
              data: entry.value,
              isDark: isDark,
              index: entry.key,
            ),
          );
        }).toList(),
      );
    }
  }
}

class _ToolData {
  const _ToolData({
    required this.icon,
    required this.title,
    required this.description,
    this.tag,
    this.isHighlighted = false,
  });

  final IconData icon;
  final String title;
  final String description;
  final String? tag;
  final bool isHighlighted;
}

class _ToolCard extends StatefulWidget {
  const _ToolCard({
    required this.data,
    required this.isDark,
    required this.index,
  });

  final _ToolData data;
  final bool isDark;
  final int index;

  @override
  State<_ToolCard> createState() => _ToolCardState();
}

class _ToolCardState extends State<_ToolCard> {
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
              color: _isHovered || widget.data.isHighlighted
                  ? AppColors.primary
                  : AppColors.border(widget.isDark),
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
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
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: _isHovered
                          ? AppColors.primary.withValues(alpha: 0.2)
                          : AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      widget.data.icon,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                  const Spacer(),
                  if (widget.data.tag != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: widget.data.isHighlighted
                            ? AppColors.primary.withValues(alpha: 0.2)
                            : AppColors.surface(widget.isDark),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.data.tag!,
                        style: AppTypography.labelSmall(isDark: widget.isDark)
                            .copyWith(
                          color: widget.data.isHighlighted
                              ? AppColors.primary
                              : AppColors.textMuted(widget.isDark),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 16),

              // Title
              Text(
                widget.data.title,
                style: AppTypography.titleMedium(isDark: widget.isDark).copyWith(
                  letterSpacing: 1,
                  color: _isHovered ? AppColors.primary : null,
                ),
              ),

              const SizedBox(height: 8),

              // Description
              Expanded(
                child: Text(
                  widget.data.description,
                  style: AppTypography.bodySmall(isDark: widget.isDark).copyWith(
                    height: 1.4,
                  ),
                ),
              ),

              // Arrow
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: _isHovered
                        ? AppColors.primary
                        : AppColors.textMuted(widget.isDark),
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
          delay: (100 * widget.index).ms,
        );
  }
}

class _ToolCardMobile extends StatelessWidget {
  const _ToolCardMobile({
    required this.data,
    required this.isDark,
    required this.index,
  });

  final _ToolData data;
  final bool isDark;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card(isDark),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: data.isHighlighted
              ? AppColors.primary
              : AppColors.border(isDark),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              data.icon,
              color: AppColors.primary,
              size: 22,
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
                      data.title,
                      style: AppTypography.titleSmall(isDark: isDark).copyWith(
                        letterSpacing: 1,
                      ),
                    ),
                    if (data.tag != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: data.isHighlighted
                              ? AppColors.primary.withValues(alpha: 0.2)
                              : AppColors.surface(isDark),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          data.tag!,
                          style: AppTypography.labelSmall(isDark: isDark)
                              .copyWith(
                            fontSize: 10,
                            color: data.isHighlighted
                                ? AppColors.primary
                                : AppColors.textMuted(isDark),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  data.description,
                  style: AppTypography.bodySmall(isDark: isDark).copyWith(
                    color: AppColors.textMuted(isDark),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: AppColors.textMuted(isDark),
            size: 20,
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: (80 * index).ms)
        .slideX(begin: 0.05, end: 0);
  }
}
