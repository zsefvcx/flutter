import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/validate_email.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool successMessage = false;

  final TextEditingController _textEmailFieldController = TextEditingController();
  final TextEditingController _textPhoneFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            key: const Key('textEmailField'),
            controller: _textEmailFieldController,
            validator: (value) {
              if (value == '') return 'Введите email';
              if (!validateEmail(value)) {
                return 'Поле email заполнено не корректно';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            key: const Key('textPhoneField'),
            controller: _textPhoneFieldController,
            validator: (value) {
              String val = value??'';
              if (val == '' || val.length<3 || val.length>16) return 'Введите телефон';
              return null;
            },
            decoration: const InputDecoration(labelText: 'Phone'),
            keyboardType: TextInputType.number,
            maxLines: 1,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          ElevatedButton(
            key: const Key('buttonSendField'),
            child: const Text('Отправить'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                setState(() {
                  successMessage = !successMessage;
                });
              }
            },
          ),
          if (successMessage) const Text('Добро пожаловать'),
        ],
      ),
    );
  }
}
