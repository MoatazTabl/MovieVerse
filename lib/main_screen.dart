import 'package:flutter/material.dart';
import 'package:movieverse/features/Home/Presentation/views/home_page.dart';

import 'features/Account/Presentation/views/account_screen.dart';
import 'features/Search/Presentation/views/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _pages = [
    const HomePage(),
    SearchScreen(),
    const AccountScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/home_button.png"),
                  size: 44,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_fill, size: 40), label: ""),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/account_button.png"),
                    size: 44),
                label: ""),
          ]),
    );
  }
}
