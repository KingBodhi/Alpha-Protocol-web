import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../controllers/theme_controller.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/spacing.dart';
import '../constants/assets.dart';
import '../components/buttons.dart';

/// Alpha Protocol - Footer
///
/// Site footer with social links and branding.
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;

        return Container(
          decoration: BoxDecoration(
            color: AppColors.background(isDark),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top accent line
              Container(
                height: 1.0,
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.lg,
                  horizontal: AppSpacing.md,
                ),
                child: Column(
                  children: [
                    // Social Media Icons
                    _SocialLinks(isDark: isDark),
                    AppSpacing.gapVLg,

                    // Divider
                    Container(
                      width: 100,
                      height: 1,
                      color: AppColors.divider(isDark),
                    ),
                    AppSpacing.gapVMd,

                    // Copyright
                    Text(
                      'ALPHA PROTOCOL',
                      style: AppTypography.overline(isDark: isDark),
                    ),
                    AppSpacing.gapVXxs,
                    Text(
                      'by Powerclub Global',
                      style: AppTypography.bodySmall(isDark: isDark),
                    ),
                    AppSpacing.gapVXs,
                    Text(
                      '© ${DateTime.now().year} All Rights Reserved',
                      style: AppTypography.bodySmall(isDark: isDark).copyWith(
                        color: AppColors.textMuted(isDark),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Social media links row
class _SocialLinks extends StatelessWidget {
  const _SocialLinks({required this.isDark});

  final bool isDark;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIconButton(
          assetPath: AppAssets.getSocialIcon('facebook', isDark),
          onPressed: () => _launchUrl(AppAssets.facebookUrl),
          tooltip: 'Facebook',
        ),
        AppSpacing.gapHMd,
        SocialIconButton(
          assetPath: AppAssets.getSocialIcon('twitter', isDark),
          onPressed: () => _launchUrl(AppAssets.twitterUrl),
          tooltip: 'X (Twitter)',
        ),
        AppSpacing.gapHMd,
        SocialIconButton(
          assetPath: AppAssets.getSocialIcon('instagram', isDark),
          onPressed: () => _launchUrl(AppAssets.instagramUrl),
          tooltip: 'Instagram',
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.2, end: 0);
  }
}

/// Extended footer with more content (optional)
class ExtendedFooter extends StatelessWidget {
  const ExtendedFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;
        final isWide = MediaQuery.of(context).size.width > 768;

        return Container(
          color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
          padding: AppSpacing.section,
          child: Column(
            children: [
              // Main content
              isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Brand column
                        Expanded(
                          flex: 2,
                          child: _BrandColumn(isDark: isDark),
                        ),
                        AppSpacing.gapHXl,
                        // Links column
                        Expanded(
                          child: _LinksColumn(
                            title: 'Products',
                            links: const [
                              ('Alpha Go', '/alpha-go'),
                              ('Omega Wireless', '/omega-wireless'),
                              ('Spectrum', '/spectrum'),
                            ],
                            isDark: isDark,
                          ),
                        ),
                        AppSpacing.gapHLg,
                        // Resources column
                        Expanded(
                          child: _LinksColumn(
                            title: 'Resources',
                            links: const [
                              ('Learn', '/information'),
                              ('Develop', '/develop'),
                              ('Documentation', '#'),
                            ],
                            isDark: isDark,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        _BrandColumn(isDark: isDark),
                        AppSpacing.gapVXl,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _LinksColumn(
                                title: 'Products',
                                links: const [
                                  ('Alpha Go', '/alpha-go'),
                                  ('Omega Wireless', '/omega-wireless'),
                                  ('Spectrum', '/spectrum'),
                                ],
                                isDark: isDark,
                              ),
                            ),
                            Expanded(
                              child: _LinksColumn(
                                title: 'Resources',
                                links: const [
                                  ('Learn', '/information'),
                                  ('Develop', '/develop'),
                                  ('Documentation', '#'),
                                ],
                                isDark: isDark,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

              AppSpacing.gapVXl,
              const Divider(),
              AppSpacing.gapVMd,

              // Bottom bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '© ${DateTime.now().year} Powerclub Global. All rights reserved.',
                    style: AppTypography.bodySmall(isDark: isDark),
                  ),
                  _SocialLinks(isDark: isDark),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BrandColumn extends StatelessWidget {
  const _BrandColumn({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          AppAssets.getLogo(isDark),
          height: 40,
        ),
        AppSpacing.gapVMd,
        Text(
          'Where the Web Begins',
          style: AppTypography.titleMedium(isDark: isDark),
        ),
        AppSpacing.gapVSm,
        SizedBox(
          width: 300,
          child: Text(
            'Building the decentralized infrastructure for the next generation of the internet.',
            style: AppTypography.bodyMedium(isDark: isDark),
          ),
        ),
      ],
    );
  }
}

class _LinksColumn extends StatelessWidget {
  const _LinksColumn({
    required this.title,
    required this.links,
    required this.isDark,
  });

  final String title;
  final List<(String, String)> links;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: AppTypography.overline(isDark: isDark),
        ),
        AppSpacing.gapVMd,
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: _FooterLink(
                text: link.$1,
                route: link.$2,
                isDark: isDark,
              ),
            )),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  const _FooterLink({
    required this.text,
    required this.route,
    required this.isDark,
  });

  final String text;
  final String route;
  final bool isDark;

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (widget.route != '#') {
            Get.toNamed(widget.route);
          }
        },
        child: AnimatedDefaultTextStyle(
          duration: AppSpacing.durationFast,
          style: AppTypography.bodyMedium(isDark: widget.isDark).copyWith(
            color: _isHovered ? AppColors.primary : null,
          ),
          child: Text(widget.text),
        ),
      ),
    );
  }
}
