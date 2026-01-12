// Alpha Protocol Widget Tests
//
// Basic smoke test for the Alpha Protocol web application.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/src/asset_manifest.dart'
    as asset_manifest; // ignore: implementation_imports
import 'package:google_fonts/src/google_fonts_base.dart'
    as google_fonts_base; // ignore: implementation_imports

import 'package:alpha/main.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    google_fonts_base.assetManifest = _TestAssetManifest();
  });

  testWidgets('AlphaProtocolApp smoke test', (WidgetTester tester) async {
    final view = tester.view;
    view.physicalSize = const Size(1920, 1080);
    view.devicePixelRatio = 1.0;
    addTearDown(() {
      view.resetPhysicalSize();
      view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const AlphaProtocolApp());

    await tester.pump(const Duration(milliseconds: 100));
    expect(tester.takeException(), isNull);
  });
}

class _TestAssetManifest extends asset_manifest.AssetManifest {
  _TestAssetManifest() : super(enableCache: false);

  @override
  Future<Map<String, List<String>>?>? json() {
    return SynchronousFuture(<String, List<String>>{});
  }
}
