import 'package:flutter/material.dart';

import '../screens/favourites_screen.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController? _myPage;
  var selectedPage;
  List<Widget> views = [HomeScreen(), SearchScreen(), FavouritesScreen()];

  void setIndex(index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 0);
    selectedPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: selectedPage,
          children: views,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: setIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            activeIcon: Icon(Icons.fastfood),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
