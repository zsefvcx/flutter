import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:hotels/get/get.dart';
import 'package:hotels/models/models.dart';
import 'package:hotels/views/widget/widget.dart';

class HotelView extends StatefulWidget {
  static const routeName = '/hotel';
  const HotelView({
    Key? key,
    required HotelPreview hotel,
  }) : _hotel = hotel, super(key: key);
  final HotelPreview _hotel;
  @override
  State<HotelView> createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: GetIt.I<AbstractGetHotelDataInfo>().
          getDataHotelInfoWithTimeOut(uuid: widget._hotel.uuid),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                bool isErrorClass = true;
                late HotelInfoRecognize hotelInfo;
                var data = snapshot.data;
                if (data != null) {
                  isErrorClass = data.$2;
                  var hotelInfoData = data.$1;
                  if (hotelInfoData != null) {
                    hotelInfo = hotelInfoData;
                  } else {
                    isErrorClass = true;
                  }
                }
                if (isErrorClass) {
                  return const Center(
                    child: Text('Контент временно недоступен'),
                  );
                } else {
                  return HotelViewContainer(hotelInfo: hotelInfo);
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
