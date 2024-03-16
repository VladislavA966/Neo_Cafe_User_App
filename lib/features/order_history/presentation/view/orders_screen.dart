import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/order_history/presentation/view/order_info_screen.dart';
import 'package:neo_cafe_24/features/profile/presentation/widgets/order_container.dart';
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
          appBar: _buildAppBar(),
          body: _buildBody(context),
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

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            _buildOpenOrderTitle(),
            const SizedBox(height: 16),
            _buildOpenOrderList(context),
            const SizedBox(height: 32),
            _buildClosedOrderTitle(),
            const SizedBox(height: 16),
            const OrderContainer(),
            const SizedBox(height: 12),
            const OrderContainer(),
            const SizedBox(height: 12),
            const OrderContainer(),
          ],
        ),
      ),
    );
  }

  Text _buildClosedOrderTitle() {
    return Text(
      'Завершенные',
      style: AppFonts.s16w600.copyWith(color: AppColors.black),
    );
  }

  OrderContainer _buildOpenOrderList(BuildContext context) {
    return OrderContainer(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OrderInfoScreen(),
          ),
        );
      },
    );
  }

  Text _buildOpenOrderTitle() {
    return Text(
      'Открытый заказ',
      style: AppFonts.s16w600.copyWith(color: AppColors.black),
    );
  }

  MyAppBar _buildAppBar() {
    return const MyAppBar(
      title: 'История заказов',
    );
  }
}
