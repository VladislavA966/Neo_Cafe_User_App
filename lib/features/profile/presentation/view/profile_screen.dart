import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/menu_container.dart';
import 'package:neo_cafe_24/features/profile/presentation/view/edit_profile.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
        ),
        Positioned(
          top: 160,
          left: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.only(
              top: 24,
              left: 24,
              right: 20,
              bottom: 25,
            ),
            height: 78,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(
                100,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Лаура',
                  style: AppFonts.s24w600.copyWith(
                    color: AppColors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/images/pencil.png',
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 62,
          ),
          Container(
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              color: AppColors.pink,
              borderRadius: BorderRadius.circular(
                24,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Бонусы',
                        style: AppFonts.s24w600.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        '100',
                        style:
                            AppFonts.s24w600.copyWith(color: AppColors.black),
                      )
                    ],
                  ),
                  Image.asset(AppImages.bonusImage),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Актуальный заказ',
            style: AppFonts.s16w600.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 16),
          const OrderContainer(),
          const SizedBox(height: 32),
          Text(
            'Завершенные',
            style: AppFonts.s16w600.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 16),
          const OrderContainer(),
          const SizedBox(height: 12),
          const OrderContainer(),
        ],
      ),
    );
  }

  MyAppBar _buildAppBar() {
    return MyAppBar(
      title: 'Профиль',
      centerTitle: false,
      actions: [
        AppBarButton(icon: Image.asset(AppImages.logoutIcon), onPressed: () {})
      ],
    );
  }
}

class OrderContainer extends StatelessWidget {
  const OrderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 99,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, 8),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 86,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: NetworkImage("https://via.placeholder.com/80x90"),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Neo Cafe Derzinka,',
                  style: AppFonts.s14w600.copyWith(
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Латте, капучино, Багров...,',
                  style: AppFonts.s12w400.copyWith(
                    color: AppColors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  'Сейчас',
                  style: AppFonts.s14w600.copyWith(
                    color: AppColors.orange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
