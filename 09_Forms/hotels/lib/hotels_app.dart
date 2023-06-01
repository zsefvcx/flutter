

import 'package:flutter/material.dart';
import 'package:hotels/route_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RouteGenerator.initialRoute,
      onGenerateRoute: (RouteSettings settings)=>RouteGenerator.generateRoute(settings),
    );
  }
}
