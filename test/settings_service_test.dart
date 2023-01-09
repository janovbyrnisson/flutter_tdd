// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction

import 'package:flutter/material.dart';
import 'package:flutter_tdd/src/settings/settings_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SettingsService service;

  setUp(() {
    service = SettingsService();
  });

  group('SettingsService', () {
    test("themeMode should be SYSTEM by default", () async {
      expect(await service.themeMode(), ThemeMode.system);
    });

    test('should update theme mode to LIGHT theme.', () async {
      await service.updateThemeMode(ThemeMode.light);
      expect(await service.themeMode(), ThemeMode.light);
    });
  });
}
