import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;

  const MyAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(140.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.coffeeBeans),
                  fit: BoxFit.cover,
                ),
              ),
              child: _buildAppBar(),
            ),
            _buildCofeeImage(),
            _buildSecondCoffeeImage(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
              automaticallyImplyLeading: false,
              leading: leading,
              backgroundColor: AppColors.mainColors,
              elevation: 0,
              title: Text(
                title,
                style: AppFonts.s32w600.copyWith(
                  color: AppColors.textWhite,
                ),
              ),
              centerTitle: centerTitle,
              actions: actions,
            );
  }

  Positioned _buildSecondCoffeeImage() {
    return Positioned(
            bottom: 0,
            right: 10,
            child: Image.asset(AppImages.appBarBeanBottom),
          );
  }

  Positioned _buildCofeeImage() {
    return Positioned(
            right: 10,
            child: Image.asset(AppImages.appBarBeanTop),
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(140.0);
}
