// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class _DrawerItem {
  String title;
  Icon leading;
  Icon trailing;
  String navigate;
  int index;

  _DrawerItem({
    required this.title,
    required this.leading,
    required this.trailing,
    required this.navigate,
    required this.index,
  });
}

final List<_DrawerItem> _drawerItem = [
  _DrawerItem(
    title: 'Home',
    leading: const Icon(Icons.home),
    trailing: const Icon(Icons.navigate_next),
    navigate: '/',
    index: 0,
  ),
  _DrawerItem(
    title: 'Artists',
    leading: const Icon(Icons.person_2_outlined),
    trailing: const Icon(Icons.navigate_next),
    navigate: '/artists',
    index: 1,
  ),
  _DrawerItem(
    title: 'Albums',
    leading: const Icon(Icons.album),
    trailing: const Icon(Icons.navigate_next),
    navigate: '/albums',
    index: 2,
  ),
];

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required int pageIndex}) : _pageIndex = pageIndex;
  final int _pageIndex;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ..._drawerItem.map((e) => ListTile(
                  leading: e.leading,
                  title: Text(e.title),
                  titleTextStyle: TextStyle(color:
                  e.index!=_pageIndex?Colors.black:Colors.blue),
                  trailing: e.trailing,
                  onTap: () {
                    //_pageIndex = e.index;
                    Navigator.of(context).pushNamed(e.navigate);
                  },
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
