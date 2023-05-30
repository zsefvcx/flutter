import 'package:flutter/material.dart';

import 'package:hotels/models/hotel.dart';

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
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
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
            flex: liteType?3:1,
            child: SizedBox(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                child: Image.asset(
                  'assets/images/${hotel.poster}',
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: liteType?FullWidget(hotel: hotel):LiteWidget(hotel: hotel),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 15, 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              hotel.name,
              //textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/hotel',
                    arguments: {
                    'hotel':hotel,
                    },);
                },
                child: const FittedBox(child: Text('Подробнее', style: TextStyle(fontSize: 14)))),
          ),
        ],
      ),
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
          child: Center(
            child: Text(
              hotel.name,
              //textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    //topLeft: Radius.circular(15),
                    //topRight: Radius.circular(15),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/hotel',
                  arguments: {
                    'hotel':hotel,
                  },);
              },
              child: const FittedBox(child: Text('Подробнее', style: TextStyle(fontSize: 14)))),
        ),
      ],
    );
  }
}
