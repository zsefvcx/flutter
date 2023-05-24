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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.greenAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.amberAccent),
          ),
        ),
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
  final _fieldText2 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children:
              [
                TextField(
                  controller: _fieldText,

                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.purple),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.purple),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    hintText: 'Введите значение',
                    hintStyle: TextStyle(fontSize: 22),
                    helperText: 'Поле для поиска заметок',
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    suffixIconColor: Colors.purple,
                    label: Text('  Search  ',style: TextStyle(fontSize: 22)),
                  ),
                  style: const TextStyle(fontSize: 22),
                  onSubmitted: (value) {
                    print(value);
                    //_fieldText.clear();
                  },
                ),
                const Divider(height: 50,),
                TextField(
                  controller: _fieldText2,
                  decoration: const InputDecoration(
                    hintText: 'Введите значение',
                    hintStyle: TextStyle(fontSize: 22),
                    helperText: 'Поле для поиска заметок',
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    suffixIconColor: Colors.purple,
                    label: Text('  Search  ',style: TextStyle(fontSize: 22)),
                  ),
                  style: const TextStyle(fontSize: 22),
                  onSubmitted: (value) {
                    print(value);
                    //_fieldText2.clear();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
