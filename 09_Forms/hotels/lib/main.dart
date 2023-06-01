import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotels/hotels_app.dart';

import 'get/get.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractGetHotelDataInfo>(() => GetHotelDataInfo());
  runApp(const MyApp());
}