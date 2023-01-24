import 'package:flutter/material.dart';

import 'main.dart';
import 'my_cart.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final titles = ['Home', 'My Cart'];

  int selectedPageIndex = 0;

  void selectPage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedPageIndex,
        children: const [
          MyHomePage(),
          MyCart(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedPageIndex,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'My Cart'),
        ],
      ),
    );
  }
}
