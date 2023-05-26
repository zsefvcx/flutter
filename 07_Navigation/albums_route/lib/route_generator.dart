import 'package:flutter/material.dart';

import 'package:albums_route/classes/artist_json_data.dart';
import 'package:albums_route/pages/artist_information.dart';
import 'package:albums_route/pages/artists_page.dart';
import 'package:albums_route/pages/home_page.dart';

class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case MyHomePage.routeName:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
            const MyHomePage(title: 'Artists Page',),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            CurvedAnimation curved = CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn);
            Animation<double> anim =
                Tween<double>(begin: 0.0, end: 1.0).animate(curved);
            return ScaleTransition(
                scale: anim,
                child: FadeTransition(opacity: animation, child: child,),
            );
          },
        );
      case ArtistsPage.routeName:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
            const ArtistsPage(title: 'Artists Information',),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child,);
          },
        );
      case ArtistInformation.routeName:
        if(args != null && args is Map<String, ArtistData>){
          if(args['ArtistData']!=null){
            ArtistData data = args['ArtistData'] as ArtistData;
            return PageRouteBuilder(
              pageBuilder:(context, animation, secondaryAnimation) =>
                ArtistInformation(artistData: data,),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child,);
              },
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
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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

