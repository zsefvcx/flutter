import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:albums_route/widgets/artists_widget.dart';
import 'package:albums_route/widgets/drawer_widget.dart';

final List<Widget> data0 = [
  ...List.generate(500, (index) => ArtistsWidget(
    index: index,
    name: 'Artists Name  $index',
  ),
  ),
];

class ArtistsPage extends StatefulWidget {
  static const routeName = '/artists';
  final String _title;
  const ArtistsPage({
    super.key,
    required String title,
  }) : _title = title;

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/artists.json');
    final data = await json.decode(response);
    setState(() {
      //print(object)
      _items = data;
    });
  }

  @override
  void initState() {
    super.initState();
    print('initState ArtistsPage');
    readJson();
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose ArtistsPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget._title),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(pageIndex: 1),
      body: SafeArea(
        child: Center(
          child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: data0.length,
              separatorBuilder: (context, int index) => const Divider(
                height: 5,
                color: Colors.blueAccent,
              ),
              itemBuilder: (context, int index) => data0[index]),
        ),
      ),
    );
  }
}
