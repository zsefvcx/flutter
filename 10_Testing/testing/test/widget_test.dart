import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testing/views/login_view.dart';

void main() {
  group('Login view tests', () {

    testWidgets("login_form test", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
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
      expect(tester.widget<TextFormField>(find.byKey(const Key('textEmailField'))).initialValue, '');
      expect( find.text('Введите email', findRichText: true), findsNothing);
      expect( find.text('Поле email заполнено не корректно', findRichText: true), findsNothing);
      expect(find.text('Phone',findRichText: true), findsOneWidget);
      expect(find.byKey(Key('textPhoneField')), findsOneWidget);
      expect(tester.widget<TextFormField>(find.byKey(const Key('textPhoneField'))).initialValue, '');
      expect( find.text('Введите телефон', findRichText: true), findsNothing);
      expect(find.byKey(Key('buttonSendField')), findsOneWidget);
      expect(find.text('Отправить'), findsOneWidget);
      expect(find.text('Добро пожаловать'), findsNothing);
      expect(find.text('Уже есть аккаунт?'), findsNothing);
      expect(find.text('Еще нет аккаунта?'), findsOneWidget);
      expect(find.text('Войти',findRichText: true), findsNothing);
      expect(find.text('Регистрация',findRichText: true), findsOneWidget);

      //Email и Phone Проверка на невалидность
      //2. Тест начального состояния что автоматически не логиниться с пустыми полями
      await tester.tap(find.byKey(const Key('buttonSendField')));
      await tester.pumpAndSettle();
      expect( find.text('Email',findRichText: true), findsOneWidget);
      expect( find.text('Введите email', findRichText: true), findsOneWidget);
      expect( find.text('Phone',findRichText: true), findsOneWidget);
      expect( find.text('Введите телефон', findRichText: true), findsOneWidget);

      //3 Проверка валидного Email адреса
      Future<void> testWidgetEmail0(WidgetTester tester, String email) async{
        await tester.enterText(find.byKey(const Key('textEmailField')), email);
        expect(find.text(email), findsOneWidget);
        await tester.enterText(find.byKey(const Key('textPhoneField')), '88008888080');
        expect(find.text('88008888080'), findsOneWidget);
        await tester.tap(find.byKey(const Key('buttonSendField')));
        await tester.pumpAndSettle();
        expect( find.text('Email',findRichText: true), findsOneWidget);
        expect( find.text('Поле email заполнено не корректно', findRichText: true), findsNothing);
        expect( find.text('Введите email', findRichText: true), findsNothing);
        expect( find.text('Phone',findRichText: true), findsOneWidget);
        expect( find.text('Введите телефон', findRichText: true), findsNothing);
        expect(find.text('Добро пожаловать'), findsOneWidget);
        await tester.tap(find.byKey(const Key('buttonSendField')));//как бы выходим из системы. Дописывать форму не стал.
        await tester.pumpAndSettle();
      }

      //3.1 Валидный email, содержащий строчный и заглавные буквы
      await testWidgetEmail0(tester, 'Test@test.tst');
      //3.2 Начинающийся с цифры в локальной части email
      await testWidgetEmail0(tester, '4Test@test.tst');
      //3.3 Начинающийся с цифры в доменной части email
      await testWidgetEmail0(tester, 'Test@4test.tst');
      //3.4 Email c несколькими точками в локальной и доменной части
      await testWidgetEmail0(tester, 'test.test@test.test.tst');
      //3.5 Email с дефисом в локальной части email
      await testWidgetEmail0(tester, 'test-test@test.test.tst');
      //3.6 Email с дефисом в доменной части email
      await testWidgetEmail0(tester, 'test.test@test-test.tst');
      //3.7 Email с нижним подчёркиванием в локальной части email
      await testWidgetEmail0(tester, 'test_test@test.test.tst');
      //3.8 Email с нижним подчёркиванием в доменной части email
      //await testWidgetEmail0(tester, 'test.test@test_test.tst');
      //3.9 Длинный Email (локальная часть 64 символа, доменная состоит из 3 участков по 63 символа, разделённых точками)
      //String text0 = List<String>.generate(63, (index) => 'a').join('');
      //await testWidgetEmail0(tester, '$text0@.$text0.$text0');

      //4 Проверка на невалидность
      //Email
      Future<void> testWidgetEmail1(WidgetTester tester, String email) async{
        await tester.enterText(find.byKey(const Key('textPhoneField')), '88008888080');
        expect(find.text('88008888080'), findsOneWidget);
        await tester.enterText(find.byKey(const Key('textEmailField')), email);
        expect(find.text(email), findsOneWidget);
        await tester.tap(find.byKey(const Key('buttonSendField')));
        await tester.pumpAndSettle();
        expect( find.text('Email',findRichText: true), findsOneWidget);
        expect( find.text('Поле email заполнено не корректно', findRichText: true), findsOneWidget);
        expect( find.text('Введите email', findRichText: true), findsNothing);
        expect( find.text('Phone',findRichText: true), findsOneWidget);
        expect( find.text('Введите телефон', findRichText: true), findsNothing);
        expect(find.text('Добро пожаловать'), findsNothing);
      }
      //4.1 Поле c ' '
      await testWidgetEmail1(tester, ' ');
      await testWidgetEmail1(tester, ' test@test.tst');
      //4.2 Отсутствие @ в email
      await testWidgetEmail1(tester, 'testtest.tst');
      //4.3 Отсутствие локальной части
      await testWidgetEmail1(tester, '@test.tst');
      //4.4 Отсутствие доменной части
      await testWidgetEmail1(tester, 'test@');
      //4.5 Содержит две точки подряд
      await testWidgetEmail1(tester, 'test@test..ru');
      //4.5 Локальная часть начинается с . (точки)
      await testWidgetEmail1(tester, '.test@test.ru');
      //4.6 Доменная часть начинается с . (точки)
      await testWidgetEmail1(tester, 'test@.test.ru');
      //4.7 Превышение длины локальной части (максимальная допустимая 64 символа)
      //String text = List<String>.generate(65, (index) => 'a').join('');
      //await TestWidgetEmail(tester, '$text@test.ru');
      //4.8 Превышение длины доменного имени (максимальная допустимая 255 символов)
      //text = List<String>.generate(256, (index) => 'a').join('');
      //await TestWidgetEmail(tester, 'test@$text.ru');
      //4.9 Превышение длины участка доменного имени между точками (максимальная допустимая 63 символа)
      //text = List<String>.generate(64, (index) => 'a').join('');
      //await TestWidgetEmail(tester, 'test@test$text.ru');

      //5 Проверка валидного телефонного номера
      //Phone
      Future<void> testWidgetPhone0(WidgetTester tester, String phone) async{
        await tester.enterText(find.byKey(const Key('textEmailField')), 'test@test.test.tst');
        expect(find.text('test@test.test.tst'), findsOneWidget);
        await tester.enterText(find.byKey(const Key('textPhoneField')), phone);
        expect(find.text(phone), findsOneWidget);
        await tester.tap(find.byKey(const Key('buttonSendField')));
        await tester.pumpAndSettle();
        expect( find.text('Email',findRichText: true), findsOneWidget);
        expect( find.text('Поле email заполнено не корректно', findRichText: true), findsNothing);
        expect( find.text('Введите email', findRichText: true), findsNothing);
        expect( find.text('Phone',findRichText: true), findsOneWidget);
        expect( find.text('Введите телефон', findRichText: true), findsNothing);
        expect(find.text('Добро пожаловать'), findsOneWidget);
        await tester.tap(find.byKey(const Key('buttonSendField')));//как бы выходим из системы. Дописывать форму не стал.
        await tester.pumpAndSettle();
      }
      //5.1 Валидный номер
      await testWidgetPhone0(tester, '88008888080');
      //5.2 Валидный номер не менее 16 символов
      await testWidgetPhone0(tester, '8800888808088888');
      //5.3 Валидный номер не более 3 символов
      await testWidgetPhone0(tester, '800');

      //6 Проверка не валидного телефонного номера
      //Phone
      Future<void> testWidgetPhone1(WidgetTester tester, String phone, [String? phone2]) async{
        await tester.enterText(find.byKey(const Key('textEmailField')), 'test@test.test.tst');
        expect(find.text('test@test.test.tst'), findsOneWidget);
        await tester.enterText(find.byKey(const Key('textPhoneField')), '');
        await tester.enterText(find.byKey(const Key('textPhoneField')), phone);
        expect(find.text(phone2??phone), findsOneWidget);
        await tester.tap(find.byKey(const Key('buttonSendField')));
        await tester.pumpAndSettle();
        expect(find.text('Email',findRichText: true), findsOneWidget);
        expect(find.text('Поле email заполнено не корректно', findRichText: true), findsNothing);
        expect(find.text('Введите email', findRichText: true), findsNothing);
        expect(find.text('Phone',findRichText: true), findsOneWidget);
        if (phone2 ==null){
          expect(find.text('Введите телефон', findRichText: true), findsOneWidget);
          expect(find.text('Добро пожаловать'), findsNothing);
        } else {
          expect(find.text('Введите телефон', findRichText: true), findsNothing);
          expect(find.text('Добро пожаловать'), findsOneWidget);
          await tester.tap(find.byKey(const Key('buttonSendField')));//как бы выходим из системы. Дописывать форму не стал.
          await tester.pumpAndSettle();
        }
      }
      //5.1 номер содержит символы
      await testWidgetPhone1(tester, '8800AAA8A080', '88008080');
      //5.2 Валидный номер более 16 символов
      await testWidgetPhone1(tester, '88008888080888885555');
      //5.3 Валидный номер менее 3 символов
      await testWidgetPhone1(tester, '80');
    });

    testWidgets("register_form test", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));
      // TODO: write tests
      // Переходим на форму регистрации
      await tester.tap(find.text('Регистрация',findRichText: true));
      await tester.pumpAndSettle();

      //1. Тесты проверки формы, что все есть и ничего не забыли
      expect(find.text('Вход',findRichText: true), findsNothing);
      expect(find.text('Регистрация',findRichText: true), findsOneWidget);

      expect( find.text('First name', findRichText: true), findsOneWidget);
      expect(find.byKey(const Key('textFirstNameField')), findsOneWidget);
      expect(tester.widget<TextFormField>(find.byKey(const Key('textFirstNameField'))).initialValue, '');
      expect( find.text('Введите имя', findRichText: true), findsNothing);

      expect( find.text('Last name', findRichText: true), findsOneWidget);
      expect(find.byKey(const Key('textLastNameField')), findsOneWidget);
      expect(tester.widget<TextFormField>(find.byKey(const Key('textLastNameField'))).initialValue, '');
      expect( find.text('Введите фамилию', findRichText: true), findsNothing);

      expect(find.text('Email',findRichText: true), findsOneWidget);
      expect(find.byKey(const Key('textEmailField')), findsOneWidget);
      expect(tester.widget<TextFormField>(find.byKey(const Key('textEmailField'))).initialValue, '');
      expect( find.text('Заполните поле email', findRichText: true), findsNothing);
      expect( find.text('Поле email заполнено не корректно', findRichText: true), findsNothing);

      expect(find.text('Phone',findRichText: true), findsOneWidget);
      expect(find.byKey(const Key('textPhoneField')), findsOneWidget);
      expect(tester.widget<TextFormField>(find.byKey(const Key('textPhoneField'))).initialValue, '');
      expect( find.text('Заполните поле телефон', findRichText: true), findsNothing);

      expect(find.byKey(const Key('buttonSendField')), findsOneWidget);
      expect(find.text('Отправить'), findsOneWidget);

      expect(find.text('Вы успешно зарегистрировались'), findsNothing);

      expect(find.text('Уже есть аккаунт?'), findsOneWidget);
      expect(find.text('Еще нет аккаунта?'), findsNothing);
      expect(find.text('Войти',findRichText: true), findsOneWidget);


      //Email, Phone, First name и Last name Проверка на невалидность
      //2. Тест начального состояния что автоматически не регистрируется с пустыми полями
      await tester.tap(find.byKey(const Key('buttonSendField')));
      await tester.pumpAndSettle();
      expect( find.text('First name', findRichText: true), findsOneWidget);
      expect( find.text('Введите имя', findRichText: true), findsOneWidget);

      expect( find.text('Last name', findRichText: true), findsOneWidget);
      expect( find.text('Введите фамилию', findRichText: true), findsOneWidget);

      expect( find.text('Phone',findRichText: true), findsOneWidget);
      expect( find.text('Заполните поле телефон', findRichText: true), findsOneWidget);

      expect( find.text('Email',findRichText: true), findsOneWidget);
      expect( find.text('Заполните поле email', findRichText: true), findsOneWidget);
      expect( find.text('Поле email заполнено не корректно', findRichText: true), findsNothing);

      expect(find.text('Вы успешно зарегистрировались'), findsNothing);

      //3.2 проверка Поля firstName и lastName не должны быть пустыми. тест - Поля заполнены.
      await tester.enterText(find.byKey(const Key('textFirstNameField')), 'text First Name Field');
      expect(find.text('text First Name Field'), findsOneWidget);
      await tester.enterText(find.byKey(const Key('textLastNameField')), 'text Last Name Field');
      expect(find.text('text Last Name Field'), findsOneWidget);
      await tester.enterText(find.byKey(const Key('textEmailField')), 'test@test.tst');
      expect(find.text('test@test.tst'), findsOneWidget);
      await tester.enterText(find.byKey(const Key('textPhoneField')), '88008888080');
      expect(find.text('88008888080'), findsOneWidget);

      await tester.tap(find.byKey(const Key('buttonSendField')));
      await tester.pumpAndSettle();
      expect( find.text('First name', findRichText: true), findsOneWidget);
      expect( find.text('Введите имя', findRichText: true), findsNothing);

      expect( find.text('Last name', findRichText: true), findsOneWidget);
      expect( find.text('Введите фамилию', findRichText: true), findsNothing);

      expect( find.text('Phone',findRichText: true), findsOneWidget);
      expect( find.text('Заполните поле телефон', findRichText: true), findsNothing);

      expect( find.text('Email',findRichText: true), findsOneWidget);
      expect( find.text('Заполните поле email', findRichText: true), findsNothing);
      expect( find.text('Поле email заполнено не корректно', findRichText: true), findsNothing);

      expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
      await tester.tap(find.byKey(const Key('buttonSendField')));//как бы выходим из системы. Дописывать форму не стал.
      await tester.pumpAndSettle();

      //3.1 проверка Поля firstName и lastName не должны быть пустыми. тест - Поля пустые.
      await tester.enterText(find.byKey(const Key('textFirstNameField')), '');
      await tester.enterText(find.byKey(const Key('textLastNameField')), '');

      await tester.enterText(find.byKey(const Key('textEmailField')), 'test@test.tst');
      expect(find.text('test@test.tst'), findsOneWidget);
      await tester.enterText(find.byKey(const Key('textPhoneField')), '88008888080');
      expect(find.text('88008888080'), findsOneWidget);

      await tester.tap(find.byKey(const Key('buttonSendField')));
      await tester.pumpAndSettle();
      expect( find.text('First name', findRichText: true), findsOneWidget);
      expect( find.text('Введите имя', findRichText: true), findsOneWidget);

      expect( find.text('Last name', findRichText: true), findsOneWidget);
      expect( find.text('Введите фамилию', findRichText: true), findsOneWidget);

      expect( find.text('Phone',findRichText: true), findsOneWidget);
      expect( find.text('Заполните поле телефон', findRichText: true), findsNothing);

      expect( find.text('Email',findRichText: true), findsOneWidget);
      expect( find.text('Заполните поле email', findRichText: true), findsNothing);
      expect( find.text('Поле email заполнено не корректно', findRichText: true), findsNothing);

      expect(find.text('Вы успешно зарегистрировались'), findsNothing);


      //4 Проверка валидного Email адреса
      Future<void> testWidgetEmail0(WidgetTester tester, String email) async{
        await tester.enterText(find.byKey(const Key('textFirstNameField')), 'text First Name Field');
        expect(find.text('text First Name Field'), findsOneWidget);
        await tester.enterText(find.byKey(const Key('textLastNameField')), 'text Last Name Field');
        expect(find.text('text Last Name Field'), findsOneWidget);

        await tester.enterText(find.byKey(const Key('textEmailField')), email);
        expect(find.text(email), findsOneWidget);

        await tester.enterText(find.byKey(const Key('textPhoneField')), '88008888080');
        expect(find.text('88008888080'), findsOneWidget);
        await tester.tap(find.byKey(const Key('buttonSendField')));
        await tester.pumpAndSettle();
        expect( find.text('First name', findRichText: true), findsOneWidget);
        expect( find.text('Введите имя', findRichText: true), findsNothing);

        expect( find.text('Last name', findRichText: true), findsOneWidget);
        expect( find.text('Введите фамилию', findRichText: true), findsNothing);

        expect( find.text('Phone',findRichText: true), findsOneWidget);
        expect( find.text('Заполните поле телефон', findRichText: true), findsNothing);

        expect( find.text('Email',findRichText: true), findsOneWidget);
        expect( find.text('Заполните поле email', findRichText: true), findsNothing);
        expect( find.text('Поле email заполнено не корректно', findRichText: true), findsNothing);

        expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
        await tester.tap(find.byKey(const Key('buttonSendField')));//как бы выходим из системы. Дописывать форму не стал.
        await tester.pumpAndSettle();
      }

      //4.1 Валидный email, содержащий строчный и заглавные буквы
      await testWidgetEmail0(tester, 'Test@test.tst');
      //4.2 Начинающийся с цифры в локальной части email
      await testWidgetEmail0(tester, '4Test@test.tst');
      //4.3 Начинающийся с цифры в доменной части email
      await testWidgetEmail0(tester, 'Test@4test.tst');
      //4.4 Email c несколькими точками в локальной и доменной части
      await testWidgetEmail0(tester, 'test.test@test.test.tst');
      //4.5 Email с дефисом в локальной части email
      await testWidgetEmail0(tester, 'test-test@test.test.tst');
      //4.6 Email с дефисом в доменной части email
      await testWidgetEmail0(tester, 'test.test@test-test.tst');
      //4.7 Email с нижним подчёркиванием в локальной части email
      await testWidgetEmail0(tester, 'test_test@test.test.tst');
      //4.8 Email с нижним подчёркиванием в доменной части email
      //await testWidgetEmail0(tester, 'test.test@test_test.tst');
      //4.9 Длинный Email (локальная часть 64 символа, доменная состоит из 3 участков по 63 символа, разделённых точками)
      //String text0 = List<String>.generate(63, (index) => 'a').join('');
      //await testWidgetEmail0(tester, '$text0@.$text0.$text0');

      //5 Проверка на невалидность
      //Email
      Future<void> testWidgetEmail1(WidgetTester tester, String email) async{
        await tester.enterText(find.byKey(const Key('textFirstNameField')), 'text First Name Field');
        expect(find.text('text First Name Field'), findsOneWidget);
        await tester.enterText(find.byKey(const Key('textLastNameField')), 'text Last Name Field');
        expect(find.text('text Last Name Field'), findsOneWidget);

        await tester.enterText(find.byKey(const Key('textEmailField')), email);
        expect(find.text(email), findsOneWidget);

        await tester.enterText(find.byKey(const Key('textPhoneField')), '88008888080');
        expect(find.text('88008888080'), findsOneWidget);

        await tester.tap(find.byKey(const Key('buttonSendField')));
        await tester.pumpAndSettle();
        expect( find.text('First name', findRichText: true), findsOneWidget);
        expect( find.text('Введите имя', findRichText: true), findsNothing);

        expect( find.text('Last name', findRichText: true), findsOneWidget);
        expect( find.text('Введите фамилию', findRichText: true), findsNothing);

        expect( find.text('Phone',findRichText: true), findsOneWidget);
        expect( find.text('Заполните поле телефон', findRichText: true), findsNothing);

        expect( find.text('Email',findRichText: true), findsOneWidget);
        expect( find.text('Заполните поле email', findRichText: true), findsNothing);
        expect( find.text('Поле email заполнено не корректно', findRichText: true), findsOneWidget);

        expect(find.text('Вы успешно зарегистрировались'), findsNothing);
      }
      //5.1 Поле c ' '
      await testWidgetEmail1(tester, ' ');
      await testWidgetEmail1(tester, ' test@test.tst');
      //5.2 Отсутствие @ в email
      await testWidgetEmail1(tester, 'testtest.tst');
      //5.3 Отсутствие локальной части
      await testWidgetEmail1(tester, '@test.tst');
      //5.4 Отсутствие доменной части
      await testWidgetEmail1(tester, 'test@');
      //5.5 Содержит две точки подряд
      await testWidgetEmail1(tester, 'test@test..ru');
      //5.6 Локальная часть начинается с . (точки)
      await testWidgetEmail1(tester, '.test@test.ru');
      //5.7 Доменная часть начинается с . (точки)
      await testWidgetEmail1(tester, 'test@.test.ru');
      //5.8 Превышение длины локальной части (максимальная допустимая 64 символа)
      //String text = List<String>.generate(65, (index) => 'a').join('');
      //await TestWidgetEmail(tester, '$text@test.ru');
      //5.9 Превышение длины доменного имени (максимальная допустимая 255 символов)
      //text = List<String>.generate(256, (index) => 'a').join('');
      //await TestWidgetEmail(tester, 'test@$text.ru');
      //5.10 Превышение длины участка доменного имени между точками (максимальная допустимая 63 символа)
      //text = List<String>.generate(64, (index) => 'a').join('');
      //await TestWidgetEmail(tester, 'test@test$text.ru');

      //6 Проверка валидного телефонного номера
      //Phone
      Future<void> testWidgetPhone0(WidgetTester tester, String phone) async{
        await tester.enterText(find.byKey(const Key('textFirstNameField')), 'text First Name Field');
        expect(find.text('text First Name Field'), findsOneWidget);
        await tester.enterText(find.byKey(const Key('textLastNameField')), 'text Last Name Field');
        expect(find.text('text Last Name Field'), findsOneWidget);
        await tester.enterText(find.byKey(const Key('textEmailField')), 'test@test.test.tst');
        expect(find.text('test@test.test.tst'), findsOneWidget);

        await tester.enterText(find.byKey(const Key('textPhoneField')), phone);
        expect(find.text(phone), findsOneWidget);

        await tester.tap(find.byKey(const Key('buttonSendField')));
        await tester.pumpAndSettle();

        expect( find.text('First name', findRichText: true), findsOneWidget);
        expect( find.text('Введите имя', findRichText: true), findsNothing);

        expect( find.text('Last name', findRichText: true), findsOneWidget);
        expect( find.text('Введите фамилию', findRichText: true), findsNothing);

        expect( find.text('Phone',findRichText: true), findsOneWidget);
        expect( find.text('Заполните поле телефон', findRichText: true), findsNothing);

        expect( find.text('Email',findRichText: true), findsOneWidget);
        expect( find.text('Заполните поле email', findRichText: true), findsNothing);
        expect( find.text('Поле email заполнено не корректно', findRichText: true), findsNothing);

        expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
        await tester.tap(find.byKey(const Key('buttonSendField')));//как бы выходим из системы. Дописывать форму не стал.
        await tester.pumpAndSettle();
      }
      //6.1 Валидный номер
      await testWidgetPhone0(tester, '88008888080');
      //6.2 Валидный номер не менее 16 символов
      await testWidgetPhone0(tester, '8800888808088888');
      //6.3 Валидный номер не более 3 символов
      await testWidgetPhone0(tester, '800');

      //7 Проверка не валидного телефонного номера
      //Phone
      Future<void> testWidgetPhone1(WidgetTester tester, String phone, [String? phone2]) async{
        await tester.enterText(find.byKey(const Key('textFirstNameField')), 'text First Name Field');
        expect(find.text('text First Name Field'), findsOneWidget);
        await tester.enterText(find.byKey(const Key('textLastNameField')), 'text Last Name Field');
        expect(find.text('text Last Name Field'), findsOneWidget);
        await tester.enterText(find.byKey(const Key('textEmailField')), 'test@test.test.tst');
        expect(find.text('test@test.test.tst'), findsOneWidget);
        await tester.enterText(find.byKey(const Key('textEmailField')), 'test@test.test.tst');
        expect(find.text('test@test.test.tst'), findsOneWidget);
        await tester.enterText(find.byKey(const Key('textPhoneField')), '');

        await tester.enterText(find.byKey(const Key('textPhoneField')), phone);
        expect(find.text(phone2??phone), findsOneWidget);

        await tester.tap(find.byKey(const Key('buttonSendField')));
        await tester.pumpAndSettle();

        expect( find.text('First name', findRichText: true), findsOneWidget);
        expect( find.text('Введите имя', findRichText: true), findsNothing);

        expect( find.text('Last name', findRichText: true), findsOneWidget);
        expect( find.text('Введите фамилию', findRichText: true), findsNothing);

        expect( find.text('Email',findRichText: true), findsOneWidget);
        expect( find.text('Заполните поле email', findRichText: true), findsNothing);
        expect( find.text('Поле email заполнено не корректно', findRichText: true), findsNothing);

        expect( find.text('Phone',findRichText: true), findsOneWidget);
        if (phone2 ==null){
          expect( find.text('Заполните поле телефон', findRichText: true), findsOneWidget);
          expect(find.text('Вы успешно зарегистрировались'), findsNothing);
        } else {
          expect( find.text('Заполните поле телефон', findRichText: true), findsNothing);
          expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
          await tester.tap(find.byKey(const Key('buttonSendField')));//как бы выходим из системы. Дописывать форму не стал.
          await tester.pumpAndSettle();
        }
      }
      //7.1 номер содержит символы
      await testWidgetPhone1(tester, '8800AAA8A080', '88008080');
      //7.2 Валидный номер более 16 символов
      await testWidgetPhone1(tester, '88008888080888885555');
      //7.3 Валидный номер менее 3 символов
      await testWidgetPhone1(tester, '80');
    });
  });
}
