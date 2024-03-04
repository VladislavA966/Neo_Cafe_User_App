import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/branches/presentation/view/branches_page.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/screens/main_screen.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/screens/menu_screen.dart';
import 'package:neo_cafe_24/features/profile/presentation/view/profile_screen.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/presentation/view/cart_screen.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;
  const HomePage({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _widgetOptions = [
    const MainScreen(),
    const CartScreen(),
    const BranchesScreen(),
    const ProfileScreen(),
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
            selectedIconTheme: const IconThemeData(
              color: AppColors.orange,
            ),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.homeTap),
                activeIcon: Image.asset(
                  AppImages.selectedHomeTap,
                  color: AppColors.orange,
                ),
                label: 'Главня',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.cartTap,
                ),
                activeIcon: Image.asset(
                  AppImages.selectedCartTap,
                  color: AppColors.orange,
                ),
                label: 'Корзина',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppImages.branchTap),
                activeIcon: Image.asset(
                  AppImages.selectedBranchTap,
                  color: AppColors.orange,
                ),
                label: 'Филиалы',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  AppImages.selectedProfileTap,
                  color: AppColors.orange,
                ),
                icon: Image.asset(
                  AppImages.profileTap,
                ),
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
