import 'package:flutter/material.dart';

class ArtistInformation extends StatelessWidget {
  final String _name;
  final String _about;

  const ArtistInformation({
    super.key,
    String name = 'Name',
    String about = 'Information',
  }) : _name = name, _about = about;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_name),
        centerTitle: true,
      ),
      body: Center(
        child: Text(_about),
      ),
    );
  }
}
