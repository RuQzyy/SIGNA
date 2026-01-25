// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../screens/home/home_screen.dart';
import '../screens/translate/translate_screen.dart';
import '../screens/materi/materi_screen.dart';

class NavbarLayout extends StatefulWidget {
  const NavbarLayout({super.key});

  @override
  State<NavbarLayout> createState() => _NavbarLayoutState();

  // 👉 agar bisa dipanggil dari HomeScreen
  static _NavbarLayoutState? of(BuildContext context) {
    return context.findAncestorStateOfType<_NavbarLayoutState>();
  }
}

class _NavbarLayoutState extends State<NavbarLayout> {
  int _currentIndex = 0;

  late PageController _pageController;

  final List<Widget> _pages = const [
    HomeScreen(),       // index 0
    TranslateScreen(),  // index 1
    MateriScreen(),     // index 2
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  /// 👉 fungsi pindah tab (DENGAN ANIMASI)
  void goToPage(int index) {
    setState(() {
      _currentIndex = index;
    });

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60,
        backgroundColor: Colors.transparent,
        color: Colors.teal,
        buttonBackgroundColor: Colors.teal,
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.camera_alt, color: Colors.white),
          Icon(Icons.book, color: Colors.white),
        ],
        onTap: goToPage, // 🔥 penting
      ),
    );
  }
}
