import 'package:flutter/material.dart';
import 'package:pitakaguide/pages/home_page/showcase_page/showcase_page.dart';

import 'favourite_page/favourite_page.dart';
import 'recent_page/recent_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    const ShowcasePage(),
    const RecentPage(),
    const FavouritePage(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 56,
        onDestinationSelected: (value) =>
            setState(() => _selectedIndex = value),
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.history_outlined),
              selectedIcon: Icon(
                Icons.history,
              ),
              label: 'Recent'),
          NavigationDestination(
              icon: Icon(Icons.bookmark_border_outlined),
              selectedIcon: Icon(
                Icons.bookmark,
              ),
              label: 'Favourite'),
        ],
      ),
    );
  }
}
