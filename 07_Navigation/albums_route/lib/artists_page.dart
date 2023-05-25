// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:albums_route/drawer_widget.dart';

class ArtistsPage extends StatefulWidget {
  final String _title;
  const ArtistsPage({
    super.key,
    required String title,
  }) : _title = title;

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget._title),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(pageIndex: 1),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Divider(height: 10,),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed('/artistsInformation');
                  },
                  child: Center(
                    child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.yellow),
                        ),
                        child: const Text('data 0')
                    ),
                  ),
                ),
              ),
              const Divider(height: 10,),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed('/artistsInformation',
                      arguments: {
                        'Name': 'Artists Name',
                        'About': 'Information about albums'
                      },
                    );
                  },
                  child: Center(

                    child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.yellow),
                        ),
                        child: const Text('data 1')
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


}
