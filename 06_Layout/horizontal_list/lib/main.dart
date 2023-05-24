import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal List',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Horizontal List'),
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


  final double minSizeWidth = 500;

  List<Widget> data0 = [
        ...List.generate(1000, (index) => CustomWidgetContainer(
          index: index,
        ),
      ),
    ];

  @override
  Widget build(BuildContext context) {

    // Full screen width and height
    //double width = MediaQuery.of(context).size.width;//ширина
    //double height = MediaQuery.of(context).size.height;//высота
    //bool typeWidth = width<500;
    // // Height (without SafeArea)
    // var padding = MediaQuery.of(context).viewPadding;
    // double height1 = height - padding.top - padding.bottom;
    //
    // // Height (without status bar)
    // double height2 = height - padding.top;
    //
    // // Height (without status and toolbar)
    // double height3 = height - padding.top - kToolbarHeight;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.constrainWidth();
          return SizedBox(
            height: width <= minSizeWidth?62:double.infinity,
            child: ListView.builder(
                 scrollDirection: width <= minSizeWidth?Axis.horizontal:Axis.vertical,
                 itemCount: data0.length,
                 itemBuilder: (context, int index) => data0[index]),
          );
        },
      ),
    );
  }
}

class CustomWidgetContainer extends StatefulWidget {
  final int _index;

  const CustomWidgetContainer({
    super.key,
    required int index,
    bool visibleDivider = false,
  })  : _index = index;

  @override
  State<CustomWidgetContainer> createState() => _CustomWidgetContainerState();
}

class _CustomWidgetContainerState extends State<CustomWidgetContainer> {
  @override
  Widget build(BuildContext context) {
    //print('${255*(((widget._index)^0xF)~/0xF)}');
    //print('${70+20*(widget._index%10)}');
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 60,
        width: 60,
        color: Colors.green.withAlpha(70+20*(widget._index%10)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print('CustomWidgetContainer ${widget._index} initState!');
  }

  @override
  void dispose() {
    super.dispose();
    print('CustomWidgetContainer ${widget._index} dispose!');
  }
}
