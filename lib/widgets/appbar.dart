import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/spacing.dart';
import '../constants/routes.dart';
import '../constants/assets.dart';

/// Alpha Protocol - Custom AppBar
///
/// Responsive navigation bar with theme toggle and hover effects.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > AppSpacing.tabletMax;

    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;

        return Container(
          height: kToolbarHeight,
          decoration: BoxDecoration(
            color: AppColors.background(isDark),
            border: const Border(
              bottom: BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isWideScreen ? 24 : 12,
          ),
          child: Row(
            children: [
              // Menu button
              _IconButton(
                icon: Icons.menu,
                onTap: () => scaffoldKey.currentState?.openDrawer(),
                isDark: isDark,
              ),

              const SizedBox(width: 12),

              // Logo
              _LogoButton(isDark: isDark),

              // Navigation links (desktop only)
              if (isWideScreen) ...[
                const SizedBox(width: 32),
                _NavLink(
                  text: 'Learn',
                  route: AppRoutes.information,
                  isDark: isDark,
                ),
                const SizedBox(width: 8),
                _NavLink(
                  text: 'Develop',
                  route: AppRoutes.develop,
                  isDark: isDark,
                ),
              ],

              const Spacer(),

              // Theme toggle
              _ThemeToggleButton(isDark: isDark),
            ],
          ),
        );
      },
    );
  }
}

/// Simple icon button
class _IconButton extends StatefulWidget {
  const _IconButton({
    required this.icon,
    required this.onTap,
    required this.isDark,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool isDark;

  @override
  State<_IconButton> createState() => _IconButtonState();
}

class _IconButtonState extends State<_IconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.card(widget.isDark)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            widget.icon,
            size: 24,
            color: _isHovered
                ? AppColors.primary
                : AppColors.textColor(widget.isDark),
          ),
        ),
      ),
    );
  }
}

/// Logo button with hover effect
class _LogoButton extends StatefulWidget {
  const _LogoButton({required this.isDark});

  final bool isDark;

  @override
  State<_LogoButton> createState() => _LogoButtonState();
}

class _LogoButtonState extends State<_LogoButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Get.offAllNamed(AppRoutes.home),
        child: AnimatedOpacity(
          opacity: _isHovered ? 1.0 : 0.85,
          duration: const Duration(milliseconds: 150),
          child: Image.asset(
            AppAssets.getLogo(widget.isDark),
            height: 32,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => Text(
              'ALPHA',
              style: AppTypography.titleLarge(isDark: widget.isDark).copyWith(
                color: AppColors.primary,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Navigation link with hover underline
class _NavLink extends StatefulWidget {
  const _NavLink({
    required this.text,
    required this.route,
    required this.isDark,
  });

  final String text;
  final String route;
  final bool isDark;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isActive = Get.currentRoute == widget.route;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Get.toNamed(widget.route),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive || _isHovered
                    ? AppColors.primary
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.text.toUpperCase(),
            style: AppTypography.navigation(
              isDark: widget.isDark,
              isActive: isActive || _isHovered,
            ),
          ),
        ),
      ),
    );
  }
}

/// Theme toggle button
class _ThemeToggleButton extends StatefulWidget {
  const _ThemeToggleButton({required this.isDark});

  final bool isDark;

  @override
  State<_ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<_ThemeToggleButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: widget.isDark ? 'Light Mode' : 'Dark Mode',
        child: GestureDetector(
          onTap: () => ThemeController.to.toggleTheme(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _isHovered
                  ? AppColors.card(widget.isDark)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(begin: 0.5, end: 1.0).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: Icon(
                widget.isDark
                    ? Icons.wb_sunny_rounded
                    : Icons.dark_mode_rounded,
                key: ValueKey(widget.isDark),
                size: 22,
                color: _isHovered
                    ? AppColors.primary
                    : AppColors.textColor(widget.isDark),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
