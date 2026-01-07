import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';

/// Develop Page - Tutorials Section
///
/// Showcases tutorials organized by difficulty level.
class TutorialsSection extends StatelessWidget {
  const TutorialsSection({super.key});

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
                  'TUTORIALS',
                  style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                    letterSpacing: 4,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms),

                const SizedBox(height: 12),

                Text(
                  'Step-by-step guides for every skill level',
                  style: AppTypography.bodyLarge(isDark: isDark).copyWith(
                    color: AppColors.textMuted(isDark),
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 100.ms),

                SizedBox(height: isDesktop ? 48 : 32),

                // Difficulty Levels
                isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _DifficultyColumn(
                              level: 'BEGINNER',
                              color: Colors.green,
                              emoji: '🟢',
                              tutorials: const [
                                _TutorialData(
                                  title: 'Hello World',
                                  time: '10 min',
                                  description: 'Send your first message',
                                ),
                                _TutorialData(
                                  title: 'Wallet Integration',
                                  time: '15 min',
                                  description: 'Connect a Web3 wallet',
                                ),
                                _TutorialData(
                                  title: 'Read Data',
                                  time: '15 min',
                                  description: 'Query the network',
                                ),
                              ],
                              isDark: isDark,
                              index: 0,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _DifficultyColumn(
                              level: 'INTERMEDIATE',
                              color: Colors.orange,
                              emoji: '🟡',
                              tutorials: const [
                                _TutorialData(
                                  title: 'Build a dApp',
                                  time: '45 min',
                                  description: 'Full-stack tutorial',
                                ),
                                _TutorialData(
                                  title: 'Smart Contracts',
                                  time: '1 hr',
                                  description: 'Write and deploy contracts',
                                ),
                                _TutorialData(
                                  title: 'State Channels',
                                  time: '45 min',
                                  description: 'Scalable messaging',
                                ),
                              ],
                              isDark: isDark,
                              index: 1,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _DifficultyColumn(
                              level: 'ADVANCED',
                              color: Colors.red,
                              emoji: '🔴',
                              tutorials: const [
                                _TutorialData(
                                  title: 'Custom Consensus',
                                  time: '2 hrs',
                                  description: 'Build a validator',
                                ),
                                _TutorialData(
                                  title: 'Cross-chain Bridge',
                                  time: '3 hrs',
                                  description: 'Interoperability',
                                ),
                                _TutorialData(
                                  title: 'Protocol Extensions',
                                  time: '2 hrs',
                                  description: 'Extend the protocol',
                                ),
                              ],
                              isDark: isDark,
                              index: 2,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          _DifficultyColumn(
                            level: 'BEGINNER',
                            color: Colors.green,
                            emoji: '🟢',
                            tutorials: const [
                              _TutorialData(
                                title: 'Hello World',
                                time: '10 min',
                                description: 'Send your first message',
                              ),
                              _TutorialData(
                                title: 'Wallet Integration',
                                time: '15 min',
                                description: 'Connect a Web3 wallet',
                              ),
                            ],
                            isDark: isDark,
                            index: 0,
                          ),
                          const SizedBox(height: 24),
                          _DifficultyColumn(
                            level: 'INTERMEDIATE',
                            color: Colors.orange,
                            emoji: '🟡',
                            tutorials: const [
                              _TutorialData(
                                title: 'Build a dApp',
                                time: '45 min',
                                description: 'Full-stack tutorial',
                              ),
                              _TutorialData(
                                title: 'Smart Contracts',
                                time: '1 hr',
                                description: 'Write and deploy contracts',
                              ),
                            ],
                            isDark: isDark,
                            index: 1,
                          ),
                          const SizedBox(height: 24),
                          _DifficultyColumn(
                            level: 'ADVANCED',
                            color: Colors.red,
                            emoji: '🔴',
                            tutorials: const [
                              _TutorialData(
                                title: 'Custom Consensus',
                                time: '2 hrs',
                                description: 'Build a validator',
                              ),
                              _TutorialData(
                                title: 'Cross-chain Bridge',
                                time: '3 hrs',
                                description: 'Interoperability',
                              ),
                            ],
                            isDark: isDark,
                            index: 2,
                          ),
                        ],
                      ),

                SizedBox(height: isDesktop ? 48 : 32),

                // View All Link
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View all tutorials',
                        style: AppTypography.labelLarge(isDark: isDark).copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 600.ms),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TutorialData {
  const _TutorialData({
    required this.title,
    required this.time,
    required this.description,
  });

  final String title;
  final String time;
  final String description;
}

class _DifficultyColumn extends StatelessWidget {
  const _DifficultyColumn({
    required this.level,
    required this.color,
    required this.emoji,
    required this.tutorials,
    required this.isDark,
    required this.index,
  });

  final String level;
  final Color color;
  final String emoji;
  final List<_TutorialData> tutorials;
  final bool isDark;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Level Header
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: color.withValues(alpha: 0.5),
                width: 2,
              ),
            ),
          ),
          child: Row(
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 8),
              Text(
                level,
                style: AppTypography.titleSmall(isDark: isDark).copyWith(
                  letterSpacing: 2,
                  color: color,
                ),
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: (200 * index).ms),

        const SizedBox(height: 16),

        // Tutorial List
        ...tutorials.asMap().entries.map((entry) {
          return _TutorialItem(
            data: entry.value,
            color: color,
            isDark: isDark,
            animationIndex: index * 3 + entry.key,
          );
        }),
      ],
    );
  }
}

class _TutorialItem extends StatefulWidget {
  const _TutorialItem({
    required this.data,
    required this.color,
    required this.isDark,
    required this.animationIndex,
  });

  final _TutorialData data;
  final Color color;
  final bool isDark;
  final int animationIndex;

  @override
  State<_TutorialItem> createState() => _TutorialItemState();
}

class _TutorialItemState extends State<_TutorialItem> {
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
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.card(widget.isDark)
                : AppColors.surface(widget.isDark),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered
                  ? widget.color.withValues(alpha: 0.5)
                  : AppColors.border(widget.isDark),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.title,
                      style: AppTypography.titleSmall(isDark: widget.isDark)
                          .copyWith(
                        color: _isHovered ? widget.color : null,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.data.description,
                      style: AppTypography.bodySmall(isDark: widget.isDark)
                          .copyWith(
                        color: AppColors.textMuted(widget.isDark),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.card(widget.isDark),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 12,
                      color: AppColors.textMuted(widget.isDark),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.data.time,
                      style: AppTypography.labelSmall(isDark: widget.isDark)
                          .copyWith(
                        color: AppColors.textMuted(widget.isDark),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(
          duration: 600.ms,
          delay: (100 * widget.animationIndex).ms,
        );
  }
}
