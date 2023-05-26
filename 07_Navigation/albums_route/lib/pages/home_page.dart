import 'package:flutter/material.dart';

import 'package:albums_route/widgets/drawer_widget.dart';

class MyHomePage extends StatelessWidget {
  static const routeName = '/';
  final String _title;
  const MyHomePage({
    super.key,
    required String title,
  }) : _title = title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_title),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(pageIndex: 0),
      body: SafeArea(
        child: Container(
          color: Colors.lightGreenAccent,
          child: const Center(
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
      ),
    );
  }
}
