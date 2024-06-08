import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = const [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Search'),
    ),
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Search'),
    ),
    Center(
      child: Text('Home'),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        // selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'Home',
            tooltip: "What are you looking for?",
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            label: 'Search',
            tooltip: "Discover new things",
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
