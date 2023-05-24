import 'package:flutter/material.dart';

import 'package:sliver_widgets/fake_text_generator.dart';

void main() {
  runApp(const MyApp());
}

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        //useMaterial3: true,
      ),
      home: const MyHomePage(title: 'sliver widgets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title}) : _title = title;

  final String _title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(child: Center(child: Text('Menu'))),
      endDrawer: const Drawer(child: Center(child: Text('Home'))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(onPressed: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                icon: const Icon(Icons.home),
                ),
              ],
              expandedHeight: 250,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: const Text('Lorem Ipsum.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0
                  ),
                ),
                background: Stack(
                  children:[
                    SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: Image.network(
                        'https://otkritkis.com/wp-content/uploads/2021/12/5308793.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                       color: Colors.black.withOpacity(0.5),
                    ),
                  ],
               ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  for(var elem in FakeTextGenerator(10).result)
                    Column(
                      children: [
                        Text(elem),
                        const Divider(height: 5, color: Colors.grey,),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
