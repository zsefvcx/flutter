import 'package:flutter/material.dart';
import 'package:hero_card/space.dart';

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
      home: const HomeView(title: 'Animations'),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: spaces.length,
        itemBuilder: (context, i) {
          return SizedBox(
            height: 150,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                //double sizeWidth = MediaQuery.of(context).size.width*MediaQuery.of(context).devicePixelRatio;
                double sizeWidth = constraints.constrainWidth();
                return Container(
                  margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute<dynamic>(
                                    builder: (context) =>
                                        DetailsView(data: spaces[i]),
                                  ),
                                ),
                                child: Hero(
                                  tag: spaces[i].id,
                                  child: Material(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      child: Image.asset(
                                        spaces[i].image,
                                        height: double.infinity,
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Hero(
                              tag: '${spaces[i].id}-text',
                              child: Material(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 70, 0),
                                    child: Center(
                                      child: Text(
                                        spaces[i].description,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        height: 40,
                        width: 40,
                        left: sizeWidth - 85,
                        top: 55,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute<dynamic>(
                                builder: (context) =>
                                    DetailsView(data: spaces[i]),
                              ),
                            ),
                            child: Hero(
                              tag: '${spaces[i].id}-button',
                              child: Material(
                                child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  color: Colors.yellow,
                                  child: const Icon(Icons.add),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailsView extends StatelessWidget {
  final Space _data;
  const DetailsView({super.key, required Space data})
      : _data = data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Material(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              //double sizeWidth = MediaQuery.of(context).size.width*MediaQuery.of(context).devicePixelRatio;
              double sizeWidth = constraints.constrainWidth();
              double sizeHeight= constraints.constrainHeight();
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Hero(
                              tag: _data.id,
                              child: SizedBox(
                                child: ClipRRect(
                                  // borderRadius: BorderRadius.all(
                                  //   Radius.circular(sizeWidth/2),
                                  // ),
                                  child: Image.asset(
                                    _data.image,
                                    height: double.infinity,
                                    //width: double.infinity,
                                    alignment: Alignment.topLeft,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Hero(
                          tag: '${_data.id}-text',
                          child: Material(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 100, 0),
                              child: Text(
                                _data.description,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    width: 40,
                    height: 40,
                    left: sizeWidth - 85,
                    top: sizeHeight/2-20,
                    child: Hero(
                      tag: '${_data.id}-button',
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Material(
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              color: Colors.yellow,
                              child: const Icon(Icons.remove),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
