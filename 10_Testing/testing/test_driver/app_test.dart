// Imports the Flutter Driver API.
import 'package:flutter/cupertino.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });
    // TODO: write tests

    final filedFinderEmail = find.byValueKey(const Key('textEmailField'));
    final filedFinderPhone = find.byValueKey(const Key('textPhoneField'));
    final filedFinderSend = find.byValueKey(const Key('buttonSendField'));

    ///flutter drive --target=test_driver/app.dart

    test('Test Filed Email', () async {
      await driver!.tap(filedFinderEmail);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('teat1@test.tst');
      await driver!.waitFor(find.text('teat1@test.tst'));
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
