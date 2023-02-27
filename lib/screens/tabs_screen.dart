import 'package:flutter/material.dart';
import 'package:shopping_meal/screens/categories_screen.dart';
import 'package:shopping_meal/screens/favorites_screen.dart';
import 'package:shopping_meal/widgets/main_drawer.dart';
import 'package:shopping_meal/models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> ?_pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'title': 'Meals',
        'page': const CategoriesScreen(),
      },
      {
        'title': 'Favorites',
        'page': FavoritesScreen(widget.favoriteMeals),
      },
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedPageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages![_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _selectPage(index),
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
