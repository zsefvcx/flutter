
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotels/get/http_get_json.dart';

import 'package:hotels/models/hotel.dart';
import 'package:hotels/models/hotel_address.dart';
import 'package:hotels/models/hotel_info.dart';
import 'package:hotels/models/hotel_services.dart';
import 'package:hotels/wigdet/hotel_address_widget.dart';
import 'package:hotels/wigdet/hotel_services_widget.dart';

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

  late HotelInfo hotelInfo;
  late HotelAddress hotelAddress;
  late HotelServices hotelServices;
  late HotelCoords hotelCoords;

  @override
  void initState() {
    super.initState();
    Future<void> get() async {
      var (dynamic data, isError, isLoading) =
      await GetDataHttp(TypeSender.hotelInfoSnd).getData('run.mocky.io',
          '/v3/${widget.hotel.uuid}', {'q': '{https}'});

      if(isError == false && data is List<dynamic> && data.length==4 &&
           data[0] is HotelInfo &&
           data[1] is HotelAddress &&
           data[2] is HotelServices &&
           data[3] is HotelCoords
      ){
        if(data[0] is HotelInfo){
          hotelInfo = data[0] as HotelInfo;
        }
        if(data[1] is HotelAddress){
          hotelAddress = data[1] as HotelAddress;
        }
        if(data[2] is HotelServices){
          hotelServices = data[2] as HotelServices;
        }
        if(data[3] is HotelCoords){
          hotelCoords = data[3] as HotelCoords;
        }
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
