import 'package:flutter/material.dart';

import '/screens/categories_screen.dart';
import '/screens/favorites_screen.dart';
import '/widgets/main_drawer.dart';

class TabsScreenBottom extends StatefulWidget {
  const TabsScreenBottom({Key? key}) : super(key: key);

  @override
  _TabsScreenBottomState createState() => _TabsScreenBottomState();
}

class _TabsScreenBottomState extends State<TabsScreenBottom> {
  final List<Widget> _pages = [
    const CategoriesScreen(),
    const FavoritesScreen(),
  ];
  final List<String> _titles = [
    'Categories',
    'Your Favorites',
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedPageIndex]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.surface,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(
              Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(
              Icons.star,
            ),
            label: 'Favorites',
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
