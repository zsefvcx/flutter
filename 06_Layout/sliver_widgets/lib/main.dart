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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'sliver widgets'),
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
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
                background: Container(
                  height: 250,
                  width: double.infinity,
                  child: Stack(
                    children:[
                      Image.network(
                        'https://otkritkis.com/wp-content/uploads/2021/12/5308793.jpg',
                        fit: BoxFit.contain,
                        height: 250,
                        width: double.infinity,
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),                
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 1,
              children: [
                for(var elem in FakeTextGenerator(10).result)
                  Text(elem),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
