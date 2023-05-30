import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/models/hotel_address.dart';
import 'package:hotels/models/hotel_info.dart';
import 'package:hotels/models/hotel_services.dart';
import 'package:hotels/wigdet/hotel_address_widget.dart';
import 'package:hotels/wigdet/hotel_services_widget.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
  bool isLoading = false;
  bool isError = false;

  late HotelInfo hotelInfo;
  late HotelAddress hotelAddress;
  late HotelServices hotelServices;

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    var url =
        Uri.https('run.mocky.io', '/v3/${widget.hotel.uuid}', {'q': '{https}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;

        hotelInfo = HotelInfo.fromJson(jsonResponse);
        print(hotelInfo);

        hotelAddress = HotelAddress.fromJson(hotelInfo.address);
        print(hotelAddress);

        hotelServices = HotelServices.fromJson(hotelInfo.services);
        print(hotelServices);

        HotelCoords hotelCoords = HotelCoords.fromJson(hotelAddress.coords);
        print(hotelCoords);

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
        appBar: AppBar(),
        body: (isLoading && !isError)
            ? const Center(child: CircularProgressIndicator())
            : isError
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
                                hotelInfo.photos.length,
                                (index) => Image.asset(
                                  'assets/images/${hotelInfo.photos[index]}',
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
                            HotelAddressWidget(hotelAddress: hotelAddress),
                            RichText(
                              textDirection: TextDirection.ltr,
                              text: TextSpan(
                                text: "Рейтинг ",
                                style: const TextStyle(fontSize: 14, color: Colors.black),
                                children: [
                                  TextSpan(text: '${hotelInfo.rating}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),
                            HotelServicesWidget(hotelServices: hotelServices),
                          ],
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }
}