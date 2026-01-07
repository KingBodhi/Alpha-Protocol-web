// Alpha Protocol Widget Tests
//
// Basic smoke test for the Alpha Protocol web application.

import 'package:flutter_test/flutter_test.dart';

import 'package:alpha/main.dart';

void main() {
  testWidgets('AlphaProtocolApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AlphaProtocolApp());

    // Verify app renders without error
    await tester.pumpAndSettle();
  });
}
