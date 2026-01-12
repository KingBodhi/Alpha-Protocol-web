// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;

import 'download_platform.dart';

DownloadPlatform detectPlatformImpl() {
  final userAgent = html.window.navigator.userAgent.toLowerCase();

  if (userAgent.contains('mac os') || userAgent.contains('macos')) {
    return DownloadPlatform.macOS;
  }
  if (userAgent.contains('windows')) {
    return DownloadPlatform.windows;
  }
  if (userAgent.contains('linux') && !userAgent.contains('android')) {
    return DownloadPlatform.linux;
  }
  if (userAgent.contains('android')) {
    return DownloadPlatform.android;
  }
  if (userAgent.contains('iphone') ||
      userAgent.contains('ipad') ||
      userAgent.contains('ipod')) {
    return DownloadPlatform.ios;
  }

  return DownloadPlatform.unknown;
}
