import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/screens/main_screen.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/presentation/view/cart_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    const MainScreen(),
    const CartScreen(),
    const Center(child: Text('Филлиалы')),
    const Center(
      child: Text('Профиль'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 4,
              offset: Offset(0, -2),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x05000000),
              blurRadius: 6,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(40),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.orange,
            selectedIconTheme: const IconThemeData(color: AppColors.orange),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.homeTap),
                label: 'Главня',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.cartTap),
                label: 'Корзина',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.branchTap),
                label: 'Филиалы',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.profileTap),
                label: 'Профиль',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
