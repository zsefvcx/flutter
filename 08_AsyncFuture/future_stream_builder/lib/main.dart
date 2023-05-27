import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isRandonGenerated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future / Stream'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Future builder'),
                Center(
                    //
                    // TODO: FutureBuilder
                    //
                    ),
              ],
            ),
          ),
          Divider(height: 20, thickness: 4),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Stream builder'),
                Center(
                    //
                    // TODO: StreamBuilder
                    //
                    ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // rebuild widget
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

Stream<int> dataStream(int count) async* {
  var random = Random();
  while (count > 0) {
    int rand = random.nextInt(100);
    if (rand < 20) {
      throw 'Ошибка, число меньше 20';
    } else {
      count = count - 1;
      await Future.delayed(const Duration(seconds: 1));
      yield rand;
    }
  }
}

Future<String> dataFuture() async {
  var random = Random();
  final response = await Future.delayed(const Duration(seconds: 1), () {
    final isSuccess = random.nextBool();
    return isSuccess;
  });
  if (response) {
    return 'Данные успешно получены';
  } else {
    throw 'Ошибка загрузки данных';
  }
}
