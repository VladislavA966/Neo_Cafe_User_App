import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/screens/main_screen.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';
import 'package:neo_cafe_24/features/widgets/custom_radius_button.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = 16.0 * 2;
    double spacing = 10.0;
    int crossAxisCount = 2;

    double totalSpacing = spacing * (crossAxisCount - 1) + padding;
    double itemWidth = (screenWidth - totalSpacing) / crossAxisCount;
    double itemHeight = 206.0;

    double childAspectRatio = itemWidth / itemHeight;
    return Stack(
      children: [
        Scaffold(
          appBar: const MyAppBar(
            title: 'Меню: Держинка',
            centerTitle: false,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 48,
                ),
                Text(
                  'Категории',
                  style: AppFonts.s16w600.copyWith(color: AppColors.black),
                ),
                const SizedBox(
                  height: 76,
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: (childAspectRatio),
                    ),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  AppImages.item,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('Latte', // Название продукта
                                  style: AppFonts.s14w600.copyWith(
                                    color: AppColors.black,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('140 c',
                                      style: AppFonts.s14w600
                                          .copyWith(color: AppColors.orange)),
                                  CustomRadiusButton()
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        SearchField(
          controller: controller
        )
      ],
    );
  }
}
