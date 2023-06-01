import 'package:flutter/material.dart';

import 'package:hotels/models/hotel_services.dart';

class HotelServicesWidget extends StatelessWidget {
  const HotelServicesWidget({
    super.key,
    required HotelServices hotelServices,
  }) : _hotelServices = hotelServices;

  final HotelServices _hotelServices;

  final _textStyleLL = const TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  final _textStyleHL = const TextStyle(fontSize: 23, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Сервисы', style: _textStyleHL),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Платные', style: _textStyleLL,),
                  const SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...List.generate(
                          _hotelServices.paid.length,
                              (index) =>
                              Text( _hotelServices.paid[index]))
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Бесплатно', style: _textStyleLL,),
                  const SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...List.generate(
                          _hotelServices.free.length,
                              (index) =>
                              Text( _hotelServices.free[index]))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
