
import 'package:catch_error/models/hotel.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.hotel,
  });

  final HotelPreview hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  500,//ширина
      height: 250,//высота

      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,//ширина
              height: 200,//высота
              child: Image.asset('assets/images/${hotel.poster}',
                alignment: Alignment.centerLeft,
                fit: BoxFit.fill,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: FittedBox(
            //    // height: 50-8-8,
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         //Text(hotels[i].uuid.length.toString()),
            //         Text(hotels[i].name, textDirection: TextDirection.ltr,),
            //         ElevatedButton(
            //             child: const Text('Подробнее', style: TextStyle(fontSize: 14)),
            //             onPressed:(){ print("Clicked!!!");}
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}