import 'package:flutter/material.dart';
import 'package:flutter_testapp1/pages/search_page.dart';
import 'package:flutter_testapp1/pages/second_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //automaticallyImplyLeading: false,
          ),
      drawer: NavigationDrawer(
        selectedIndex: _selectedMenu,
        onDestinationSelected: (value) {
          setState(() {
            _selectedMenu = value;
            Navigator.pop(context);
          });
        },
        children: const [
          NavigationDrawerDestination(
            icon: Icon(Icons.home),
            label: Text('Home'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.rate_review),
            label: Text('Rate'),
          ),
        ],
      ),
      body: IndexedStack(index: _selectedMenu, children: const [
        SearchPage(),
        SecondPage(),
      ]),
    );
  }
}
