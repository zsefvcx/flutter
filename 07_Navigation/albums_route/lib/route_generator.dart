// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:albums_route/pages/artist_information.dart';
import 'package:albums_route/pages/artists_page.dart';
import 'package:albums_route/pages/home_page.dart';

class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case MyHomePage.routeName:
        return MaterialPageRoute(builder: (_)=> const MyHomePage(
          title: 'Artists Page',
        ));
      case ArtistsPage.routeName:
        return MaterialPageRoute(builder: (_)=> const ArtistsPage(
          title: 'Artists Information',
        ));
      case ArtistInformation.routeName:
        if(args != null && args is Map<String, String>){
          if(args['Name']!=null && args['About']!=null && args['index']!=null){
            return MaterialPageRoute(builder: (_)=> ArtistInformation(
              name: args['Name']!, about: args['About']!, index: args['index']!,
            ));
          } else {
            return MaterialPageRoute(builder: (_)=> const ArtistInformation());
          }
        } else {
          return MaterialPageRoute(builder: (_)=> const ArtistInformation());
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
    );
  }
}

