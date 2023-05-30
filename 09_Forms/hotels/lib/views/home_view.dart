
import 'package:flutter/material.dart';
import 'package:hotels/get/http_get_json.dart';

import 'package:hotels/models/hotel.dart';
import 'package:hotels/wigdet/lite_list_view_widget.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final double minSizeWidth = 500;
  bool isLoadingClass = true;
  bool isErrorClass = false;

  List<HotelPreview> hotels = [];
  bool listViewModeButton = true;

  @override
  void initState() {
    super.initState();
    Future<void> get() async {
      var (dynamic data, isError, isLoading) =
        await GetDataHttp(TypeSender.hotelPreviewSnd).getData('run.mocky.io',
          '/v3/ac888dc5-d193-4700-b12c-abb43e289301', {'q': '{https}'});
      if (isError == false && data is List<HotelPreview>) {
        hotels = data;
      } else {
        isError = true;
        isLoading = false;
      }
      setState(() {
        isErrorClass = isError;
        isLoadingClass = isLoading;

      });
    }
    get();

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
        body: (isLoadingClass && !isErrorClass)
            ? const Center(child: CircularProgressIndicator())
            : isErrorClass?const Center(
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
