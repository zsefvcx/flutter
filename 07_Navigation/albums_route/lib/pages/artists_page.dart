import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class ArtistJsonData{
  final int id;
  final String name;
  final String about;

  static List<ArtistJsonData> artistsData = [];

  ArtistJsonData(this.id, this.name, this.about);

  static void fromJson(dynamic data){
    if (data is List<dynamic>){
      for (var element in data) {
        if (element is Map<String, dynamic>){
          if( element['id'         ]!=null && element['id'         ] is int
             && element['name'       ]!=null && element['name'       ] is String
             && element['description']!=null && element['description'] is String
          ){
            artistsData.add(ArtistJsonData(
                element['id'] as int,
                element['name'] as String,
                element['description'] as String));
          }
        }
      }
    }
  }
}


class _ArtistsPageState extends State<ArtistsPage> {
  Future<void> readJson() async {
    if(ArtistJsonData.artistsData.isNotEmpty) return;
    final String response = await rootBundle.loadString('assets/artists.json');
    final data = await json.decode(response);
    setState(() {
      if(data != null){
        ArtistJsonData.fromJson(data);
      }
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
          child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                  ...List.generate(ArtistJsonData.artistsData.length, (index) => ArtistsWidget(
                  index: ArtistJsonData.artistsData[index].id,
                  name: ArtistJsonData.artistsData[index].name,
                    about: ArtistJsonData.artistsData[index].about,
                  ),
                  ),
              ],
        ),
      ),
      ),
    );
  }
}
