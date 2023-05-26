import 'package:flutter/material.dart';

import 'package:albums_route/classes/artist_json_data.dart';
import 'package:albums_route/pages/artist_information.dart';

class ArtistsWidget extends StatelessWidget {
  final ArtistData _artistData;

  const ArtistsWidget({
    super.key,
    required ArtistData artistData,
  }) : _artistData = artistData;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(ArtistInformation.routeName,
            arguments: {
              'ArtistData':_artistData,
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
            child: Text(_artistData.name),
          ),
        ),
      ),
    );
  }
}
