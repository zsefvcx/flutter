
import 'package:flutter/material.dart';


import 'package:hotels/get/http_get_json.dart';

import 'package:hotels/models/hotel.dart';
import 'package:hotels/views/widget/widget.dart';


class HotelsPreview extends StatefulWidget {
  static const routeName = '/';
  const HotelsPreview({super.key});

  @override
  State<HotelsPreview> createState() => _HotelsPreviewState();
}

class _HotelsPreviewState extends State<HotelsPreview> {
  final double minSizeWidth = 500;
  bool isLoadingClass = true;
  bool isErrorClass = false;

  List<HotelPreview> hotels = [];
  bool listViewModeButton = true;

  Future<void> _getInfo() async {
    var (List<HotelPreview> data, isError, isLoading) =
    await GetDataInfo().getDataHotelPreview();
    hotels = data;
    setState(() {
      isErrorClass = isError;
      isLoadingClass = isLoading;
    });
  }

  @override
  void initState() {
    _getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => setState(() => listViewModeButton = true),
              icon: const Icon(Icons.list),
            ),
            IconButton(
              onPressed: () => setState(() => listViewModeButton = false),
              icon: const Icon(Icons.apps),
            ),
          ],
        ),
        body: (isLoadingClass && !isErrorClass)
            ? const Center(child: CircularProgressIndicator())
            : isErrorClass?const Center(
                child: Text('Контент временно недоступен', textAlign: TextAlign.start, ),
        ):
        HotelsGridView(listViewModeButton: listViewModeButton, hotels: hotels),
      ),
    );
  }
}


