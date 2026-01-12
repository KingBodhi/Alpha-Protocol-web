import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/routes.dart';
import 'download_platform.dart';
import 'platform_detector.dart';

/// Metadata for a resolved platform download target.
class DownloadTarget {
  const DownloadTarget({
    required this.platform,
    required this.label,
    required this.icon,
    required this.uri,
  });

  final DownloadPlatform platform;
  final String label;
  final IconData icon;
  final Uri uri;

  String get buttonLabel => 'Download for $label';
}

/// Helper for building platform-aware download CTAs.
class DownloadHelper {
  static const String _baseDownloadUrl =
      'https://alphaprotocol.network/download';

  static const Map<DownloadPlatform, String> _platformLabels = {
    DownloadPlatform.macOS: 'macOS',
    DownloadPlatform.windows: 'Windows',
    DownloadPlatform.linux: 'Linux',
    DownloadPlatform.android: 'Android',
    DownloadPlatform.ios: 'iOS',
    DownloadPlatform.unknown: 'Your Device',
  };

  static const Map<DownloadPlatform, String> _platformSlugs = {
    DownloadPlatform.macOS: 'macos',
    DownloadPlatform.windows: 'windows',
    DownloadPlatform.linux: 'linux',
    DownloadPlatform.android: 'android',
    DownloadPlatform.ios: 'ios',
  };

  static const Map<DownloadPlatform, IconData> _platformIcons = {
    DownloadPlatform.macOS: Icons.apple,
    DownloadPlatform.windows: Icons.window,
    DownloadPlatform.linux: Icons.terminal,
    DownloadPlatform.android: Icons.android,
    DownloadPlatform.ios: Icons.phone_iphone,
  };

  /// Resolves a [DownloadTarget] for the detected or overridden platform.
  static DownloadTarget currentTarget({DownloadPlatform? platformOverride}) {
    final platform = platformOverride ?? detectDownloadPlatform();

    return DownloadTarget(
      platform: platform,
      label: _platformLabels[platform] ?? 'Your Device',
      icon: _platformIcons[platform] ?? Icons.download_rounded,
      uri: _buildUri(platform),
    );
  }

  /// Attempts to launch the download link for the supplied platform.
  static Future<bool> launchDownload(
      {DownloadPlatform? platformOverride}) async {
    final target = currentTarget(platformOverride: platformOverride);
    try {
      return await launchUrl(target.uri, mode: LaunchMode.platformDefault);
    } catch (_) {
      return false;
    }
  }

  /// Launches the download and shows fallback messaging when it fails.
  static Future<void> launchWithFallback(
    BuildContext context, {
    DownloadPlatform? platformOverride,
  }) async {
    final target = currentTarget(platformOverride: platformOverride);
    final messenger = ScaffoldMessenger.maybeOf(context);
    final success = await launchDownload(platformOverride: target.platform);

    if (success) return;

    messenger?.showSnackBar(
      const SnackBar(
        content: Text(
          'Unable to start the secure download automatically. Opening the Learn page instead.',
        ),
      ),
    );

    if (Get.currentRoute != AppRoutes.information) {
      Get.toNamed(AppRoutes.information);
    }
  }

  static Uri _buildUri(DownloadPlatform platform) {
    final slug = _platformSlugs[platform];
    if (slug == null) return Uri.parse(_baseDownloadUrl);
    return Uri.parse(_baseDownloadUrl).replace(queryParameters: {
      'platform': slug,
    });
  }
}
