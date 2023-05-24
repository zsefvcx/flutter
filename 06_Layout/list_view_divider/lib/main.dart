import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View Divider',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'List View Divider'),
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
        ),
      ),
    ];
  // final List<Widget> data1 = [
  //   ...List.generate(500, (index) => CustomWidgetContainer(
  //     index: index, visibleDivider: true,
  //   ),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: data0.length,
                separatorBuilder: (context, int index) => const Divider(
                      height: 5,
                      color: Colors.blueAccent,
                    ),
                itemBuilder: (context, int index) => data0[index]),
          ),
          // Expanded(
          //   child: ListView.builder(
          //       padding: const EdgeInsets.all(8),
          //       itemCount: data1.length,
          //       itemBuilder: (context, int index) => data1[index]),
          // ),
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
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child:
                Text('${widget._index}', style: const TextStyle(fontSize: 22))),
        Visibility(
          visible: widget._visibleDivider,
          child: const Divider(height: 5, color: Colors.blueAccent),
        ),
      ],
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
