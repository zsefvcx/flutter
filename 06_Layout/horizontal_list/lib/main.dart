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
  final List<Widget> data0 = [
        ...List.generate(500, (index) => CustomWidgetContainer(
          index: index,
          visibleDivider: false,
        ),
      ),
    ];

  @override
  Widget build(BuildContext context) {

    // Full screen width and height
    double width = MediaQuery.of(context).size.width;//ширина
    //double height = MediaQuery.of(context).size.height;//высота
    bool typeWidth = width<500;
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: typeWidth?Axis.horizontal:Axis.vertical,
                padding: const EdgeInsets.all(8),
                itemCount: data0.length,
                itemBuilder: (context, int index) => data0[index]),
          ),
        ],
      ),
    );
  }
}

class CustomWidgetContainer extends StatefulWidget {
  final int _index;
  final bool _visibleDivider;

  const CustomWidgetContainer({
    super.key,
    required int index,
    bool visibleDivider = false,
  })  : _index = index,
        _visibleDivider = visibleDivider;

  @override
  State<CustomWidgetContainer> createState() => _CustomWidgetContainerState();
}

class _CustomWidgetContainerState extends State<CustomWidgetContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        width: 100,
        height: 100,
        color: Colors.orangeAccent.withAlpha(widget._index~/2),
        child: Column(
          children: [
            Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child:
                      Text('${widget._index}', style: const TextStyle(fontSize: 22))),
            ),
            Visibility(
              visible: widget._visibleDivider,
              child: const Divider(height: 5, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print('CustomWidgetContainer ${widget._index} initState! ${widget._visibleDivider?' with Divider':''}');
  }

  @override
  void dispose() {
    super.dispose();
    print('CustomWidgetContainer ${widget._index} dispose! ${widget._visibleDivider?' with Divider':''}');
  }
}
