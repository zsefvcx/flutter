// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

//https://api.flutter.dev/flutter/package-integration_test_integration_test_driver_extended/integrationDriver.html

void main() {
  group('Login form tests', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      //if (driver != null)
      {
        driver.close();
      }
    });

    // TODO: write tests
    //flutter drive --target=test_driver/app.dart
    //Задание
    //     В поле email должен быть валидный email-адрес, и оно не должно быть пустым.
    //     Нужно проверить, что в поле phone введены только цифры.
    //     При клике на кнопку «Отправить» нужно убедиться, что на экране появилась надпись «Добро пожаловать».
    final filedFinderEmail = find.byValueKey('textEmailField');
    final filedFinderPhone = find.byValueKey('textPhoneField');
    final filedFinderSend = find.byValueKey('buttonSendField');

    test(
      'Test Email filed',
      () async {
        await driver.tap(filedFinderEmail);
        await driver.waitFor(find.text(''));
        await driver.enterText('test@test.tst');
        await driver.waitFor(find.text('test@test.tst'));
      },
    );
    test(
      'Test phone filed',
      () async {
        await driver.tap(filedFinderPhone);
        await driver.waitFor(find.text(''));
        await driver.enterText('88008888080');
        await driver.waitFor(find.text('88008888080'));
      },
    );
    test(
      'Test tap on buttonSend',
      () async {
        await driver.tap(filedFinderSend);
      },
    );
    test(
      'check Success',
      () async {
        final success = find.text('Добро пожаловать');
        expect(await driver.getText(success), 'Добро пожаловать');
      },
    );
  });

  group('Rigister form tests', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      //if (driver != null)
      {
        driver.close();
      }
    });

    // TODO: write tests
    //flutter drive --target=test_driver/app.dart
    //Задание
    //     В поле email должен быть валидный email-адрес, и оно не должно быть пустым.
    //     Нужно проверить, что в поле phone введены только цифры.
    //     Поля firstName и lastName не должны быть пустыми.
    //    При клике на кнопку «Отправить» нужно убедиться, что на экране появилась надпись «Вы успешно зарегистрировались».

    // Переходим на форму регистрации
    final richText = find.byValueKey('RichText');
    test(
      'Test Переходим на форму регистрации',
          () async {
        await driver.tap(richText);
      },
    );

    final filedFirstNameEmail = find.byValueKey('textFirstNameField');
    final filedLastNameEmail = find.byValueKey('textLastNameField');
    final filedFinderEmail = find.byValueKey('textEmailField');
    final filedFinderPhone = find.byValueKey('textPhoneField');
    final filedFinderSend = find.byValueKey('buttonSendField');


    test(
      'Test FirstName filed',
          () async {
        await driver.tap(filedFirstNameEmail);
        await driver.waitFor(find.text(''));
        await driver.enterText('text First Name Field');
        await driver.waitFor(find.text('text First Name Field'));
      },
    );

    test(
      'Test LastName filed',
          () async {
        await driver.tap(filedLastNameEmail);
        await driver.waitFor(find.text(''));
        await driver.enterText('text Last Name Field');
        await driver.waitFor(find.text('text Last Name Field'));
      },
    );

    test(
      'Test Email filed',
          () async {
        await driver.tap(filedFinderEmail);
        await driver.waitFor(find.text(''));
        await driver.enterText('test@test.tst');
        await driver.waitFor(find.text('test@test.tst'));
      },
    );

    test(
      'Test phone filed',
          () async {
        await driver.tap(filedFinderPhone);
        await driver.waitFor(find.text(''));
        await driver.enterText('88008888080');
        await driver.waitFor(find.text('88008888080'));
      },
    );

    test(
      'Test tap on buttonSend',
          () async {
        await driver.tap(filedFinderSend);
      },
    );

    test(
      'check Success',
          () async {
        final success = find.text('Вы успешно зарегистрировались');
        expect(await driver.getText(success), 'Вы успешно зарегистрировались');
      },
    );

  });
}
