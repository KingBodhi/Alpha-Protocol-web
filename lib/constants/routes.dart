/// Alpha Protocol - Route Constants
///
/// Centralized route definitions for type-safe navigation.
/// Prevents typos and enables easy refactoring.
class AppRoutes {
  AppRoutes._();

  // ============================================
  // MAIN ROUTES
  // ============================================

  /// Home page
  static const String home = '/';

  /// Information/Learn page
  static const String information = '/information';

  /// Develop page
  static const String develop = '/develop';

  // ============================================
  // PRODUCT ROUTES (Beta)
  // ============================================

  /// Alpha Go product page
  static const String alphaGo = '/alpha-go';

  /// Omega Wireless product page
  static const String omegaWireless = '/omega-wireless';

  /// Spectrum product page
  static const String spectrum = '/spectrum';

  // ============================================
  // FUTURE ROUTES
  // ============================================

  /// Beta access/waitlist
  static const String betaAccess = '/beta-access';

  /// Contact page
  static const String contact = '/contact';

  /// Privacy policy
  static const String privacy = '/privacy';

  /// Terms of service
  static const String terms = '/terms';

  // ============================================
  // ROUTE LIST (for iteration)
  // ============================================

  /// All main navigation routes
  static const List<String> mainRoutes = [
    home,
    information,
    develop,
  ];

  /// All product routes
  static const List<String> productRoutes = [
    alphaGo,
    omegaWireless,
    spectrum,
  ];

  /// Navigation labels for routes
  static const Map<String, String> routeLabels = {
    home: 'HOME',
    information: 'LEARN',
    develop: 'DEVELOP',
    alphaGo: 'ALPHA GO',
    omegaWireless: 'OMEGA WIRELESS',
    spectrum: 'SPECTRUM',
    betaAccess: 'BETA ACCESS',
    contact: 'CONTACT',
  };

  /// Get label for a route
  static String getLabel(String route) => routeLabels[route] ?? 'UNKNOWN';
}
