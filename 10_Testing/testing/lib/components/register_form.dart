import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/validate_email.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSuccess = false;
  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSuccess = !_isSuccess;
      });
    }
  }

  final TextEditingController _textEmailFieldController = TextEditingController();
  final TextEditingController _textPhoneFieldController = TextEditingController();
  final TextEditingController _textFirstNameFieldController = TextEditingController();
  final TextEditingController _textLastNameFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            key: const Key('textFirstNameField'),
            controller: _textFirstNameFieldController,
            decoration: const InputDecoration(labelText: 'First name'),
            validator: (value) {
              if (value == '') return 'Введите имя';
              return null;
            },
          ),
          TextFormField(
            key: const Key('textLastNameField'),
            controller: _textLastNameFieldController,
            decoration: const InputDecoration(labelText: 'Last name'),
            validator: (value) {
              if (value == '') return 'Введите фамилию';
              return null;
            },
          ),
          TextFormField(
            key: const Key('textPhoneField'),
            controller: _textPhoneFieldController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(labelText: 'Phone'),
            validator: (value) {
              String val = value??'';
              if (val == '' || val.length<3 || val.length>16) return 'Заполните поле телефон';
              return null;
            },
          ),
          TextFormField(
            key: const Key('textEmailField'),
            controller: _textEmailFieldController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == '') return 'Заполните поле email';
              if (!validateEmail(value)) return 'Поле email заполнено не корректно';
              return null;
            },
          ),
          ElevatedButton(
            key: const Key('buttonSendField'),
            onPressed: _handleSubmit,
            child: const Text('Отправить'),
          ),
          if (_isSuccess) const Text('Вы успешно зарегистрировались')
        ],
      ),
    );
  }
}
