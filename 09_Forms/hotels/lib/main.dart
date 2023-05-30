import 'package:flutter/material.dart';

import 'package:hotels/models/hotel.dart';
import 'package:hotels/views/home_view.dart';
import 'package:hotels/views/hotel_view.dart';

void main() {
  runApp(const MyApp());
}

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
      initialRoute: HomeView.routeName,
      onGenerateRoute: (settings){
        final args = settings.arguments;

        switch(settings.name){
          case HomeView.routeName:
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeView(),
            );
          case HotelView.routeName:
            if(args != null && args is Map<String, HotelPreview>){
              if(args['hotel']!=null){
                HotelPreview data = args['hotel'] as HotelPreview;
                return PageRouteBuilder(
                  pageBuilder:(context, animation, secondaryAnimation) =>
                      HotelView(hotel: data,),
                );
              } else {
                return _errorRoute();
              }
            } else {
              return _errorRoute();
            }
          default:
            return _errorRoute();
        }
      },
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ERROR'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Page not found!'),
        ),
      );
    },
      fullscreenDialog: true,
    );
  }
}
