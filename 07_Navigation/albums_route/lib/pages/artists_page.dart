import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:albums_route/classes/artist_json_data.dart';
import 'package:albums_route/widgets/artists_widget.dart';
import 'package:albums_route/widgets/drawer_widget.dart';

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
  Future<void> readJson() async {
    if(ArtistData.artistsData.isNotEmpty) return;
    final String response = await rootBundle.loadString('assets/artists.json');
    final data = await json.decode(response);
    if(data != null){
      setState(() {
        ArtistData.fromJson(data);
      });
    }
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
          child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                  ...List.generate(ArtistData.artistsData.length, (index) => ArtistsWidget(
                      artistData: ArtistData.artistsData[index],
                  ),
                  ),
              ],
        ),
      ),
      ),
    );
  }
}
