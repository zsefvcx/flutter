import 'package:catch_error/models/hotel.dart';
import 'package:flutter/material.dart';

class LiteListViewWidget extends StatelessWidget {
  const LiteListViewWidget({
    super.key,
    required this.hotel,
    required this.liteType,
  });

  final bool liteType;
  final HotelPreview hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      //height: 800,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: liteType?4:8,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              child: Image.asset(
                'assets/images/${hotel.poster}',
                alignment: Alignment.topCenter,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: liteType?LiteWidget(hotel: hotel):FullWidget(hotel: hotel),
          ),
        ],
      ),
    );
  }
}

class FullWidget extends StatelessWidget {
  const FullWidget({
    super.key,
    required this.hotel,
  });

  final HotelPreview hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            hotel.name,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
              ),
              onPressed: () {
                print("Clicked!!!");
              },
              child: const FittedBox(child: Text('Подробнее', style: TextStyle(fontSize: 14)))),
        ),
      ],
    );
  }
}

class LiteWidget extends StatelessWidget {
  const LiteWidget({
    super.key,
    required this.hotel,
  });

  final HotelPreview hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            hotel.name,
            //textDirection: TextDirection.ltr,
          ),
        ),
        Expanded(
          flex: 1,
          child: ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
              ),
              onPressed: () {
                print("Clicked!!!");
              },
              child: const FittedBox(child: Text('Подробнее', style: TextStyle(fontSize: 14)))),
        ),
      ],
    );
  }
}
