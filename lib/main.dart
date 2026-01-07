import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

// Theme & Controllers
import 'theme/theme.dart';
import 'controllers/theme_controller.dart';
import 'constants/routes.dart';
import 'theme/spacing.dart';

// Pages
import 'pages/home/screen/home.dart';
import 'pages/learn/screen/information.dart';
import 'pages/develop/screen/develop.dart';
import 'pages/alpha_go/screen/alpha_go.dart';
import 'pages/omega_wireless/screen/omega_wireless.dart';
import 'pages/spectrum/screen/spectrum.dart';

void main() {
  usePathUrlStrategy();
  runApp(const AlphaProtocolApp());
}

/// Alpha Protocol - Main Application
///
/// Uses GetX for state management and routing.
/// Responsive design with Material3 theming.
class AlphaProtocolApp extends StatelessWidget {
  const AlphaProtocolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          // App Info
          title: 'Alpha Protocol - Where the Web Begins',
          debugShowCheckedModeBanner: false,

          // Theme Configuration
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.dark, // Default to dark

          // Initialize Controllers
          initialBinding: AppBindings(),

          // Routing
          initialRoute: AppRoutes.home,
          getPages: _pages,
          unknownRoute: _unknownRoute,

          // Transition
          defaultTransition: Transition.fade,
          transitionDuration: AppSpacing.durationPage,
        );
      },
    );
  }

  /// Route definitions
  static final List<GetPage> _pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => Home(),
      transition: Transition.fadeIn,
      transitionDuration: AppSpacing.durationPage,
    ),
    GetPage(
      name: AppRoutes.information,
      page: () => Information(),
      transition: Transition.fadeIn,
      transitionDuration: AppSpacing.durationPage,
    ),
    GetPage(
      name: AppRoutes.develop,
      page: () => Develop(),
      transition: Transition.fadeIn,
      transitionDuration: AppSpacing.durationPage,
    ),
    GetPage(
      name: AppRoutes.alphaGo,
      page: () => const AlphaGoScreen(),
      transition: Transition.fadeIn,
      transitionDuration: AppSpacing.durationPage,
    ),
    GetPage(
      name: AppRoutes.omegaWireless,
      page: () => const OmegaWirelessScreen(),
      transition: Transition.fadeIn,
      transitionDuration: AppSpacing.durationPage,
    ),
    GetPage(
      name: AppRoutes.spectrum,
      page: () => const SpectrumScreen(),
      transition: Transition.fadeIn,
      transitionDuration: AppSpacing.durationPage,
    ),
    // Legacy route support (redirect old routes)
    GetPage(
      name: '/AlphaGo',
      page: () => const AlphaGoScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/OmegaWireless',
      page: () => const OmegaWirelessScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/Spectrum',
      page: () => const SpectrumScreen(),
      transition: Transition.fadeIn,
    ),
  ];

  /// 404 route
  static final GetPage _unknownRoute = GetPage(
    name: '/404',
    page: () => const NotFoundPage(),
    transition: Transition.fadeIn,
  );
}

/// Dependency Injection Bindings
class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Theme Controller - Permanent (never disposed)
    Get.put(ThemeController(), permanent: true);
  }
}

/// 404 Not Found Page
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '404',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Page Not Found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(AppRoutes.home),
              child: const Text('GO HOME'),
            ),
          ],
        ),
      ),
    );
  }
}
