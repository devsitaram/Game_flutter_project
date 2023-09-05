import 'package:flutter/material.dart';

import '../gamepage/game_view.dart';
import '../searchpage/search_screen.dart';
import '../settingpage/setting_screen.dart';

class BottonNavigationBar extends StatefulWidget {
  const BottonNavigationBar({super.key});

  @override
  State<BottonNavigationBar> createState() => _BottonNavigationBarState();
}

class _BottonNavigationBarState extends State<BottonNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages.elementAt(selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }

  //New funcation
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  //New
  static List<Widget> pages = <Widget>[
    const GameScreen(),
    const SearchPage(),
    const SettingPage(),
  ];
}

// int currentPageIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: NavigationBar(
//         onDestinationSelected: (int index) {
//           setState(() {
//             currentPageIndex = index;
//           });
//         },
//         indicatorColor: Colors.amber[800],
//         selectedIndex: currentPageIndex,
//         destinations: const <Widget>[
//           NavigationDestination(
//             selectedIcon: Icon(Icons.home),
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           NavigationDestination(
//             selectedIcon: Icon(Icons.school),
//             icon: Icon(Icons.settings),
//             label: 'Setting',
//           ),
//         ],
//       ),
//       body: <Widget>[
//         Container(
//           color: Colors.red,
//           alignment: Alignment.center,
//           child: const Text('Page 1'),
//         ),
//         Container(
//           color: Colors.green,
//           alignment: Alignment.center,
//           child: const Text('Page 2'),
//         ),
//         Container(
//           color: Colors.blue,
//           alignment: Alignment.center,
//           child: const Text('Page 3'),
//         ),
//       ][currentPageIndex],
//     );
//   }