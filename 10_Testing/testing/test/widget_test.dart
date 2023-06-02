import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testing/views/login_view.dart';

void main() {
  group('Login view tests', () {
    testWidgets("test description", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));
      // TODO: write tests
      //1. Тесты проверки формы, что все есть и ничего не забыли
      expect(find.text('Вход',findRichText: true), findsOneWidget);
      expect(find.text('Email',findRichText: true), findsOneWidget);
      expect(find.byKey(Key('textEmailField')), findsOneWidget);
      expect( find.text('Введите email', findRichText: true), findsNothing);
      expect(find.text('Phone',findRichText: true), findsOneWidget);
      expect(find.byKey(Key('textPhoneField')), findsOneWidget);
      expect( find.text('Введите телефон', findRichText: true), findsNothing);
      expect(find.byKey(Key('buttonSendField')), findsOneWidget);
      expect(find.text('Отправить'), findsOneWidget);
      expect(find.text('Добро пожаловать'), findsNothing);
      expect(find.text('Уже есть аккаунт?'), findsOneWidget);
      expect(find.text('Еще нет аккаунта?'), findsNothing);
      expect(find.text('Войти',findRichText: true), findsOneWidget);
      expect(find.text('Регистрация',findRichText: true), findsNothing);

      //2. Тест что поля изначально пустые и пытаемся залогиниться
      expect(tester.widget<TextFormField>(find.byKey(Key('textEmailField'))).initialValue, '');
      expect(tester.widget<TextFormField>(find.byKey(Key('textPhoneField'))).initialValue, '');
      await tester.tap(find.byKey(Key('buttonSendField')));
      await tester.pumpAndSettle();
      expect( find.text('Email',findRichText: true), findsOneWidget);
      expect((tester.firstWidget(find.text('Email',findRichText: true)) as RichText).text.style!.color, Color(0x99000000));
      expect( find.text('Введите email', findRichText: true), findsOneWidget);
      expect((tester.firstWidget(find.text('Введите email', findRichText: true)) as RichText).text.style!.color, Color(0xffd32f2f));
      expect( find.text('Phone',findRichText: true), findsOneWidget);
      expect((tester.firstWidget(find.text('Phone',findRichText: true)) as RichText).text.style!.color, Color(0x99000000));
      expect( find.text('Введите телефон', findRichText: true), findsOneWidget);
      expect((tester.firstWidget(find.text('Введите телефон', findRichText: true)) as RichText).text.style!.color, Color(0xffd32f2f));

      //3. Вводим неправильное мыло и пытаемся залогиниться (бе)
      expect(tester.widget<TextFormField>(find.byKey(Key('textEmailField'))).initialValue, '');
      expect(tester.widget<TextFormField>(find.byKey(Key('textPhoneField'))).initialValue, '');
      await tester.enterText(find.byKey(Key('textEmailField')), 'testtest.tes');
      await tester.tap(find.byKey(Key('buttonSendField')));
      await tester.pumpAndSettle();
      expect( find.text('Email',findRichText: true), findsOneWidget);
      expect((tester.firstWidget(find.text('Email',findRichText: true)) as RichText).text.style!.color, Color(0xffd32f2f));
      expect( find.text('Введите email', findRichText: true), findsOneWidget);
      expect((tester.firstWidget(find.text('Введите email', findRichText: true)) as RichText).text.style!.color, Color(0xffd32f2f));
      expect( find.text('Phone',findRichText: true), findsOneWidget);
      expect((tester.firstWidget(find.text('Phone',findRichText: true)) as RichText).text.style!.color, Color(0x99000000));
      expect( find.text('Введите телефон', findRichText: true), findsOneWidget);
      expect((tester.firstWidget(find.text('Введите телефон', findRichText: true)) as RichText).text.style!.color, Color(0xffd32f2f));


      //
      // await tester.enterText(find.byKey(Key('textPhoneField')), '');
      // await tester.tap(find.byKey(Key('buttonSendField')));
      // expect(find.text(''), findsNWidgets(2));
      // expect(find.text('Введите email', findRichText: true), findsOneWidget);
      // expect(find.text('Введите телефон', findRichText: true), findsOneWidget);



      //await tester.enterText(find.byKey(Key('textEmailField')), 'testtest.tes');
      //expect(find.text('testtest.tes'), findsNothing);
      // await tester.enterText(find.byKey(Key('textEmailField')), 'test@testtes');
      // expect(find.text('test@test.tes'), findsNothing);
      // await tester.enterText(find.byKey(Key('textEmailField')), 'test@test.tes');
      // expect(find.text('test@test.tes'), findsOneWidget);


    });
  });
}
