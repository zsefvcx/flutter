import 'package:flutter/material.dart';
import 'package:load_file/fetch_file.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Load file'),
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
  String filenameDescription = '';
  bool errorFileName = true;

  void checkFileName([data = '']){
      // для проверки имени файла
      //if (RegExp(r'^[a-zA-Z0-9а-яА-Я]{1,256}\.[A-Za-z]{1,3}$').hasMatch(_fieldText.value.text)) {
      if (RegExp(r'^[a-zA-Z0-9а-яА-Я]{1,256}$').hasMatch(_fieldText.value.text)) {
        filenameDescription = '${_fieldText.value.text} file';
        errorFileName = false;
      } else{
        filenameDescription = 'Ошибка в имени файла или формата файла!';
        errorFileName = true;
      }

      setState(() {
      });
      print(_fieldText.value.text);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _fieldText,
                  style: const TextStyle(fontSize: 22),
                  minLines: 1,
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    isDense: true,
                    suffixIcon: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              //bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              //topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                        ),
                      onPressed: checkFileName,
                      child: const Text('Найти', style: TextStyle(fontSize: 22, color: Colors.white)),
                    ),
                    suffixIconColor: Colors.black,
                  ),
                  onSubmitted: checkFileName,
                ),
              ),
              Text(
                filenameDescription
              ),
              Visibility(
                visible: !errorFileName,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder<String>(
                      future: fetchFileFromAssets('assets/${_fieldText.value.text}.txt'),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const Center(
                              child: Text('NONE'),
                            );
                          case ConnectionState.waiting:
                            return const Center(child: CircularProgressIndicator());
                          case ConnectionState.done:
                            return SingleChildScrollView(child: Text('${snapshot.data}'));
                          default:
                            return const SingleChildScrollView(
                              child: Text('Default'),
                            );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
