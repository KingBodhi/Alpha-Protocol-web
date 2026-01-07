import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Alpha Protocol - Theme Controller
///
/// GetX-based reactive theme management with persistence.
/// Replaces the old ThemeManager with proper lifecycle handling.
class ThemeController extends GetxController {
  static ThemeController get to => Get.find<ThemeController>();

  // ============================================
  // REACTIVE STATE
  // ============================================

  /// Current theme mode
  final Rx<ThemeMode> _themeMode = ThemeMode.dark.obs;

  /// Get current theme mode
  ThemeMode get themeMode => _themeMode.value;

  /// Check if dark mode is active
  bool get isDarkMode => _themeMode.value == ThemeMode.dark;

  /// Check if light mode is active
  bool get isLightMode => _themeMode.value == ThemeMode.light;

  /// Check if system mode is active
  bool get isSystemMode => _themeMode.value == ThemeMode.system;

  // ============================================
  // STORAGE KEY
  // ============================================

  static const String _storageKey = 'theme_mode';

  // ============================================
  // LIFECYCLE
  // ============================================

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromStorage();
  }

  // ============================================
  // PERSISTENCE
  // ============================================

  /// Load theme preference from storage
  Future<void> _loadThemeFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedTheme = prefs.getString(_storageKey);

      if (storedTheme != null) {
        switch (storedTheme) {
          case 'light':
            _themeMode.value = ThemeMode.light;
            break;
          case 'dark':
            _themeMode.value = ThemeMode.dark;
            break;
          case 'system':
            _themeMode.value = ThemeMode.system;
            break;
          default:
            _themeMode.value = ThemeMode.dark; // Default to dark
        }
      }

      // Apply theme immediately
      Get.changeThemeMode(_themeMode.value);
    } catch (e) {
      debugPrint('ThemeController: Error loading theme: $e');
      _themeMode.value = ThemeMode.dark;
    }
  }

  /// Save theme preference to storage
  Future<void> _saveThemeToStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String themeString;

      switch (_themeMode.value) {
        case ThemeMode.light:
          themeString = 'light';
          break;
        case ThemeMode.dark:
          themeString = 'dark';
          break;
        case ThemeMode.system:
          themeString = 'system';
          break;
      }

      await prefs.setString(_storageKey, themeString);
    } catch (e) {
      debugPrint('ThemeController: Error saving theme: $e');
    }
  }

  // ============================================
  // THEME ACTIONS
  // ============================================

  /// Set theme mode
  void setThemeMode(ThemeMode mode) {
    if (_themeMode.value != mode) {
      _themeMode.value = mode;
      Get.changeThemeMode(mode);
      _saveThemeToStorage();
    }
  }

  /// Toggle between light and dark mode
  void toggleTheme() {
    if (isDarkMode) {
      setThemeMode(ThemeMode.light);
    } else {
      setThemeMode(ThemeMode.dark);
    }
  }

  /// Set light mode
  void setLightMode() => setThemeMode(ThemeMode.light);

  /// Set dark mode
  void setDarkMode() => setThemeMode(ThemeMode.dark);

  /// Set system mode
  void setSystemMode() => setThemeMode(ThemeMode.system);

  // ============================================
  // HELPER METHODS
  // ============================================

  /// Get the effective dark mode state (considering system theme)
  bool get effectiveIsDarkMode {
    if (_themeMode.value == ThemeMode.system) {
      return Get.isPlatformDarkMode;
    }
    return isDarkMode;
  }

  /// Get color based on current theme
  Color themedColor({
    required Color light,
    required Color dark,
  }) {
    return effectiveIsDarkMode ? dark : light;
  }

  /// Get asset suffix for current theme
  String get assetSuffix => effectiveIsDarkMode ? '_d' : '';

  /// Get themed asset path
  String themedAsset(String basePath) {
    if (!effectiveIsDarkMode) return basePath;

    // Insert _d before file extension
    final lastDot = basePath.lastIndexOf('.');
    if (lastDot == -1) return '${basePath}_d';

    return '${basePath.substring(0, lastDot)}_d${basePath.substring(lastDot)}';
  }
}
