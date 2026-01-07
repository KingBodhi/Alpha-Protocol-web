import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';
import '../../../constants/routes.dart';
import '../../../constants/assets.dart';
import '../../../components/buttons.dart';

/// Alpha Protocol - Hero Section
///
/// Main hero section with animated text and product carousel.
class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

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
          child: Column(
            children: [
              // Hero Text Section
              _HeroText(isDark: isDark, isDesktop: isDesktop),

              SizedBox(height: isDesktop ? 48 : 32),

              // CTA Button
              AnimatedCtaButton(
                text: 'ENTER',
                onPressed: () => Get.toNamed(AppRoutes.information),
                width: isDesktop ? 200 : 160,
              ),

              SizedBox(height: isDesktop ? 80 : 48),

              // Beta Projects Section
              _BetaProjectsSection(isDark: isDark, isDesktop: isDesktop),
            ],
          ),
        );
      },
    );
  }
}

/// Animated hero text
class _HeroText extends StatelessWidget {
  const _HeroText({required this.isDark, required this.isDesktop});

  final bool isDark;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // "WHERE THE WEB"
        Text(
          'WHERE THE WEB',
          style: (isDesktop
                  ? AppTypography.displaySmall(isDark: isDark)
                  : AppTypography.headlineLarge(isDark: isDark))
              .copyWith(letterSpacing: 4),
          textAlign: TextAlign.center,
        )
            .animate()
            .fadeIn(duration: 800.ms)
            .slideY(begin: -0.3, end: 0),

        const SizedBox(height: 8),

        // "B E G I N S"
        Text(
          'B E G I N S',
          style: (isDesktop
                  ? AppTypography.displayLarge(isDark: isDark)
                  : AppTypography.displayMedium(isDark: isDark))
              .copyWith(
            letterSpacing: isDesktop ? 12 : 8,
            color: AppColors.primary,
          ),
          textAlign: TextAlign.center,
        )
            .animate()
            .fadeIn(duration: 800.ms, delay: 200.ms)
            .slideY(begin: 0.3, end: 0),

        SizedBox(height: isDesktop ? 32 : 24),

        // Description
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Text(
            'ALPHA PROTOCOL IS A DECENTRALIZED WEB SOLUTION WITH BITCOIN INCENTIVES',
            style: AppTypography.bodyLarge(isDark: isDark).copyWith(
              letterSpacing: 1.5,
              height: 1.8,
            ),
            textAlign: TextAlign.center,
          )
              .animate()
              .fadeIn(duration: 800.ms, delay: 400.ms),
        ),
      ],
    );
  }
}

/// Beta projects carousel section
class _BetaProjectsSection extends StatelessWidget {
  const _BetaProjectsSection({
    required this.isDark,
    required this.isDesktop,
  });

  final bool isDark;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.5),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'BETA',
                style: AppTypography.labelSmall(isDark: isDark).copyWith(
                  color: AppColors.primary,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'PROJECTS',
              style: AppTypography.titleSmall(isDark: isDark).copyWith(
                letterSpacing: 4,
              ),
            ),
          ],
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 600.ms),

        const SizedBox(height: 32),

        // Products Grid/Row
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: isDesktop
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _ProductCard(index: 0, isDark: isDark),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _ProductCard(index: 1, isDark: isDark),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _ProductCard(index: 2, isDark: isDark),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _ProductCard(index: 0, isDark: isDark),
                    const SizedBox(height: 16),
                    _ProductCard(index: 1, isDark: isDark),
                    const SizedBox(height: 16),
                    _ProductCard(index: 2, isDark: isDark),
                  ],
                ),
        )
            .animate()
            .fadeIn(duration: 800.ms, delay: 800.ms)
            .slideY(begin: 0.1, end: 0),
      ],
    );
  }
}

/// Individual product card
class _ProductCard extends StatefulWidget {
  const _ProductCard({
    required this.index,
    required this.isDark,
  });

  final int index;
  final bool isDark;

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _isHovered = false;

  static const List<Map<String, dynamic>> products = [
    {
      'name': 'Alpha Go',
      'route': AppRoutes.alphaGo,
      'externalUrl': 'https://go.alphaprotocol.network',
      'iconLight': AppAssets.alphaGoIcon,
      'iconDark': AppAssets.alphaGoIconDark,
      'description': 'Secure mobile VPN powered by the Alpha Protocol Network. Browse privately, bypass censorship, and earn rewards.',
    },
    {
      'name': 'Omega Wireless',
      'route': AppRoutes.omegaWireless,
      'externalUrl': 'https://omega-wireless.vercel.app',
      'iconLight': AppAssets.omegaWirelessIcon,
      'iconDark': AppAssets.omegaWirelessIconDark,
      'description': 'Purpose-built hardware for the Alpha Protocol Network. Host your own secure mesh node and earn Bitcoin rewards.',
    },
    {
      'name': 'Spectrum Galactic',
      'route': AppRoutes.spectrum,
      'externalUrl': 'https://spectrum-galactic.vercel.app',
      'iconLight': AppAssets.spectrumIcon,
      'iconDark': AppAssets.spectrumIconDark,
      'description': 'Satellite infrastructure extending the decentralized web to every corner of the globe. Connectivity without boundaries.',
    },
  ];

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = products[widget.index];

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(product['externalUrl']),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(24),
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
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Product Icon
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.identity()
                  ..scale(_isHovered ? 1.05 : 1.0),
                transformAlignment: Alignment.center,
                child: Image.asset(
                  widget.isDark ? product['iconDark'] : product['iconLight'],
                  height: 80,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.apps,
                    size: 80,
                    color: AppColors.primary,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Product Name
              Text(
                product['name'].toString().toUpperCase(),
                style: AppTypography.titleMedium(isDark: widget.isDark).copyWith(
                  letterSpacing: 2,
                  color: _isHovered ? AppColors.primary : null,
                ),
              ),

              const SizedBox(height: 8),

              // Description
              Text(
                product['description'],
                style: AppTypography.bodySmall(isDark: widget.isDark),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
