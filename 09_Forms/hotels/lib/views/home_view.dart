import 'package:catch_error/models/hotel.dart';
import 'package:catch_error/wigdet/lite_list_view_widget.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final double minSizeWidth = 500;
  bool isLoading = false;
  List<HotelPreview> hotels = [];
  bool listViewModeButton = true;
  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    var url = Uri.https('run.mocky.io',
        '/v3/ac888dc5-d193-4700-b12c-abb43e289301', {'q': '{https}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

        hotels.clear();
        hotels = jsonResponse.map((e) {
          if (e is Map<String, dynamic>) {
             return HotelPreview.fromJson(e);
          } else {
             throw 'Error received data $e';
          }
        }).toList();

        print(hotels);

        setState(() {
          isLoading = false;
        });
      } catch (e) {
        print('recognition error jsonResponse. Error:\n$e');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                listViewModeButton = true;
              });
            },
            icon: const Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                listViewModeButton = false;
              });
            },
            icon: const Icon(Icons.apps),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :
      LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.constrainWidth();
          int crossAxisCount = 1;
          //bool listViewMode = false;
          if (listViewModeButton) {
            //listViewMode = true;
            crossAxisCount = 1;
          } else {
            //listViewMode = false;
            crossAxisCount = 2;
          }

          return GridView.count(
            padding: const EdgeInsets.all(15),
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            crossAxisCount: crossAxisCount,
            childAspectRatio: 1,


            physics: const ClampingScrollPhysics(),
            children: [
              ...List.generate(hotels.length,
                    (index) => LiteListViewWidget(hotel: hotels[index]
                    , liteType: crossAxisCount==2?true:false),
              ),
            ],
            //itemCount:
            //itemBuilder: (context, i) => //listViewMode?
             //ListViewWidget(hotel: hotels[i]):
              //,
            );
          }
      ),
    );
  }
}
