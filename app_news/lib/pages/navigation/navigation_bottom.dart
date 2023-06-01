import 'package:app_news/pages/category/views/category_page.dart';
import 'package:app_news/pages/home/views/home_page.dart';
import 'package:flutter/material.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key});

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _selectedIndex = 0; // Chỉ số được chọn trong bottom navigation

  // Các màn hình con trong bottom navigation
  final List<Widget> _screens = [
    const HomePage(),
    const CategoryPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Homepage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
