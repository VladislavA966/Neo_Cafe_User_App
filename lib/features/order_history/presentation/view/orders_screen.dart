import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/order_history/presentation/controller/bloc/order_history_bloc.dart';
import 'package:neo_cafe_24/features/order_history/presentation/view/order_info_screen/order_info_screen.dart';
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
  void initState() {
    BlocProvider.of<OrderHistoryBloc>(context).add(
      GetOrderHistoryEvent(),
    );
    super.initState();
  }

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
        child: BlocBuilder<OrderHistoryBloc, OrderHistoryState>(
            builder: (context, state) {
          if (state is OrderHistoryLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                _buildOpenOrderTitle(),
                const SizedBox(height: 16),
                _buildOpenOrderList(context, state),
                const SizedBox(height: 32),
                _buildClosedOrderTitle(),
                const SizedBox(height: 16),
              ],
            );
          } else if (state is OrderHistoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }

  Text _buildClosedOrderTitle() {
    return Text(
      'Завершенные',
      style: AppFonts.s16w600.copyWith(color: AppColors.black),
    );
  }

  Widget _buildOpenOrderList(BuildContext context, OrderHistoryLoaded state) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.orders.length,
      itemBuilder: (context, index) =>
          _buildOrderContainer(context, state, index),
    );
  }

  Padding _buildOrderContainer(
      BuildContext context, OrderHistoryLoaded state, int index) {
    List<String> orderItems =
        state.orders[index].iTO.take(3).map((e) => e.name).toList();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: OrderContainer(
        onPressed: () => _goToOrderInfoScreen(context, state, index),
        branchName: state.orders[index].branchName,
        status: state.orders[index].status,
        items: orderItems,
      ),
    );
  }

  void _goToOrderInfoScreen(
      BuildContext context, OrderHistoryLoaded state, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderInfoScreen(
          id: state.orders[index].id,
        ),
      ),
    );
  }

  Text _buildOpenOrderTitle() {
    return Text(
      'Открытый заказ',
      style: AppFonts.s16w600.copyWith(color: AppColors.black),
    );
  }

  MyAppBar _buildAppBar() {
    return MyAppBar(
      title: 'История заказов',
    );
  }
}
