
import 'package:flutter/material.dart';
import 'package:hotels/models/hotel_address.dart';

class HotelAddressWidget extends StatelessWidget {
  const HotelAddressWidget({
    super.key,
    required this.hotelAddress,
  });

  final HotelAddress hotelAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          textDirection: TextDirection.ltr,
          text: TextSpan(
            text: "Страна ",
            style: const TextStyle(fontSize: 14, color: Colors.black),
            children: [
              TextSpan(text: hotelAddress.country, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        RichText(
          textDirection: TextDirection.ltr,
          text: TextSpan(
            text: "Город ",
            style: const TextStyle(fontSize: 14, color: Colors.black),
            children: [
              TextSpan(text: hotelAddress.city, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        RichText(
          textDirection: TextDirection.ltr,
          text: TextSpan(
            text: "Улица ",
            style: const TextStyle(fontSize: 14, color: Colors.black),
            children: [
              TextSpan(text: hotelAddress.street, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
