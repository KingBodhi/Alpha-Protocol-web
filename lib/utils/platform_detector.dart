import 'download_platform.dart';
import 'platform_detector_stub.dart'
    if (dart.library.html) 'platform_detector_web.dart'
    if (dart.library.io) 'platform_detector_io.dart';

DownloadPlatform detectDownloadPlatform() => detectPlatformImpl();
