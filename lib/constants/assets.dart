/// Alpha Protocol - Asset Constants
///
/// Centralized asset paths for consistent access.
/// Supports theme-aware asset selection.
class AppAssets {
  AppAssets._();

  // ============================================
  // BASE PATHS
  // ============================================

  static const String _base = 'assets';
  static const String _images = _base;

  // ============================================
  // LOGOS
  // ============================================

  /// Main logo (light theme)
  static const String logo = '$_images/alpha.png';

  /// Main logo (dark theme)
  static const String logoDark = '$_images/alpha_d.png';

  /// Small logo mark (light)
  static const String logoMark = '$_images/a.png';

  /// Small logo mark (dark)
  static const String logoMarkDark = '$_images/a_d.png';

  /// Get theme-appropriate logo
  static String getLogo(bool isDark) => isDark ? logoDark : logo;

  /// Get theme-appropriate logo mark
  static String getLogoMark(bool isDark) => isDark ? logoMarkDark : logoMark;

  // ============================================
  // HERO IMAGES
  // ============================================

  /// Hero image (light theme)
  static const String hero = '$_images/Hero_Image.png';

  /// Hero image (dark theme)
  static const String heroDark = '$_images/Hero_Image_d.png';

  /// Get theme-appropriate hero image
  static String getHero(bool isDark) => isDark ? heroDark : hero;

  // ============================================
  // PRODUCT ICONS
  // ============================================

  /// Alpha Go icon (light)
  static const String alphaGoIcon = '$_images/alpha_go_icon.png';

  /// Alpha Go icon (dark)
  static const String alphaGoIconDark = '$_images/alpha_go_icon_dark.png';

  /// Omega Wireless icon (light)
  static const String omegaWirelessIcon = '$_images/omega_wireless_icon.png';

  /// Omega Wireless icon (dark)
  static const String omegaWirelessIconDark =
      '$_images/omega_wireless_icon_dark.png';

  /// Spectrum icon (light)
  static const String spectrumIcon = '$_images/spectrum_icon.png';

  /// Spectrum icon (dark)
  static const String spectrumIconDark = '$_images/spectrum_icon_dark.png';

  /// Get theme-appropriate product icon
  static String getProductIcon(String product, bool isDark) {
    switch (product.toLowerCase()) {
      case 'alphago':
      case 'alpha_go':
        return isDark ? alphaGoIconDark : alphaGoIcon;
      case 'omegawireless':
      case 'omega_wireless':
        return isDark ? omegaWirelessIconDark : omegaWirelessIcon;
      case 'spectrum':
        return isDark ? spectrumIconDark : spectrumIcon;
      default:
        return isDark ? alphaGoIconDark : alphaGoIcon;
    }
  }

  // ============================================
  // LEARN/EDUCATIONAL IMAGES
  // ============================================

  /// Learn section images (light)
  static const String learn1 = '$_images/learn_1.png';
  static const String learn2 = '$_images/learn_2.png';
  static const String learn3 = '$_images/learn_3.png';
  static const String learn4 = '$_images/learn_4.png';
  static const String learn5 = '$_images/learn_5.png';

  /// Learn section images (dark)
  static const String learn1Dark = '$_images/learn_1_d.png';
  static const String learn2Dark = '$_images/learn_2_d.png';
  static const String learn3Dark = '$_images/learn_3_d.png';
  static const String learn4Dark = '$_images/learn_4_d.png';
  static const String learn5Dark = '$_images/learn_5_d.png';

  /// Get theme-appropriate learn image
  static String getLearnImage(int index, bool isDark) {
    final lightImages = [learn1, learn2, learn3, learn4, learn5];
    final darkImages = [
      learn1Dark,
      learn2Dark,
      learn3Dark,
      learn4Dark,
      learn5Dark
    ];
    final safeIndex = (index - 1).clamp(0, 4);
    return isDark ? darkImages[safeIndex] : lightImages[safeIndex];
  }

  // ============================================
  // PRODUCT SHOWCASE IMAGES
  // ============================================

  /// Spectrum home image (light)
  static const String spectrumHome = '$_images/spectrum_home.jpg';

  /// Spectrum home image (dark)
  static const String spectrumHomeDark = '$_images/spectrum_home_dark.png';

  /// Get theme-appropriate spectrum home
  static String getSpectrumHome(bool isDark) =>
      isDark ? spectrumHomeDark : spectrumHome;

  // ============================================
  // SOCIAL ICONS
  // ============================================

  /// Social icon base paths
  static const String facebook = '$_images/facebook_icon.png';
  static const String facebookDark = '$_images/facebook_icon_d.png';
  static const String instagram = '$_images/instagram_icon.png';
  static const String instagramDark = '$_images/instagram_icon_d.png';
  static const String google = '$_images/google_icon.png';
  static const String googleDark = '$_images/google_icon_d.png';
  static const String twitter = '$_images/x_icon.png';
  static const String twitterDark = '$_images/x_icon_d.png';

  /// Get theme-appropriate social icon
  static String getSocialIcon(String platform, bool isDark) {
    switch (platform.toLowerCase()) {
      case 'facebook':
        return isDark ? facebookDark : facebook;
      case 'instagram':
        return isDark ? instagramDark : instagram;
      case 'google':
        return isDark ? googleDark : google;
      case 'twitter':
      case 'x':
        return isDark ? twitterDark : twitter;
      default:
        return isDark ? twitterDark : twitter;
    }
  }

  // ============================================
  // EXTERNAL LINKS
  // ============================================

  /// Social media links
  static const String facebookUrl = 'https://facebook.com/alphaprotocol';
  static const String instagramUrl = 'https://instagram.com/alphaprotocol';
  static const String twitterUrl = 'https://x.com/alphaprotocol';

  /// Main website
  static const String websiteUrl = 'https://alphaprotocol.network';

  /// Beta signup link
  static const String betaSignupUrl = 'https://alphaprotocol.network/beta';
}
