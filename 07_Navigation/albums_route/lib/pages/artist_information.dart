import 'package:flutter/material.dart';

import 'package:albums_route/classes/artist_json_data.dart';

class ArtistInformation extends StatelessWidget {
  static const routeName = '/artistInformation';
  final ArtistData _artistData;
  const ArtistInformation({
    super.key,
    required ArtistData artistData,
  }) : _artistData = artistData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_artistData.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('${_artistData.id}: ${_artistData.about}'),
          ),
        ],
      ),
    );
  }
}
