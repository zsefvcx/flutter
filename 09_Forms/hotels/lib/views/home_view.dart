import 'package:hotels/models/hotel.dart';
import 'package:hotels/wigdet/lite_list_view_widget.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeView extends StatefulWidget {
  static const routeName = '/';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final double minSizeWidth = 500;
  bool isLoading = false;
  bool isError = false;

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
      } catch (e, t) {
        print('recognition error jsonResponse. Error:\n$e \n$t');
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => setState(() {
                  listViewModeButton = true;
              }),
              icon: const Icon(Icons.list),
            ),
            IconButton(
              onPressed: () => setState(() {
                  listViewModeButton = false;
              }),
              icon: const Icon(Icons.apps),
            ),
          ],
        ),
        body: (isLoading && !isError)
            ? const Center(child: CircularProgressIndicator())
            : isError?const Center(
                child: Text('Контент временно недоступен', textAlign: TextAlign.start, ),
        ):
        LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.constrainWidth();
            double mainAxisExtent = width/(listViewModeButton?1.65:2.2)-20;

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: listViewModeButton?1:2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  mainAxisExtent: mainAxisExtent, // here set custom Height You Want
                  childAspectRatio: 1,
                ),
                itemCount: hotels.length,
                itemBuilder: (BuildContext context, int index) {
                  return LiteListViewWidget(hotel: hotels[index]
                                 , liteType: listViewModeButton);
                },
              ),
            );
            }
        ),
      ),
    );
  }
}
