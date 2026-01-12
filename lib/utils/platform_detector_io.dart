import 'dart:io' show Platform;

import 'download_platform.dart';

DownloadPlatform detectPlatformImpl() {
  if (Platform.isMacOS) return DownloadPlatform.macOS;
  if (Platform.isWindows) return DownloadPlatform.windows;
  if (Platform.isLinux || Platform.isFuchsia) return DownloadPlatform.linux;
  if (Platform.isAndroid) return DownloadPlatform.android;
  if (Platform.isIOS) return DownloadPlatform.ios;
  return DownloadPlatform.unknown;
}
