
import 'package:flutter/material.dart';

import 'package:hotels/models/models.dart';
import 'package:hotels/views/views.dart';

class RouteGenerator {

  static String initialRoute = HotelsPreview.routeName;

  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case HotelsPreview.routeName:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          const HotelsPreview(),
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