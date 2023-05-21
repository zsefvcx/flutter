import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage>  createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final List<String> nav = ['Мои фото', 'Галерея',];
  //final List fakeData = List.generate(100, (index) => index.toString());

  Map<String, dynamic> data = {
    'Мои фото': [
      'https://avatars.dzeninfra.ru/get-zen_doc/2480061/pub_61ced7eb35163e7c5caab7b8_61cedd09dd6ab36987ca119d/scale_1200',
      'http://chemodan-turov.ru/wp-content/uploads/2020/12/Moskva-2021-2.jpg',
      'https://kudamoscow.ru/uploads/747051553f53f94874a40444bc838471.jpg',
      'https://almode.ru/uploads/posts/2021-11/1636947359_1-almode-ru-p-novogodnee-ukrashenie-moskvi-v-2022-godu-1.jpg',
      'https://avatars.dzeninfra.ru/get-zen_doc/4387796/pub_61ced7eb35163e7c5caab7b8_61cee5b69ee16e73f7b56146/scale_1200',
      'https://cdn.fishki.net/upload/post/2021/01/05/3537281/2-3.jpg',
      'https://cdn.fishki.net/upload/post/2021/01/05/3537281/2-3.jpg',
      'https://ic.pics.livejournal.com/lifanov/12698457/56443/56443_original.jpg',
      'https://24warez.ru/uploads/posts/231218/000810/11.jpg',
      //'https://picsum.photos/1200/510',
    ],
    'Галерея': [
      'https://vsegda-pomnim.com/uploads/posts/2022-04/1651048916_9-vsegda-pomnim-com-p-ribki-krasnogo-morya-foto-10.jpg',
      'https://lady-ok.ru/wp-content/uploads/2023/01/43184e328f5125ed8cf687569379d808-1536x1024.jpeg',
      'https://vsegda-pomnim.com/uploads/posts/2022-04/1651038320_54-vsegda-pomnim-com-p-rifovie-ribki-krasnogo-morya-foto-65.jpg',
      'https://vsegda-pomnim.com/uploads/posts/2022-04/1651038328_29-vsegda-pomnim-com-p-rifovie-ribki-krasnogo-morya-foto-36.jpg',
      'https://vsegda-pomnim.com/uploads/posts/2022-04/1651032415_3-vsegda-pomnim-com-p-krasnoe-more-yegipet-foto-3.jpg',
      'https://vsegda-pomnim.com/uploads/posts/2022-04/1651032415_3-vsegda-pomnim-com-p-krasnoe-more-yegipet-foto-3.jpg',
      'https://sportishka.com/uploads/posts/2022-11/thumbs/1667565719_8-sportishka-com-p-koralli-v-krasnom-more-krasivo-8.jpg',
      'https://vsegda-pomnim.com/uploads/posts/2022-04/1651030272_58-vsegda-pomnim-com-p-krasnoe-more-khurgada-foto-62.jpg',
      'https://vsegda-pomnim.com/uploads/posts/2022-04/1651030272_58-vsegda-pomnim-com-p-krasnoe-more-khurgada-foto-62.jpg',
      //'https://picsum.photos/1200/509',
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<String> nav = data.keys.toList();
    return DefaultTabController(
      length: data.keys.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Homework example'),
          bottom: TabBar(
            tabs: [
              ...Iterable<int>.generate(nav.length).map((int index) => Tab(text: nav[index]),),
            ],
          ),
        ),
        body: TabBarView(
          children: nav.map((name) {
            List<String> listName = data[name] as List<String>;
            return ListView(
              key: PageStorageKey(name),
              padding: const EdgeInsets.all(10.0),
              children: [
                ...listName.map((e) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    constraints: const BoxConstraints(maxWidth: 200.0),
                     child: Image.network(e),
                    );
                }).toList(),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
