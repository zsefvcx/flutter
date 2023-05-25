// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:albums_route/artists_page.dart';
import 'package:albums_route/artist_information.dart';
import 'package:albums_route/home_page.dart';

class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=> const MyHomePage(
          title: 'Artists Page',
        ));
      case '/artists':
        return MaterialPageRoute(builder: (_)=> const ArtistsPage(
          title: 'Artists Information',
        ));
      case '/artistsInformation':
        if(args != null && args is Map<String, String>){
          if(args['Name']!=null && args['About']!=null){
            print('object 0 ${args['Name']} ${args['About']}');
            return MaterialPageRoute(builder: (_)=> ArtistInformation(
              name: args['Name']!, about: args['About']!,
            ));
          } else {
            print('object 1');
            return MaterialPageRoute(builder: (_)=> const ArtistInformation());
          }
        } else {
          print('object 2');
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

