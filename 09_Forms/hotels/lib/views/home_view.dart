import 'package:catch_error/models/hotel.dart';
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

            },
            icon: const Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {

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
          return Expanded(
              child: ListView.builder(
                //scrollDirection: width > minSizeWidth?Axis.horizontal:Axis.vertical,
                itemCount: hotels.length,
                itemBuilder: (context, i) =>
                    ListViewWidget(hotel: hotels[i]),
              ),
            );
        }
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.hotel,
  });

  final HotelPreview hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  500,//ширина
      height: 250,//высота

      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,//ширина
              height: 200,//высота
              child: Image.asset('assets/images/${hotel.poster}',
                alignment: Alignment.centerLeft,
                fit: BoxFit.fill,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: FittedBox(
            //    // height: 50-8-8,
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         //Text(hotels[i].uuid.length.toString()),
            //         Text(hotels[i].name, textDirection: TextDirection.ltr,),
            //         ElevatedButton(
            //             child: const Text('Подробнее', style: TextStyle(fontSize: 14)),
            //             onPressed:(){ print("Clicked!!!");}
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
