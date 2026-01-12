import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';
import '../../../constants/routes.dart';
import '../../../constants/assets.dart';
import '../../../components/download_button.dart';
import '../../../utils/download_helper.dart';

/// Alpha Protocol - Hero Section
///
/// Main hero section with animated text and beta apps carousel.
class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  Future<void> _handleDownload(
    BuildContext context,
    DownloadTarget target,
  ) async {
    await DownloadHelper.launchWithFallback(
      context,
      platformOverride: target.platform,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isDesktopLayout = screenWidth >= AppSpacing.desktopMin;
    final bool isTabletOrLarger = screenWidth > AppSpacing.mobileMax;
    final bool isLargeTablet = screenWidth > AppSpacing.tabletMax &&
        screenWidth < AppSpacing.desktopMin;

    double horizontalPadding;
    if (screenWidth >= AppSpacing.wideDesktopMin) {
      horizontalPadding = 140;
    } else if (isDesktopLayout) {
      horizontalPadding = 100;
    } else if (isLargeTablet) {
      horizontalPadding = 64;
    } else if (isTabletOrLarger) {
      horizontalPadding = 36;
    } else {
      horizontalPadding = 24;
    }

    final double verticalPadding =
        isDesktopLayout ? 120 : (isTabletOrLarger ? 88 : 56);
    final double textToCtaSpacing = isTabletOrLarger ? 32 : 24;
    final double carouselHeight =
        isDesktopLayout ? 340 : (isTabletOrLarger ? 300 : 280);
    final downloadTarget = DownloadHelper.currentTarget();

    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          constraints: BoxConstraints(
            minHeight: isDesktopLayout ? 640 : 520,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isDesktopLayout ? 1320 : 1100,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _HeroText(
                    isDark: isDark,
                    isDesktop: isTabletOrLarger,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: textToCtaSpacing),
                  Align(
                    alignment: Alignment.center,
                    child: DownloadCtaButton(
                      title: downloadTarget.buttonLabel,
                      subtitle: 'v1.0.0',
                      icon: downloadTarget.icon,
                      isDesktop: isTabletOrLarger,
                      isFullWidth: !isTabletOrLarger,
                      onPressed: () => _handleDownload(
                        context,
                        downloadTarget,
                      ),
                    ),
                  ),
                  SizedBox(height: isTabletOrLarger ? 64 : 48),
                  BetaAppsCarousel(
                    isDark: isDark,
                    isDesktop: isDesktopLayout,
                    isTablet: isTabletOrLarger,
                    height: carouselHeight,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Animated hero text
class _HeroText extends StatelessWidget {
  const _HeroText({
    required this.isDark,
    required this.isDesktop,
    this.textAlign = TextAlign.center,
  });

  final bool isDark;
  final bool isDesktop;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'WHERE THE WEB',
          style: (isDesktop
                  ? AppTypography.displaySmall(isDark: isDark)
                  : AppTypography.headlineLarge(isDark: isDark))
              .copyWith(letterSpacing: 4),
          textAlign: textAlign,
        ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.3, end: 0),

        const SizedBox(height: 8),

        Text(
          'B E G I N S',
          style: (isDesktop
                  ? AppTypography.displayLarge(isDark: isDark)
                  : AppTypography.displayMedium(isDark: isDark))
              .copyWith(
            letterSpacing: isDesktop ? 12 : 8,
            color: AppColors.primary,
          ),
          textAlign: textAlign,
        )
            .animate()
            .fadeIn(duration: 800.ms, delay: 200.ms)
            .slideY(begin: 0.3, end: 0),

        SizedBox(height: isDesktop ? 32 : 24),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Text(
            'ALPHA PROTOCOL IS A DECENTRALIZED WEB SOLUTION WITH BITCOIN INCENTIVES',
            style: AppTypography.bodyLarge(isDark: isDark).copyWith(
              letterSpacing: 1.5,
              height: 1.8,
            ),
            textAlign: textAlign,
          ).animate().fadeIn(duration: 800.ms, delay: 400.ms),
        ),
      ],
    );
  }
}

/// Beta Apps Carousel with continuous scroll and navigation controls
class BetaAppsCarousel extends StatefulWidget {
  const BetaAppsCarousel({
    super.key,
    required this.isDark,
    required this.isDesktop,
    required this.isTablet,
    required this.height,
  });

  final bool isDark;
  final bool isDesktop;
  final bool isTablet;
  final double height;

  @override
  State<BetaAppsCarousel> createState() => _BetaAppsCarouselState();
}

class _BetaAppsCarouselState extends State<BetaAppsCarousel> {
  late final ScrollController _scrollController;
  Timer? _autoScrollTimer;
  bool _isHovered = false;

  double get _cardWidth {
    if (widget.isDesktop) return 340;
    if (widget.isTablet) return 300;
    return 280;
  }

