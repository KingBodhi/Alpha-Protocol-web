import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';
import '../../../constants/assets.dart';
import '../../../components/buttons.dart';

/// Alpha Go - Beta Access Widget
class BetaAccessWidget extends StatelessWidget {
  const BetaAccessWidget({super.key});

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
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Product Icon
                Image.asset(
                  isDark
                      ? AppAssets.alphaGoIconDark
                      : AppAssets.alphaGoIcon,
                  height: isDesktop ? 200 : 150,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.vpn_lock_outlined,
                    size: isDesktop ? 200 : 150,
                    color: AppColors.primary,
                  ),
                )
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),

                SizedBox(height: isDesktop ? 48 : 32),

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
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 200.ms),

                const SizedBox(height: 16),

                Text(
                  'DECENTRALIZED VPN SOLUTION',
                  style: AppTypography.bodyLarge(isDark: isDark).copyWith(
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 300.ms),

                SizedBox(height: isDesktop ? 48 : 32),

                // Beta Access Form
                _BetaForm(isDark: isDark, isDesktop: isDesktop),
              ],
            ),
          ),
        );
      },
    );
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
        Text(
          'REQUEST BETA ACCESS',
          style: AppTypography.titleMedium(isDark: widget.isDark).copyWith(
            letterSpacing: 2,
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 400.ms),

        const SizedBox(height: 24),

        // Email Input
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
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 500.ms),

        const SizedBox(height: 16),

        // Submit Button
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            text: _isSuccess ? 'SUBMITTED' : 'REQUEST ACCESS',
            onPressed: _isSuccess ? null : _handleSubmit,
            isLoading: _isLoading,
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms, delay: 600.ms),

        if (_isSuccess) ...[
          const SizedBox(height: 16),
          Text(
            'Thank you! We\'ll be in touch soon.',
            style: AppTypography.bodyMedium(isDark: widget.isDark).copyWith(
              color: AppColors.success,
            ),
          )
              .animate()
              .fadeIn(duration: 300.ms),
        ],
      ],
    );
  }
}
