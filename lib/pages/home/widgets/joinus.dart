import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';
import '../../../components/buttons.dart';

/// Alpha Protocol - Join Us Section
///
/// Newsletter signup and social links.
class JoinUs extends StatelessWidget {
  const JoinUs({super.key});

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
            vertical: isDesktop ? 64 : 48,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.card(isDark),
                AppColors.surface(isDark),
              ],
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                // Section Header
                Text(
                  'JOIN THE ALPHA COMMUNITY',
                  style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms),

                const SizedBox(height: 32),

                // Email Input
                _EmailSignup(isDark: isDark),

                const SizedBox(height: 32),

                // Social Links
                _SocialLinks(isDark: isDark),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _EmailSignup extends StatefulWidget {
  const _EmailSignup({required this.isDark});

  final bool isDark;

  @override
  State<_EmailSignup> createState() => _EmailSignupState();
}

class _EmailSignupState extends State<_EmailSignup> {
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

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
      _isSuccess = true;
    });

    // Reset after 3 seconds
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > AppSpacing.tabletMax;

    return Column(
      children: [
        if (isDesktop)
          Row(
            children: [
              Expanded(
                child: _buildTextField(),
              ),
              const SizedBox(width: 16),
              _buildButton(),
            ],
          )
        else
          Column(
            children: [
              _buildTextField(),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: _buildButton(),
              ),
            ],
          ),

        // Success message
        if (_isSuccess) ...[
          const SizedBox(height: 16),
          Text(
            'Thank you for joining!',
            style: AppTypography.bodyMedium(isDark: widget.isDark).copyWith(
              color: AppColors.success,
            ),
          )
              .animate()
              .fadeIn(duration: 300.ms),
        ],
      ],
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: 200.ms);
  }

  Widget _buildTextField() {
    return TextField(
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
    );
  }

  Widget _buildButton() {
    return PrimaryButton(
      text: _isSuccess ? 'SUBSCRIBED' : 'SUBMIT',
      onPressed: _isSuccess ? null : _handleSubmit,
      isLoading: _isLoading,
    );
  }
}

class _SocialLinks extends StatelessWidget {
  const _SocialLinks({required this.isDark});

  final bool isDark;

  static const _socialLinks = [
    {
      'icon': Icons.discord,
      'url': 'https://discord.gg/alphaprotocol',
      'label': 'Discord',
    },
    {
      'icon': Icons.close, // X (Twitter) icon
      'url': 'https://twitter.com/alphaprotocol',
      'label': 'X',
    },
    {
      'icon': Icons.telegram,
      'url': 'https://t.me/alphaprotocol',
      'label': 'Telegram',
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _socialLinks.map((social) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: _SocialButton(
            icon: social['icon'] as IconData,
            label: social['label'] as String,
            onTap: () => _launchUrl(social['url'] as String),
            isDark: isDark,
          ),
        );
      }).toList(),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: 400.ms);
  }
}

class _SocialButton extends StatefulWidget {
  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isDark,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDark;

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
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
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.primary.withValues(alpha: 0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            widget.icon,
            size: 28,
            color: _isHovered
                ? AppColors.primary
                : AppColors.textSecondary(widget.isDark),
          ),
        ),
      ),
    );
  }
}
