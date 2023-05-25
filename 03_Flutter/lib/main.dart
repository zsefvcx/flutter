// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

const List<String> _iconNames = <String>[
  'assets/img/Gerald_G_Creation_Days_Numbers.svg',
  'assets/img/Gerald_G_Creation_Days_Numbers_1.svg',
  'assets/img/Gerald_G_Creation_Days_Numbers_2.svg',
];

const List<String> _uriNames = <String>[
  'http://upload.wikimedia.org/wikipedia/commons/0/02/SVG_logo.svg',
  'https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/410.svg',
  'https://upload.wikimedia.org/wikipedia/commons/b/b4/Chess_ndd45.svg',
];

const List<String> _namesSvgFiles = <String>[
  'assets/img/Gerald_G_Creation_Days_Numbers.svg',
  'assets/img/Gerald_G_Creation_Days_Numbers_1.svg',
  'assets/img/Gerald_G_Creation_Days_Numbers_2.svg',
  'http://upload.wikimedia.org/wikipedia/commons/0/02/SVG_logo.svg',
  'https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/410.svg',
  'https://upload.wikimedia.org/wikipedia/commons/b/b4/Chess_ndd45.svg',
];

void main() => runApp(const FlutterTask01());

class FlutterTask01 extends StatelessWidget {
  const FlutterTask01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Task 01',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CarouselController _controller = CarouselController();
  //const double width = 200;
  //const double height = 300;
  final BoxFit fit = BoxFit.contain;
  bool autoPlay = true;
  int? autoPlayInterval = 1;
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  initialPage: pageIndex,
                  onPageChanged: ((index, reason) {
                    setState(() {
                      pageIndex = index;
                    });
                  }),
                  //height: height,
                  //viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  //aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: autoPlay,
                  autoPlayInterval: Duration(seconds: autoPlayInterval??5),
                ),
                items: [
                  SvgPicture.asset(
                    fit: fit,
                    _iconNames[0],
                    colorFilter: ColorFilter.mode(
                      Colors.blueGrey[50] ?? Colors.blueGrey,
                      BlendMode.srcIn,
                    ),
                    matchTextDirection: true,
                  ),
                  SvgPicture.asset(
                    fit: fit,
                    _iconNames[1],
                    colorFilter: ColorFilter.mode(
                      Colors.blueGrey[50] ?? Colors.blueGrey,
                      BlendMode.srcIn,
                    ),
                    matchTextDirection: true,
                  ),
                  SvgPicture.asset(
                    fit: fit,
                    _iconNames[2],
                    colorFilter: ColorFilter.mode(
                      Colors.blueGrey[50] ?? Colors.blueGrey,
                      BlendMode.srcIn,
                    ),
                    matchTextDirection: true,
                  ),
                  SvgPicture.network(
                    fit: fit,
                    _uriNames[0],
                    placeholderBuilder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(30.0),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                  SvgPicture.network(
                    fit: fit,
                    _uriNames[1],
                    placeholderBuilder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(30.0),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                  SvgPicture.network(
                    fit: fit,
                    _uriNames[2],
                    placeholderBuilder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(30.0),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                  ...Iterable<int>.generate(_namesSvgFiles.length).map(
                          (int index) =>  _namesSvgFiles[index].contains('assets/img/',0)?
                          SvgPicture.asset(
                            fit: fit,
                            _namesSvgFiles[index],
                            placeholderBuilder: (BuildContext context) => Container(
                              padding: const EdgeInsets.all(30.0),
                              child: const CircularProgressIndicator(),
                            ),
                          ):
                          SvgPicture.network(
                            fit: fit,
                            _namesSvgFiles[index],
                            placeholderBuilder: (BuildContext context) => Container(
                              padding: const EdgeInsets.all(30.0),
                              child: const CircularProgressIndicator(),
                            ),
                          ),
                  ),
                ],
                carouselController: _controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor:
                      !autoPlay?
                      const MaterialStatePropertyAll(Colors.white):
                      const MaterialStatePropertyAll(Colors.deepOrange)),
                      onPressed: (){
                        setState(() {
                          autoPlay = !autoPlay;
                        });
                      },
                      child: const Text('Play'),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.previousPage(),
                      child: const Text('←'),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.nextPage(),
                      child: const Text('→'),
                    ),
                  ),
                  ...Iterable<int>.generate(_iconNames.length+_uriNames.length+_namesSvgFiles.length).map(
                        (int index) => Flexible(
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor:
                        index!=pageIndex?
                        const MaterialStatePropertyAll(Colors.white):
                        const MaterialStatePropertyAll(Colors.deepOrange)),
                        onPressed: () {
                          setState(() {
                            _controller.animateToPage(index);
                          });
                        },
                        child: Text("${index+1}"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
