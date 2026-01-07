import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../controllers/theme_controller.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/spacing.dart';
import '../constants/routes.dart';
import '../constants/assets.dart';

/// Alpha Protocol - Custom Drawer
///
/// Side navigation drawer with animated menu items.
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;

        return Drawer(
          backgroundColor: AppColors.background(isDark),
          width: MediaQuery.of(context).size.width * 0.75,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header with logo
                _DrawerHeader(isDark: isDark),

                // Divider
                Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                  color: AppColors.primary.withOpacity(0.3),
                ),

                AppSpacing.gapVMd,

                // Navigation items
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                    ),
                    child: Column(
                      children: [
                        _DrawerItem(
                          icon: Icons.home_outlined,
                          title: 'Home',
                          route: AppRoutes.home,
                          isDark: isDark,
                          index: 0,
                        ),
                        _DrawerItem(
                          icon: Icons.school_outlined,
                          title: 'Learn',
                          route: AppRoutes.information,
                          isDark: isDark,
                          index: 1,
                        ),
                        _DrawerItem(
                          icon: Icons.code_outlined,
                          title: 'Develop',
                          route: AppRoutes.develop,
                          isDark: isDark,
                          index: 2,
                        ),

                        AppSpacing.gapVLg,

                        // Section header
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.md,
                            vertical: AppSpacing.sm,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.sm,
                                  vertical: AppSpacing.xxs,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.2),
                                  borderRadius: AppSpacing.borderRadiusFull,
                                ),
                                child: Text(
                                  'BETA',
                                  style: AppTypography.labelSmall(isDark: isDark)
                                      .copyWith(color: AppColors.primary),
                                ),
                              ),
                              AppSpacing.gapHSm,
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: AppColors.divider(isDark),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Beta products
                        _DrawerItem(
                          icon: Icons.rocket_launch_outlined,
                          title: 'Alpha Go',
                          route: AppRoutes.alphaGo,
                          isDark: isDark,
                          index: 3,
                          isBeta: true,
                        ),
                        _DrawerItem(
                          icon: Icons.wifi_outlined,
                          title: 'Omega Wireless',
                          route: AppRoutes.omegaWireless,
                          isDark: isDark,
                          index: 4,
                          isBeta: true,
                        ),
                        _DrawerItem(
                          icon: Icons.blur_circular_outlined,
                          title: 'Spectrum',
                          route: AppRoutes.spectrum,
                          isDark: isDark,
                          index: 5,
                          isBeta: true,
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom section
                _DrawerFooter(isDark: isDark),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Drawer header with logo
class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(AppRoutes.home);
            },
            child: Image.asset(
              AppAssets.getLogoMark(isDark),
              height: 80,
            ),
          ),
          AppSpacing.gapVMd,
          Text(
            'ALPHA PROTOCOL',
            style: AppTypography.overline(isDark: isDark),
          ),
          AppSpacing.gapVXxs,
          Text(
            'Where the Web Begins',
            style: AppTypography.bodySmall(isDark: isDark),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms)
        .slideY(begin: -0.2, end: 0);
  }
}

/// Drawer navigation item
class _DrawerItem extends StatefulWidget {
  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.route,
    required this.isDark,
    required this.index,
    this.isBeta = false,
  });

  final IconData icon;
  final String title;
  final String route;
  final bool isDark;
  final int index;
  final bool isBeta;

  @override
  State<_DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<_DrawerItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isActive = Get.currentRoute == widget.route;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: AppSpacing.durationFast,
        margin: const EdgeInsets.only(bottom: AppSpacing.xs),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primary.withOpacity(0.15)
              : (_isHovered
                  ? AppColors.card(widget.isDark).withOpacity(0.5)
                  : Colors.transparent),
          borderRadius: AppSpacing.borderRadius,
          border: Border.all(
            color: isActive
                ? AppColors.primary.withOpacity(0.3)
                : Colors.transparent,
            width: 1,
          ),
        ),
        child: ListTile(
          leading: Icon(
            widget.icon,
            color: isActive || _isHovered
                ? AppColors.primary
                : AppColors.textSecondary(widget.isDark),
            size: 22,
          ),
          title: Row(
            children: [
              Text(
                widget.title,
                style: AppTypography.titleSmall(isDark: widget.isDark).copyWith(
                  color: isActive || _isHovered
                      ? AppColors.primary
                      : AppColors.textColor(widget.isDark),
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
              if (widget.isBeta) ...[
                AppSpacing.gapHXs,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: AppSpacing.borderRadiusFull,
                  ),
                  child: Text(
                    'BETA',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ],
          ),
          trailing: isActive
              ? Container(
                  width: 4,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: AppSpacing.borderRadiusFull,
                  ),
                )
              : null,
          onTap: () {
            Navigator.pop(context);
            Get.toNamed(widget.route);
          },
          shape: RoundedRectangleBorder(
            borderRadius: AppSpacing.borderRadius,
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(
          duration: 300.ms,
          delay: (50 * widget.index).ms,
        )
        .slideX(
          begin: -0.2,
          end: 0,
          duration: 300.ms,
          delay: (50 * widget.index).ms,
        );
  }
}

/// Drawer footer with theme toggle
class _DrawerFooter extends StatelessWidget {
  const _DrawerFooter({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.divider(isDark),
          ),
        ),
      ),
      child: Row(
        children: [
          // Theme toggle
          Expanded(
            child: _ThemeToggleButton(isDark: isDark),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms, delay: 300.ms);
  }
}

/// Theme toggle button for drawer
class _ThemeToggleButton extends StatelessWidget {
  const _ThemeToggleButton({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ThemeController.to.toggleTheme(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.card(isDark),
          borderRadius: AppSpacing.borderRadius,
          border: Border.all(
            color: AppColors.border(isDark),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isDark ? Icons.wb_sunny_rounded : Icons.brightness_2_rounded,
              size: 18,
              color: AppColors.primary,
            ),
            AppSpacing.gapHSm,
            Text(
              isDark ? 'Light Mode' : 'Dark Mode',
              style: AppTypography.labelMedium(isDark: isDark),
            ),
          ],
        ),
      ),
    );
  }
}
