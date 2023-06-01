
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotels/models/models.dart';
import 'package:hotels/views/widget/widget.dart';

class HotelViewContainer extends StatelessWidget {
  const HotelViewContainer({
    super.key,
    required HotelInfoRecognize hotelInfo,
  }) : _hotelInfo = hotelInfo;

  final HotelInfoRecognize _hotelInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.0,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: false,
                  ),
                  items: [
                    ...List.generate(
                      _hotelInfo.photos.length,
                          (index) => Image.asset(
                        'assets/images/${_hotelInfo.photos[index]}',
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HotelAddressWidget(
                      hotelAddress: _hotelInfo.address),
                  RichText(
                    textDirection: TextDirection.ltr,
                    text: TextSpan(
                      text: "Рейтинг ",
                      style: const TextStyle(
                          fontSize: 14, color: Colors.black),
                      children: [
                        TextSpan(
                            text: '${_hotelInfo.rating}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HotelServicesWidget(
                      hotelServices: _hotelInfo.services),
                ],
              ),
            ),
          ],
        ));
  }
}
