import 'package:crafty_bay/presentations/ui/screen/home_screen.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {

  int _selectedIndex=0;

  final List<Widget>_screen =[
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        showSelectedLabels: true,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (int index){
          _selectedIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.widgets),label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard_outlined),label: 'Wish'),
        ],
      ),
    );
  }
}
