import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/spacing.dart';
import '../controllers/theme_controller.dart';

/// Alpha Protocol - Input Components
///
/// Reusable input widgets with consistent styling.

// ============================================
// TEXT INPUT FIELD
// ============================================

/// Standard text input with theme-aware styling
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.errorText,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.focusNode,
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? errorText;
  final String? helperText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_handleFocusChange);
    }
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;
        final hasError = widget.errorText != null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Label
            if (widget.label != null) ...[
              Text(
                widget.label!.toUpperCase(),
                style: AppTypography.labelSmall(isDark: isDark).copyWith(
                  color: hasError
                      ? AppColors.error
                      : (_isFocused ? AppColors.primary : null),
                ),
              ),
              AppSpacing.gapVXs,
            ],

            // Input field
            AnimatedContainer(
              duration: AppSpacing.durationFast,
              decoration: BoxDecoration(
                borderRadius: AppSpacing.borderRadius,
                boxShadow: _isFocused
                    ? [
                        BoxShadow(
                          color:
                              (hasError ? AppColors.error : AppColors.primary)
                                  .withValues(alpha: 0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: TextFormField(
                controller: widget.controller,
                focusNode: _focusNode,
                obscureText: widget.obscureText,
                enabled: widget.enabled,
                readOnly: widget.readOnly,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                maxLength: widget.maxLength,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                onChanged: widget.onChanged,
                onFieldSubmitted: widget.onSubmitted,
                validator: widget.validator,
                autofocus: widget.autofocus,
                style: AppTypography.bodyMedium(isDark: isDark),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  errorText: null, // We handle error display separately
                  counterText: '',
                  prefixIcon: widget.prefixIcon != null
                      ? Icon(
                          widget.prefixIcon,
                          color: _isFocused
                              ? AppColors.primary
                              : AppColors.textSecondary(isDark),
                        )
                      : null,
                  suffixIcon: widget.suffixIcon != null
                      ? IconButton(
                          icon: Icon(
                            widget.suffixIcon,
                            color: AppColors.textSecondary(isDark),
                          ),
                          onPressed: widget.onSuffixTap,
                        )
                      : null,
                  filled: true,
                  fillColor:
                      isDark ? AppColors.darkSurface : AppColors.lightSurface,
                  border: OutlineInputBorder(
                    borderRadius: AppSpacing.borderRadius,
                    borderSide: BorderSide(
                      color:
                          hasError ? AppColors.error : AppColors.border(isDark),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: AppSpacing.borderRadius,
                    borderSide: BorderSide(
                      color:
                          hasError ? AppColors.error : AppColors.border(isDark),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: AppSpacing.borderRadius,
                    borderSide: BorderSide(
                      color: hasError ? AppColors.error : AppColors.primary,
                      width: 2,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: AppSpacing.borderRadius,
                    borderSide: BorderSide(
                      color: AppColors.border(isDark).withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
            ),

            // Error or helper text
            if (widget.errorText != null || widget.helperText != null) ...[
              AppSpacing.gapVXxs,
              Text(
                widget.errorText ?? widget.helperText!,
                style: AppTypography.bodySmall(isDark: isDark).copyWith(
                  color: widget.errorText != null
                      ? AppColors.error
                      : AppColors.textMuted(isDark),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

// ============================================
// EMAIL INPUT FIELD
// ============================================

/// Specialized input for email addresses
class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    this.controller,
    this.label = 'Email',
    this.hint = 'Enter your email address',
    this.errorText,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final String label;
  final String hint;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      label: label,
      hint: hint,
      errorText: errorText,
      prefixIcon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!GetUtils.isEmail(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }
}

// ============================================
// SEARCH INPUT FIELD
// ============================================

/// Search input with clear button
class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    this.controller,
    this.hint = 'Search...',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  final TextEditingController? controller;
  final String hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);
    _hasText = _controller.text.isNotEmpty;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_onTextChanged);
    }
    super.dispose();
  }

  void _onTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  void _clearText() {
    _controller.clear();
    widget.onClear?.call();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: _controller,
      hint: widget.hint,
      prefixIcon: Icons.search,
      suffixIcon: _hasText ? Icons.close : null,
      onSuffixTap: _clearText,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      textInputAction: TextInputAction.search,
    );
  }
}

// ============================================
// NEWSLETTER SIGNUP (Email + Button)
// ============================================

/// Combined email input with submit button for newsletter signup
class NewsletterSignup extends StatefulWidget {
  const NewsletterSignup({
    super.key,
    this.onSubmit,
    this.buttonText = 'Subscribe',
    this.placeholder = 'Enter your email',
  });

  final Future<void> Function(String email)? onSubmit;
  final String buttonText;
  final String placeholder;

  @override
  State<NewsletterSignup> createState() => _NewsletterSignupState();
}

class _NewsletterSignupState extends State<NewsletterSignup> {
  final _controller = TextEditingController();
  bool _isLoading = false;
  String? _error;
  bool _isSuccess = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    final email = _controller.text.trim();

    if (email.isEmpty) {
      setState(() {
        _error = 'Please enter your email';
      });
      return;
    }

    if (!GetUtils.isEmail(email)) {
      setState(() {
        _error = 'Please enter a valid email';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      await widget.onSubmit?.call(email);
      setState(() {
        _isSuccess = true;
        _isLoading = false;
      });
      _controller.clear();

      // Reset success state after 3 seconds
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _isSuccess = false;
          });
        }
      });
    } catch (e) {
      setState(() {
        _error = 'Something went wrong. Please try again.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;

        if (_isSuccess) {
          return Container(
            padding: AppSpacing.allMd,
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              borderRadius: AppSpacing.borderRadius,
              border: Border.all(color: AppColors.success),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, color: AppColors.success),
                AppSpacing.gapHSm,
                Text(
                  'Thanks for subscribing!',
                  style: AppTypography.bodyMedium(isDark: isDark).copyWith(
                    color: AppColors.success,
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    controller: _controller,
                    hint: widget.placeholder,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _handleSubmit(),
                    enabled: !_isLoading,
                  ),
                ),
                AppSpacing.gapHSm,
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: AppSpacing.borderRadius,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(
                            widget.buttonText.toUpperCase(),
                            style: AppTypography.button(isDark: true).copyWith(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ],
            ),
            if (_error != null) ...[
              AppSpacing.gapVXs,
              Text(
                _error!,
                style: AppTypography.bodySmall(isDark: isDark).copyWith(
                  color: AppColors.error,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
