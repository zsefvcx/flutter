import 'package:flutter/material.dart';

import 'package:hotels/get/http_get_json.dart';
import 'package:hotels/models/models.dart';
import 'package:hotels/views/widget/widget.dart';

class HotelView extends StatefulWidget {
  static const routeName = '/hotel';
  const HotelView({
    Key? key,
    required this.hotel,
  }) : super(key: key);
  final HotelPreview hotel;
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
          future: GetHotelDataInfo().getDataHotelInfo(uuid: widget.hotel.uuid),
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
                    child: Text(
                      'Контент временно недоступен',
                      textAlign: TextAlign.start,
                    ),
                  );
                } else {
                  return HotelViewContainer(hotelInfo: hotelInfo);
                }
              default:
                return const Center(
                  child: Text(
                    'Контент временно недоступен',
                    textAlign: TextAlign.start,
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
