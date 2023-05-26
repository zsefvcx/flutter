import 'package:flutter/material.dart';

class ArtistInformation extends StatelessWidget {
  static const routeName = '/artistInformation';
  final String _name;
  final String _about;
  final String _index;
  const ArtistInformation({
    super.key,
    String name = 'Name',
    String about = 'Information',
    String index = '0',
  }) : _name = name, _about = about, _index = index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('$_index: $_about'),
          ),
        ],
      ),
    );
  }
}
