// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:albums_route/drawer_widget.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  const MyHomePage({
    super.key,
    required String title,
  }) : _title = title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget._title),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(pageIndex: 0),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Home Page',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
