// Imports the Flutter Driver API.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:testing/main.dart' as app;

//Migrating from flutter_driver
//https://docs.flutter.dev/release/breaking-changes/flutter-driver-migration
//https://docs.flutter.dev/cookbook/testing/integration/introduction
//https://docs.flutter.dev/testing/integration-tests
//https://docs.flutter.dev/testing
//flutter test integration_test/app_test.dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login form tests', ()
  {
    testWidgets('.1.',
            (tester) async {
          app.main();
          await tester.pumpAndSettle();

          // TODO: write tests

          final Finder filedFinderEmail = find.byKey(
              const Key('textEmailField'));
          final Finder filedFinderPhone = find.byKey(
              const Key('textPhoneField'));
          final Finder filedFinderSend = find.byKey(
              const Key('buttonSendField'));

          ///flutter drive --target=test_driver/app.dart


            //await tester.tap(filedFinderEmail);
            //await tester.pumpAndSettle();
            await tester.enterText(filedFinderEmail, 'test@test.tst');
            expect(find.text('test@test.tst'), findsOneWidget);

        });
  });







  // group('Rigister form tests', () {
  //   FlutterDriver? driver;
  //
  //   setUpAll(() async {
  //     driver = await FlutterDriver.connect();
  //   });
  //
  //   tearDownAll(() async {
  //     if (driver != null) {
  //       driver!.close();
  //     }
  //   });
  //
  //   // TODO: write tests
  // });
}
