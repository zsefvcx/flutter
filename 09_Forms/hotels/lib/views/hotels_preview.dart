
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:hotels/get/get.dart';

import 'package:hotels/models/hotel.dart';
import 'package:hotels/views/widget/widget.dart';

class HotelsPreview extends StatefulWidget {
  static const routeName = '/';
  const HotelsPreview({super.key});

  @override
  State<HotelsPreview> createState() => _HotelsPreviewState();
}

class _HotelsPreviewState extends State<HotelsPreview> {
  bool _listViewModeButton = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => setState(() => _listViewModeButton = true),
              icon: const Icon(Icons.list),
            ),
            IconButton(
              onPressed: () => setState(() => _listViewModeButton = false),
              icon: const Icon(Icons.apps),
            ),
          ],
        ),
        body: FutureBuilder(
          future: GetIt.I<AbstractGetHotelDataInfo>()
            .getDataHotelPreview().timeout(
               const Duration(seconds: 5),
               onTimeout: () {
                 debugPrint('time out getDataHotelPreview.');
                 return (<HotelPreview>[], true);
               },
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                bool isErrorClass = true;
                List<HotelPreview> hotels = [];
                var data = snapshot.data;
                if (data != null) {
                    isErrorClass = data.$2;
                  var hotelsData = data.$1;
                  if (hotelsData.isNotEmpty) {
                    hotels.addAll(hotelsData);
                  } else {
                    isErrorClass = true;
                  }
                }
                if (isErrorClass) {
                  return const Center(
                    child: Text('Контент временно недоступен'),
                  );
                } else {
                  return HotelsGridView(listViewModeButton: _listViewModeButton, hotels: hotels);
                }
              default:
                return const Center(
                  child: Text('Контент временно недоступен'),
                );
            }
           },
        ),
      ),
    );
  }
}


