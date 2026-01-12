import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';
import '../../../constants/assets.dart';
import '../../../components/buttons.dart';
import '../../../widgets/footer.dart';

/// Alpha Go - Mobile VPN Beta Access Page
class BetaAccessWidget extends StatelessWidget {
  const BetaAccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > AppSpacing.tabletMax;

    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;

        return Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 24,
                vertical: isDesktop ? 100 : 64,
              ),
              child: Column(
                children: [
                  // Product Icon
                  Image.asset(
                    isDark ? AppAssets.alphaGoIconDark : AppAssets.alphaGoIcon,
                    height: isDesktop ? 160 : 120,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.vpn_lock_outlined,
                      size: isDesktop ? 160 : 120,
                      color: AppColors.primary,
                    ),
                  ).animate().fadeIn(duration: 600.ms).scale(
                      begin: const Offset(0.8, 0.8),
                      end: const Offset(1, 1)),

                  SizedBox(height: isDesktop ? 40 : 28),

                  // Title
                  Text(
                    'ALPHA GO',
                    style: (isDesktop
                            ? AppTypography.displayMedium(isDark: isDark)
                            : AppTypography.displaySmall(isDark: isDark))
                        .copyWith(
                      letterSpacing: 6,
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms, delay: 200.ms),

                  const SizedBox(height: 12),

                  Text(
                    'MOBILE VPN WITH BITCOIN REWARDS',
                    style: AppTypography.bodyLarge(isDark: isDark).copyWith(
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms, delay: 300.ms),

                  SizedBox(height: isDesktop ? 24 : 16),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Text(
                      'Browse securely on any network while earning Bitcoin for sharing your unused bandwidth. '
                      'Alpha Go connects you to the decentralized Alpha Protocol network.',
                      style: AppTypography.bodyMedium(isDark: isDark).copyWith(
                        color: AppColors.textSecondary(isDark),
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(duration: 600.ms, delay: 400.ms),
                  ),

                  const SizedBox(height: 32),

                  SecondaryButton(
                    text: 'VISIT WEBSITE',
                    icon: Icons.open_in_new,
                    onPressed: () async {
                      final uri = Uri.parse('https://go.alphaprotocol.network');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      }
                    },
                  ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
                ],
              ),
            ),

            // Features Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 24,
                vertical: isDesktop ? 64 : 40,
              ),
              color: AppColors.surface(isDark),
              child: Column(
                children: [
                  Text(
                    'WHY ALPHA GO',
                    style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                      letterSpacing: 4,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(duration: 600.ms),

                  SizedBox(height: isDesktop ? 48 : 32),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1000),
                    child: Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      alignment: WrapAlignment.center,
                      children: [
                        _FeatureCard(
                          icon: Icons.shield_outlined,
                          title: 'ENCRYPTED TRAFFIC',
                          description:
                              'Military-grade encryption protects all your data from prying eyes.',
                          isDark: isDark,
                          isDesktop: isDesktop,
                          delay: 100,
                        ),
                        _FeatureCard(
                          icon: Icons.currency_bitcoin,
                          title: 'EARN BITCOIN',
                          description:
                              'Share bandwidth when idle and receive Bitcoin rewards automatically.',
                          isDark: isDark,
                          isDesktop: isDesktop,
                          delay: 200,
                        ),
                        _FeatureCard(
                          icon: Icons.speed_outlined,
                          title: 'FAST CONNECTIONS',
                          description:
                              'Distributed network ensures low latency and high throughput.',
                          isDark: isDark,
                          isDesktop: isDesktop,
                          delay: 300,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Beta Signup Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 24,
                vertical: isDesktop ? 80 : 48,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  children: [
                    Text(
                      'JOIN THE BETA',
                      style:
                          AppTypography.headlineMedium(isDark: isDark).copyWith(
                        letterSpacing: 4,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(duration: 600.ms),

                    const SizedBox(height: 12),

                    Text(
                      'Be among the first to experience decentralized mobile privacy.',
                      style: AppTypography.bodyMedium(isDark: isDark).copyWith(
                        color: AppColors.textSecondary(isDark),
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(duration: 600.ms, delay: 100.ms),

                    const SizedBox(height: 32),

                    _BetaForm(isDark: isDark, isDesktop: isDesktop),
                  ],
                ),
              ),
            ),

            const Footer(),
          ],
        );
      },
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isDark,
    required this.isDesktop,
    required this.delay,
  });

  final IconData icon;
  final String title;
  final String description;
  final bool isDark;
  final bool isDesktop;
  final int delay;

  @override
  Widget build(BuildContext context) {
    final cardWidth = isDesktop ? 280.0 : double.infinity;

    return SizedBox(
      width: cardWidth,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.card(isDark),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border(isDark)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primary, size: 28),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: AppTypography.titleSmall(isDark: isDark).copyWith(
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppTypography.bodySmall(isDark: isDark).copyWith(
                color: AppColors.textSecondary(isDark),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay));
  }
}

class _BetaForm extends StatefulWidget {
  const _BetaForm({required this.isDark, required this.isDesktop});

  final bool isDark;
  final bool isDesktop;

  @override
  State<_BetaForm> createState() => _BetaFormState();
}

class _BetaFormState extends State<_BetaForm> {
  final _controller = TextEditingController();
  bool _isLoading = false;
  bool _isSuccess = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (_controller.text.isEmpty) return;

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isLoading = false;
      _isSuccess = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isSuccess = false;
          _controller.clear();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Enter your email',
            hintStyle: AppTypography.bodyMedium(isDark: widget.isDark).copyWith(
              color: AppColors.textMuted(widget.isDark),
            ),
            filled: true,
            fillColor: AppColors.card(widget.isDark),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border(widget.isDark)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.border(widget.isDark)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
          ),
          style: AppTypography.bodyMedium(isDark: widget.isDark),
          keyboardType: TextInputType.emailAddress,
        ).animate().fadeIn(duration: 600.ms, delay: 200.ms),

        const SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            text: _isSuccess ? 'SUBMITTED' : 'REQUEST BETA ACCESS',
            onPressed: _isSuccess ? null : _handleSubmit,
            isLoading: _isLoading,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 300.ms),

        if (_isSuccess) ...[
          const SizedBox(height: 16),
          Text(
            'Thank you! We\'ll notify you when beta launches.',
            style: AppTypography.bodyMedium(isDark: widget.isDark).copyWith(
              color: AppColors.success,
            ),
          ).animate().fadeIn(duration: 300.ms),
        ],
      ],
    );
  }
}
