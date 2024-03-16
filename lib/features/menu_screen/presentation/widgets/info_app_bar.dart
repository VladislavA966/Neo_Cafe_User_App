import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/controller/item_bloc/item_bloc.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';

class InfoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String image;
  final double appBarHeight;
  const InfoAppBar({
    super.key,
    required this.appBarHeight,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.coffeeBeans),
                  fit: BoxFit.cover,
                ),
              ),
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.mainColors,
                elevation: 0,
              ),
            ),
            Positioned.fill(
              child: BlocBuilder<ItemBloc, ItemState>(
                builder: (context, state) {
                  return Image.asset(
                    image,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            _buildArrowBackButton(context)
          ],
        ),
      ),
    );
  }

  Positioned _buildArrowBackButton(BuildContext context) {
    return Positioned(
            top: 40,
            left: 3,
            child: AppBarButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
