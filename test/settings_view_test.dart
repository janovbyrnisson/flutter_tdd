// This is an example Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//
// Visit https://flutter.dev/docs/cookbook/testing/widget/introduction for
// more information about Widget testing.

import 'package:flutter/material.dart';
import 'package:flutter_tdd/src/settings/settings_controller.dart';
import 'package:flutter_tdd/src/settings/settings_service.dart';
import 'package:flutter_tdd/src/settings/settings_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final SettingsService settingsService;
  late final SettingsController settingsController;

  setUp(() {
    settingsService = SettingsService();
    settingsController = SettingsController(settingsService);
    settingsController.loadSettings();
  });

  group('SettingsView', () {
    testWidgets('should display a correct title', (WidgetTester tester) async {
      final myWidget = MaterialApp(
        home: SettingsView(
          controller: settingsController,
        ),
      );
      await tester.pumpWidget(myWidget);
      expect(find.text("Settings"), findsOneWidget);
    });
  });
}
