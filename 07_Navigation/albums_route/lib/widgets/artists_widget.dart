

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class ArtistsWidget extends StatelessWidget {

  final String _name;
  final int _index;

  const ArtistsWidget({
    super.key,
    required String name,
    required int index,
  }) : _name = name, _index = index;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed('/artistsInformation',
            arguments: {
              'index':_index.toString(),
              'Name': _name,
              'About': 'Information about albums $_index',
            },);
        },
        child: Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            height: 20,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
            ),
            child: Text(_name),
          ),
        ),
      ),
    );
  }
}
