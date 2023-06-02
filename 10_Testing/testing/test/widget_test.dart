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

      //Email и Phone
      //2. Тест начального состояния что автоматически не лоиниться с пустыми полями
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

      //2 Проверка валидного адреса
      //2.1 Email








      //3 Проверка на невалидность
      //3.1

      //3.2 Email
      Future<void> TestWidgetEmail(WidgetTester tester, String email) async{
        print(email);
        expect(tester.widget<TextFormField>(find.byKey(Key('textEmailField'))).initialValue, '');
        expect(tester.widget<TextFormField>(find.byKey(Key('textPhoneField'))).initialValue, '');
        await tester.enterText(find.byKey(Key('textEmailField')), email);
        expect(find.text(email), findsOneWidget);
        await tester.tap(find.byKey(Key('buttonSendField')));
        await tester.pumpAndSettle();
        expect( find.text('Email',findRichText: true), findsOneWidget);
        expect((tester.firstWidget(find.text('Email',findRichText: true)) as RichText).text.style!.color, Color(0xffd32f2f));
        expect( find.text('Поле email заполнено не корректно', findRichText: true), findsOneWidget);
        expect((tester.firstWidget(find.text('Поле email заполнено не корректно', findRichText: true)) as RichText).text.style!.color, Color(0xffd32f2f));
        expect( find.text('Phone',findRichText: true), findsOneWidget);
        expect((tester.firstWidget(find.text('Phone',findRichText: true)) as RichText).text.style!.color, Color(0x99000000));
        expect( find.text('Введите телефон', findRichText: true), findsOneWidget);
        expect((tester.firstWidget(find.text('Введите телефон', findRichText: true)) as RichText).text.style!.color, Color(0xffd32f2f));
      }
      //3.2.1 Отсутствие @ в email
      await TestWidgetEmail(tester, 'testtest.tst');
      //3.2.2 Отсутствие локальной части
      await TestWidgetEmail(tester, '@test.tst');
      //3.2.3 Отсутствие доменной части
      await TestWidgetEmail(tester, 'test@');
      //3.2.4 Содержит две точки подряд
      await TestWidgetEmail(tester, 'test@test..ru');
      //3.2.5 Локальная часть начинается с . (точки)
      await TestWidgetEmail(tester, '.test@test.ru');
      //3.2.6 Доменная часть начинается с . (точки)
      await TestWidgetEmail(tester, 'test@.test.ru');
      //менять валидатор с мылом
      //3.2.6 Превышение длины локальной части (максимальная допустимая 64 символа)
      //String text = List<String>.generate(65, (index) => 'a').join('');
      //await TestWidgetEmail(tester, '$text@test.ru');
      //3.2.7 Превышение длины доменного имени (максимальная допустимая 255 символов)
      //text = List<String>.generate(256, (index) => 'a').join('');
      //await TestWidgetEmail(tester, 'test@$text.ru');
      //3.2.8 Превышение длины участка доменного имени между точками (максимальная допустимая 63 символа)
      //text = List<String>.generate(64, (index) => 'a').join('');
      //await TestWidgetEmail(tester, 'test@test$text.ru');

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