  double get _cardSpacing => 16;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll());
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    const scrollSpeed = 0.8;
    const interval = Duration(milliseconds: 16);

    _autoScrollTimer = Timer.periodic(interval, (_) {
      if (!_scrollController.hasClients || _isHovered) return;

      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      final newScroll = currentScroll + scrollSpeed;

      if (newScroll >= maxScroll) {
        _scrollController.jumpTo(0);
      } else {
        _scrollController.jumpTo(newScroll);
      }
    });
  }

  void _scrollLeft() {
    final newOffset = (_scrollController.offset - (_cardWidth + _cardSpacing))
        .clamp(0.0, _scrollController.position.maxScrollExtent);
    _scrollController.animateTo(
      newOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _scrollRight() {
    final newOffset = (_scrollController.offset + (_cardWidth + _cardSpacing))
        .clamp(0.0, _scrollController.position.maxScrollExtent);
    _scrollController.animateTo(
      newOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Duplicate items for seamless loop
    final items = [..._betaProducts, ..._betaProducts, ..._betaProducts];

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: AppColors.card(widget.isDark).withValues(alpha: 0.9),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 30,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header with navigation
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: SizedBox(
                height: 36,
                child: Stack(
                  children: [
                    // Centered badge
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: AppColors.primary.withValues(alpha: 0.12),
                        ),
                        child: Text(
                          'BETA APPS',
                          style: AppTypography.labelSmall(isDark: widget.isDark)
                              .copyWith(
                            color: AppColors.primary,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    // Navigation arrows on the right
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _NavButton(
                            icon: Icons.arrow_back_ios_rounded,
                            onTap: _scrollLeft,
                            isDark: widget.isDark,
                          ),
                          const SizedBox(width: 8),
                          _NavButton(
                            icon: Icons.arrow_forward_ios_rounded,
                            onTap: _scrollRight,
                            isDark: widget.isDark,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Carousel content
            Expanded(
              child: ListView.separated(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                itemCount: items.length,
                separatorBuilder: (_, __) => SizedBox(width: _cardSpacing),
                itemBuilder: (context, index) {
                  final product = items[index];
                  return SizedBox(
                    width: _cardWidth,
                    child: _BetaAppCard(
                      product: product,
                      isDark: widget.isDark,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 500.ms);
  }
}

/// Navigation button for carousel
class _NavButton extends StatefulWidget {
  const _NavButton({
    required this.icon,
    required this.onTap,
    required this.isDark,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool isDark;

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _hovered
                ? AppColors.primary.withValues(alpha: 0.15)
                : Colors.transparent,
            border: Border.all(
              color: _hovered
                  ? AppColors.primary
                  : AppColors.border(widget.isDark),
            ),
          ),
          child: Icon(
            widget.icon,
            size: 16,
            color: _hovered
                ? AppColors.primary
                : AppColors.textMuted(widget.isDark),
          ),
        ),
      ),
    );
  }
}

/// Beta products data
const List<Map<String, dynamic>> _betaProducts = [
  {
    'name': 'Alpha Go',
    'route': AppRoutes.alphaGo,
    'externalUrl': 'https://go.alphaprotocol.network',
    'iconLight': AppAssets.alphaGoIcon,
    'iconDark': AppAssets.alphaGoIconDark,
    'tagline': 'Mobile VPN + Rewards',
    'description':
        'Secure mobile browsing with built-in Bitcoin rewards for your bandwidth contribution.',
  },
  {
    'name': 'Omega Wireless',
    'route': AppRoutes.omegaWireless,
    'externalUrl': 'https://omega-wireless.vercel.app',
    'iconLight': AppAssets.omegaWirelessIcon,
    'iconDark': AppAssets.omegaWirelessIconDark,
    'tagline': 'Hardware Mesh Nodes',
    'description':
        'Deploy physical mesh network nodes and earn passive income.',
  },
  {
    'name': 'Spectrum Galactic',
    'route': AppRoutes.spectrum,
    'externalUrl': 'https://spectrum-galactic.vercel.app',
    'iconLight': AppAssets.spectrumIcon,
    'iconDark': AppAssets.spectrumIconDark,
    'tagline': 'Satellite Global Reach',
    'description':
        'Global satellite connectivity bringing Alpha Protocol to every corner of Earth.',
  },
];

/// Individual beta app card
class _BetaAppCard extends StatefulWidget {
  const _BetaAppCard({
    required this.product,
    required this.isDark,
  });

  final Map<String, dynamic> product;
  final bool isDark;

  @override
  State<_BetaAppCard> createState() => _BetaAppCardState();
}

class _BetaAppCardState extends State<_BetaAppCard> {
  bool _hovered = false;

  void _navigate() {
    final route = widget.product['route'] as String;
    Get.toNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    final iconPath = widget.isDark
        ? widget.product['iconDark'] as String
        : widget.product['iconLight'] as String;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _navigate,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface(widget.isDark),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _hovered
                  ? AppColors.primary.withValues(alpha: 0.6)
                  : AppColors.border(widget.isDark),
              width: _hovered ? 1.5 : 1,
            ),
            boxShadow: _hovered
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Icon
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.primary.withValues(alpha: 0.12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(iconPath, fit: BoxFit.contain),
                    ),
                  ),
                  const Spacer(),
                  // Launch icon
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _hovered
                          ? AppColors.primary.withValues(alpha: 0.12)
                          : Colors.transparent,
                    ),
                    child: Icon(
                      Icons.north_east_rounded,
                      size: 20,
                      color: _hovered
                          ? AppColors.primary
                          : AppColors.textMuted(widget.isDark),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Name
              Text(
                widget.product['name'] as String,
                style:
                    AppTypography.titleMedium(isDark: widget.isDark).copyWith(
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 4),

              // Tagline
              Text(
                widget.product['tagline'] as String,
                style:
                    AppTypography.labelMedium(isDark: widget.isDark).copyWith(
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 12),

              // Description
              Expanded(
                child: Text(
                  widget.product['description'] as String,
                  style: AppTypography.bodySmall(isDark: widget.isDark).copyWith(
                    color: AppColors.textSecondary(widget.isDark),
                    height: 1.5,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Platform icons helper - use this for platform chips elsewhere
class PlatformIcons {
  static const IconData macOS = Icons.apple;
  static const IconData windows = Icons.window;
  static IconData get linux => FontAwesomeIcons.linux;
}
