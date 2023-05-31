import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

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
  bool isLoadingClass = true;
  bool isErrorClass = false;

  HotelInfoRecognize? hotelInfo;

  @override
  void initState() {
    super.initState();
    Future<void> get() async {
      var (HotelInfoRecognize? data, isError, isLoading) =
          await GetHotelDataInfo().getDataHotelInfo(uuid: widget.hotel.uuid);
      if (data != null) {
        hotelInfo = data;
      } else {
        isError = true;
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
        appBar: AppBar(),
        body: (isLoadingClass && !isErrorClass)
            ? const Center(child: CircularProgressIndicator())
            : isErrorClass
                ? const Center(
                    child: Text(
                      'Контент временно недоступен',
                      textAlign: TextAlign.start,
                    ),
                  )
                : Container(
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
                                  hotelInfo!.photos.length,
                                  (index) => Image.asset(
                                    'assets/images/${hotelInfo!.photos[index]}',
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
                              HotelAddressWidget(hotelAddress: hotelInfo!.address),
                              RichText(
                                textDirection: TextDirection.ltr,
                                text: TextSpan(
                                  text: "Рейтинг ",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '${hotelInfo!.rating}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              HotelServicesWidget(hotelServices: hotelInfo!.services),
                            ],
                          ),
                        ),
                      ],
                    )),
      ),
    );
  }
}
