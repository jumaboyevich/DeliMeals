import 'package:deli_meals/screens/categories_screen.dart';
import 'package:deli_meals/screens/favorites_screen.dart';
import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Your Favorite'},
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_pages[_selectedPageIndex]['title'] as String),
          ),
          body: _pages[_selectedPageIndex]['page'] as Widget,
          drawer: MainDrawer(),
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            selectedItemColor: Colors.amber,
            backgroundColor: Theme.of(context).primaryColor,
            currentIndex: _selectedPageIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: 'Favorites')
            ],
          ),
        ));
  }
}

// Scaffold(
// appBar: AppBar(
// title: Text('Meals'),
// bottom: TabBar(
// tabs: [
// Tab(
// icon: Icon(Icons.category),
// text: 'Categories',
// ),
// Tab(
// icon: Icon(Icons.star),
// text: 'Favorites',
// )
// ],
//
// ),
// ),
// body: TabBarView(
// children: [
// CategoriesScreen(),
// FavoritesScreen()
// ],
// ),
//
// )
