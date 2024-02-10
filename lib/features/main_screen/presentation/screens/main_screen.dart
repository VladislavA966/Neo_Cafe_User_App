import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/item_info.dart/presentation/screens/item_info_screen.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/branches_screen.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/main_screen_text_field.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/menu_container.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/popular_manu_container.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/screens/menu_screen.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCustomAlertDialog(context);
    });
  }

  void showCustomAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const BranchesWindow(),
    );
  }

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(context),
        ),
        _buildSearchField(),
      ],
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(
            height: 36,
          ),
          _buildTitleAndMenuButton(context),
          _buildFirstCategoryRow(),
          const SizedBox(
            height: 12,
          ),
          _buildSecondCategoryRow(),
          const SizedBox(
            height: 24,
          ),
          _buildPopularTitle(),
          const SizedBox(
            height: 16,
          ),
          _buildPopularItemsList(),
        ],
      ),
    );
  }

  Expanded _buildPopularItemsList() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: PopularMenuContainer(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemInfoScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Text _buildPopularTitle() {
    return Text(
      'Популярное',
      style: AppFonts.s16w600.copyWith(
        color: AppColors.black,
      ),
    );
  }

  Row _buildSecondCategoryRow() {
    return const Row(
      children: [
        MenuContainer(
          title: 'Кофе',
          image: AppImages.caceImage,
        ),
        SizedBox(
          width: 14,
        ),
        MenuContainer(
          title: 'Кофе',
          image: AppImages.menuImage,
        ),
        SizedBox(
          width: 14,
        ),
        MenuContainer(
          title: 'Кофе',
          image: AppImages.menuImage,
        ),
      ],
    );
  }

  Row _buildFirstCategoryRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MenuContainer(
          title: 'Кофе',
          image: AppImages.menuImage,
        ),
        SizedBox(
          width: 11,
        ),
        MenuContainer(
          title: 'Кофе',
          image: AppImages.menuImage,
        ),
      ],
    );
  }

  Row _buildTitleAndMenuButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Наше меню',
          style: AppFonts.s16w600,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MenuScreen(),
              ),
            );
          },
          child: Text(
            'Перейти к меню',
            style: AppFonts.s16w400.copyWith(color: AppColors.orange),
          ),
        ),
      ],
    );
  }

  MyAppBar _buildAppBar() {
    return MyAppBar(
      title: 'Доброе утро!',
      centerTitle: false,
      actions: [
        AppBarButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  SearchField _buildSearchField() {
    return SearchField(
      controller: controller,
    );
  }
}
