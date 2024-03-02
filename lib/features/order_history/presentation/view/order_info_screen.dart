import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/popular_manu_container.dart';
import 'package:neo_cafe_24/features/order_history/presentation/view/orders_screen.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';

class OrderInfoScreen extends StatefulWidget {
  const OrderInfoScreen({super.key});

  @override
  State<OrderInfoScreen> createState() => _OrderInfoScreenState();
}

class _OrderInfoScreenState extends State<OrderInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: const MyAppBar(
            title: 'Заказ #2323',
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    'NeoCafe Derzhinka, 4 марта',
                    style: AppFonts.s16w600.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: PopularMenuContainer(
                        onTap: () {},
                        buttonWidget: const SizedBox(),
                        name: 'Карамельный раф',
                        price: '${270}',
                        quantity: 10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const CustomText(
                      firstText: 'Бонусы к списанию', secondText: '50'),
                  const SizedBox(height: 16),
                  const CustomText(firstText: 'Итого: ', secondText: '720 c'),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    title: 'Заказать',
                    onPressed: () {},
                    height: 54,
                  ),
                  const SizedBox(height: 16)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 8,
          top: 63,
          child: AppBarButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
