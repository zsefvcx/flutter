import 'package:flutter/material.dart';
import 'package:testing/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          labelSmall:TextStyle(fontSize: 20),
          labelMedium: TextStyle(fontSize: 24)
        ),


        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const LoginView(),
      },
    );
  }
}
