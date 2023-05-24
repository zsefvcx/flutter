import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Field Styled',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Text Field Styled'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _fieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
            [
              TextField(
                controller: _fieldText,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    gapPadding: 5,
                  ),
                  hintText: 'Введите значение',
                  hintStyle: TextStyle(fontSize: 22),
                  helperText: 'Поле для поиска заметок',
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  iconColor: Colors.purple,
                  label: Text('  Search  ',style: TextStyle(fontSize: 22)),
                ),
                style: const TextStyle(fontSize: 22),
                onSubmitted: (value) {
                  print(value);
                  _fieldText.clear();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
