import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/typography.dart';

/// Shared primary download button used across hero and learn sections.
class DownloadCtaButton extends StatefulWidget {
  const DownloadCtaButton({
    super.key,
    required this.title,
    required this.icon,
    required this.isDesktop,
    this.subtitle,
    this.onPressed,
    this.width,
    this.isFullWidth = false,
  });

  final String title;
  final String? subtitle;
  final IconData icon;
  final bool isDesktop;
  final VoidCallback? onPressed;
  final double? width;
  final bool isFullWidth;

  @override
  State<DownloadCtaButton> createState() => _DownloadCtaButtonState();
}

class _DownloadCtaButtonState extends State<DownloadCtaButton> {
  bool _isHovered = false;

  void _setHover(bool value) {
    if (!mounted) return;
    setState(() => _isHovered = value);
  }

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(
      horizontal: widget.isDesktop ? 48 : 32,
      vertical: widget.isDesktop ? 20 : 16,
    );

    final targetWidth = widget.isFullWidth ? double.infinity : widget.width;
    final bool shouldExpandText = widget.isFullWidth || widget.width != null;

    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: SizedBox(
          width: targetWidth,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: padding,
            decoration: BoxDecoration(
              gradient: _isHovered
                  ? const LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primaryLight,
                      ],
                    )
                  : null,
              color: _isHovered ? null : AppColors.primary,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(
                    alpha: _isHovered ? 0.4 : 0.2,
                  ),
                  blurRadius: _isHovered ? 24 : 12,
                  offset: Offset(0, _isHovered ? 8 : 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize:
                  shouldExpandText ? MainAxisSize.max : MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  color: Colors.white,
                  size: widget.isDesktop ? 28 : 24,
                ),
                SizedBox(width: widget.isDesktop ? 16 : 12),
                if (shouldExpandText)
                  Expanded(child: _DownloadTexts(button: widget))
                else
                  _DownloadTexts(button: widget),
                SizedBox(width: widget.isDesktop ? 16 : 12),
                AnimatedRotation(
                  turns: _isHovered ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.arrow_downward_rounded,
                    color: Colors.white,
                    size: widget.isDesktop ? 24 : 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DownloadTexts extends StatelessWidget {
  const _DownloadTexts({required this.button});

  final DownloadCtaButton button;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          button.title,
          style: AppTypography.titleMedium(isDark: true).copyWith(
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
        if (button.subtitle != null) ...[
          Text(
            button.subtitle!,
            style: AppTypography.labelSmall(isDark: true).copyWith(
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ),
        ],
      ],
    );
  }
}
