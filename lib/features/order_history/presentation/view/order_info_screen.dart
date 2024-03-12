import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/popular_manu_container.dart';
import 'package:neo_cafe_24/features/order_history/presentation/widgets/custom_text.dart';
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
          appBar: _buildAppBar(),
          body: _buildBody(),
        ),
        _buildAppBarButton(context),
      ],
    );
  }

  Positioned _buildAppBarButton(BuildContext context) {
    return Positioned(
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
    );
  }

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            _buildTitle(),
            const SizedBox(height: 16),
            _buildPopularList(),
            const SizedBox(
              height: 16,
            ),
            _buildBonusTitle(),
            const SizedBox(height: 16),
            _buildCostTitle(),
            const SizedBox(
              height: 24,
            ),
            const SizedBox(height: 16)
          ],
        ),
      ),
    );
  }

  CustomText _buildCostTitle() =>
      const CustomText(firstText: 'Итого: ', secondText: '720 c');

  CustomText _buildBonusTitle() {
    return const CustomText(
        firstText: 'Бонусы к списанию: ', secondText: '50 c');
  }

  Text _buildTitle() {
    return Text(
      'NeoCafe Derzhinka, 4 марта',
      style: AppFonts.s16w600.copyWith(color: AppColors.black),
    );
  }

  ListView _buildPopularList() {
    return ListView.builder(
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
    );
  }

  MyAppBar _buildAppBar() {
    return const MyAppBar(
      title: 'Заказ #2323',
    );
  }
}
