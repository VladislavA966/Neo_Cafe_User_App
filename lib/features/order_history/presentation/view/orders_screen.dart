import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/order_history/presentation/view/order_info_screen.dart';
import 'package:neo_cafe_24/features/profile/presentation/view/profile_screen.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';

class OrdersHistoryScreen extends StatefulWidget {
  const OrdersHistoryScreen({super.key});

  @override
  State<OrdersHistoryScreen> createState() => _OrdersHistoryScreenState();
}

class _OrdersHistoryScreenState extends State<OrdersHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: const MyAppBar(
            title: 'История заказов',
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    'Открытый заказ',
                    style: AppFonts.s16w600.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 16),
                  OrderContainer(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderInfoScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Завершенные',
                    style: AppFonts.s16w600.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 16),
                  const OrderContainer(),
                  const SizedBox(height: 12),
                  const OrderContainer(),
                  const SizedBox(height: 12),
                  const OrderContainer(),
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

class CustomText extends StatelessWidget {
  final String firstText;
  final String secondText;
  const CustomText({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: AppFonts.s16w600.copyWith(
          color: AppColors.black,
        ),
        children: [
          TextSpan(
            text: secondText,
            style: AppFonts.s20w600.copyWith(
              color: AppColors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
