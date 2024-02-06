import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/manu_container.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/popular_manu_container.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: MyAppBar(
            title: 'Доброе утро, Лаура',
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
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Наше меню',
                      style: AppFonts.s16w600,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Перейти к меню',
                        style:
                            AppFonts.s16w400.copyWith(color: AppColors.orange),
                      ),
                    ),
                  ],
                ),
                const Row(
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
                ),
                const SizedBox(
                  height: 12,
                ),
                const Row(
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
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Популярное',
                  textAlign: TextAlign.start,
                  style: AppFonts.s16w600.copyWith(
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, index) => const Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: PopularMenuContainer(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _buildSearchField(),
      ],
    );
  }

  SearchField _buildSearchField() {
    return SearchField(controller: controller,);
  }
}

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  const SearchField({
    super.key, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 166,
      left: 16,
      right: 16,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        height: 50,
        width: double.infinity,
        child: Material(
          borderRadius: BorderRadius.circular(100),
          clipBehavior: Clip.antiAlias,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.grey,
              hintText: 'Поиск',
              contentPadding: const EdgeInsets.only(left: 20),
              suffixIcon: Container(
                decoration: const BoxDecoration(
                  color: AppColors.orange,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.search, color: Colors.white),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
