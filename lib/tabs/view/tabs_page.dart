import 'package:flutter/material.dart';

import 'package:meals_app/cuisines/view/cuisines_page.dart';
import 'package:meals_app/filters/view/main_drawer.dart';
import 'package:meals_app/meals/view/favourite_meals.dart';

class TabsPage extends StatefulWidget {
  static const routeName = '/';

  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  late List<Map<String, Object>> _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const CuisinesPage(),
        'appBarTitle': 'Cuisines',
      },
      {
        'page': const FavouriteMeals(),
        'appBarTitle': 'Favourites',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['appBarTitle'] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Cuisine'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourite'),
        ],
      ),
    );
  }
}
