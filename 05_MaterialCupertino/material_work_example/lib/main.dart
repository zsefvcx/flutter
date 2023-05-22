import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class TabItem {
  String title;
  Icon icon;
  Color color;

  TabItem({
    required this.title,
    required this.icon,
    required this.color,
  });
}

final List<TabItem> _tabItemsBar = [
  TabItem(
      color: Colors.white,
      icon: const Icon(Icons.home),
      title: 'Photo',
  ),
  TabItem(
      color: Colors.white,
      icon: const Icon(Icons.chat),
      title: 'Chat',
  ),
  TabItem(
      color: Colors.white,
      icon: const Icon(Icons.album),
      title: 'Albums',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  final Color bottomAppBarColor = Colors.white12;
  final Color bottomBottomSheetColor = Colors.white12;

  late TabController _tabController;

  int _currentTabIndex = 0;

  final bool _visibilityElement = true;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  PersistentBottomSheetController? _controller;

  void toggleBottomSheet() {
    if (_controller == null) {
      // setState(() {
      //   _visibilityElement = false;
      // });

      showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) => Container(
            color: bottomBottomSheetColor,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.credit_card),
                          Text('Сумма'),
                        ],
                      ),
                      SizedBox(width: 200,),
                      Text('200 руб'),
                    ],
                  ),
                  const SizedBox(height: 50,),
                  Center(
                    child: ElevatedButton(
                      child: const Text('Оплатить'),
                      onPressed: () {
                        print('Оплачено.');
                        Navigator.pop(context);
                        //toggleBottomSheet();
                        // setState(() {
                        //   _visibilityElement = true;
                        // });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          );

      // _controller = _scaffoldKey.currentState?.showBottomSheet(
      //   constraints: const BoxConstraints(maxWidth: double.infinity),
      //   (context) => Container(
      //     color: bottomBottomSheetColor,
      //     height: 200,
      //     child: Padding(
      //       padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 40.0),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           const Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Row(
      //                 children: [
      //                   Icon(Icons.credit_card),
      //                   Text('Сумма'),
      //                 ],
      //               ),
      //               SizedBox(width: 200,),
      //               Text('200 руб'),
      //             ],
      //           ),
      //           const SizedBox(height: 50,),
      //           Center(
      //             child: ElevatedButton(
      //               child: const Text('Оплатить'),
      //               onPressed: () {
      //                 print('Оплачено.');
      //                 toggleBottomSheet();
      //                 setState(() {
      //                   _visibilityElement = true;
      //                 });
      //               },
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // );
    } else {
      _controller?.close();
      _controller = null;
    }
  }

  void onTapGestureDetector() {
    // if (_controller != null) {
    //   _controller?.close();
    //   _controller = null;
    //   setState(() {
    //     _visibilityElement = true;
    //   });
    //   print('Отмена.');
    // }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: const Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Drawer')),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: onTapGestureDetector,
        child: TabBarView(
          controller: _tabController,
          children: [
            ..._tabItemsBar.map(
              (e) => Container(
                color: e.color,
                child: Center(
                  child: Text(e.title),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: _visibilityElement,
        child: BottomAppBar(
          // shape: const CircularNotchedRectangle(),
          // clipBehavior: Clip.antiAlias,
          // notchMargin: 15,
          height: 85,
          color: bottomAppBarColor,
          elevation: 0,
          child: SizedBox(
            width: double.infinity,
            height: 85,
            child: BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  _tabController.index = value;
                  _currentTabIndex = value;
                });
              },
              backgroundColor: bottomAppBarColor,
              elevation: 0,
              currentIndex: _currentTabIndex,
              items: [
                ..._tabItemsBar.map(
                  (e) => BottomNavigationBarItem(
                    icon: e.icon,
                    label: e.title,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Visibility(
        visible: _visibilityElement,
        child: FloatingActionButton(
          onPressed: toggleBottomSheet,
          tooltip: 'Show Bottom Sheet',
          child: const Icon(Icons.add),
        ),
      ),

    );
  }
}
