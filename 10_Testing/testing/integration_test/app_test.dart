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

/*final emailField = find.ancestor(
      of: find.text('Email'),
      matching: find.byType(TextFormField),
    );

    await tester.enterText(emailField, "testing");
    expect(find.text('testing') , findsOneWidget);

    testWidgets('Mail And Password are Empty and initialed correctly', (widgetTester) async {
    await widgetTester.pumpWidget(createWidgetUnderTest());
    final TextFormField mailField = widgetTester.widget<TextFormField>(find.byKey(const Key('mailFormKey')));
    final EditableText passwordField = widgetTester.widget<EditableText>(find.byKey(const Key('passwordFormKey')));

    expect(mailField.controller?.value, '');
    expect(passwordField.controller?.value, '');
    expect(mailField.initialValue, '');
    expect(passwordField.initialValue, '');
    expect(passwordField.obscureText, true);

    List<TextField> textFields = List<TextField>();

find.byType(TextField).evaluate().toList().forEach((element) {
    textFields.add(element.widget);
});

*/

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login form tests', ()
  {
    testWidgets('.1.тесты для формы входа',
            (tester) async {
          app.main();
          await tester.pumpAndSettle();

          // TODO: write tests

          final Finder filedFinderEmail = find.byKey(
              const Key('textEmailField'));
          expect(filedFinderEmail, findsOneWidget);
          final Finder filedFinderPhone = find.byKey(
              const Key('textPhoneField'));
          expect(filedFinderPhone, findsOneWidget);
          final Finder filedFinderSend = find.byKey(
              const Key('buttonSendField'));
          expect(filedFinderSend, findsOneWidget);

          ///flutter test integration_test/app_test.dart

          //Задание
          //     В поле email должен быть валидный email-адрес, и оно не должно быть пустым.
          //     Нужно проверить, что в поле phone введены только цифры.
          //     При клике на кнопку «Отправить» нужно убедиться, что на экране появилась надпись «Добро пожаловать».
          final TextFormField mailField = tester.widget<TextFormField>(filedFinderEmail);
          expect(mailField.initialValue, '');
          await tester.enterText(filedFinderEmail, 'test@test.tst');
          expect(find.text('test@test.tst'), findsOneWidget);
          expect(mailField.controller?.text, 'test@test.tst');
          final TextFormField phoneField = tester.widget<TextFormField>(filedFinderPhone);
          expect(phoneField.initialValue, '');
          expect(phoneField.controller?.text, '');
          await tester.enterText(filedFinderPhone, '88008888080');
          expect(find.text('88008888080'), findsOneWidget);
          expect(phoneField.controller?.text, '88008888080');
          await tester.tap(filedFinderSend);
          await tester.pump();
          expect( find.text('Email',findRichText: true), findsOneWidget);
          expect( find.text('Введите email', findRichText: true), findsNothing);
          expect( find.text('Поле email заполнено не корректно', findRichText: true), findsNothing);
          expect( find.text('Phone',findRichText: true), findsOneWidget);
          expect( find.text('Введите телефон', findRichText: true), findsNothing);
          expect(find.text('Добро пожаловать'), findsOneWidget);

          await tester.pump(const Duration(seconds: 5));
        });

    testWidgets('.2.тесты для формы регистрации',
            (tester) async {
          app.main();
          await tester.pumpAndSettle();

          // TODO: write tests

          // Переходим на форму регистрации
          await tester.tap(find.text('Регистрация',findRichText: true));
          await tester.pumpAndSettle();

          final Finder filedFinderEmail = find.byKey(
              const Key('textEmailField'));
          expect(filedFinderEmail, findsOneWidget);
          final Finder filedFinderPhone = find.byKey(
              const Key('textPhoneField'));
          expect(filedFinderPhone, findsOneWidget);
          final Finder filedFinderSend = find.byKey(
              const Key('buttonSendField'));
          expect(filedFinderSend, findsOneWidget);
          final Finder filedFirstName = find.byKey(const Key('textFirstNameField'));
          expect(filedFirstName, findsOneWidget);
          final Finder filedLastName = find.byKey(const Key('textLastNameField'));
          expect(filedLastName, findsOneWidget);

          ///flutter test integration_test/app_test.dart

          //Задание
          //     В поле email должен быть валидный email-адрес, и оно не должно быть пустым.
          //     Нужно проверить, что в поле phone введены только цифры.

          //     Поля firstName и lastName не должны быть пустыми.
          //    При клике на кнопку «Отправить» нужно убедиться, что на экране появилась надпись «Вы успешно зарегистрировались».
          final TextFormField mailField = tester.widget<TextFormField>(filedFinderEmail);
          expect(mailField.initialValue, '');
          await tester.enterText(filedFinderEmail, 'test@test.tst');
          expect(find.text('test@test.tst'), findsOneWidget);
          expect(mailField.controller?.text, 'test@test.tst');
          final TextFormField phoneField = tester.widget<TextFormField>(filedFinderPhone);
          expect(phoneField.initialValue, '');
          expect(phoneField.controller?.text, '');
          await tester.enterText(filedFinderPhone, '88008888080');
          expect(find.text('88008888080'), findsOneWidget);
          expect(phoneField.controller?.text, '88008888080');
          final TextFormField firstNameField = tester.widget<TextFormField>(filedFirstName);
          expect(firstNameField.initialValue, '');
          expect(firstNameField.controller?.text, '');
          await tester.enterText(find.byKey(const Key('textFirstNameField')), 'text First Name Field');
          expect(find.text('text First Name Field'), findsOneWidget);
          expect(firstNameField.controller?.text, 'text First Name Field');
          final TextFormField lastNameField = tester.widget<TextFormField>(filedLastName);
          expect(lastNameField.initialValue, '');
          expect(lastNameField.controller?.text, '');
          await tester.enterText(filedLastName, 'text Last Name Field');
          expect(find.text('text Last Name Field'), findsOneWidget);
          expect(lastNameField.controller?.text, 'text Last Name Field');
          await tester.tap(filedFinderSend);
          await tester.pump();

          expect( find.text('Last name', findRichText: true), findsOneWidget);
          expect( find.text('Введите фамилию', findRichText: true), findsNothing);
          expect( find.text('Phone',findRichText: true), findsOneWidget);
          expect( find.text('Заполните поле телефон', findRichText: true), findsNothing);
          expect( find.text('Email',findRichText: true), findsOneWidget);
          expect( find.text('Заполните поле email', findRichText: true), findsNothing);
          expect( find.text('Поле email заполнено не корректно', findRichText: true), findsNothing);
          expect( find.text('Phone',findRichText: true), findsOneWidget);
          expect( find.text('Введите телефон', findRichText: true), findsNothing);
          expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);

          await tester.pump(const Duration(seconds: 5));
        });
  });
}
