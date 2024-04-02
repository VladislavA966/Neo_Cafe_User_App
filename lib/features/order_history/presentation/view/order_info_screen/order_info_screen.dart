import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/popular_manu_container.dart';
import 'package:neo_cafe_24/features/order_history/presentation/view/order_info_screen/bloc/order_info_bloc.dart';
import 'package:neo_cafe_24/features/order_history/presentation/widgets/custom_text.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';

class OrderInfoScreen extends StatefulWidget {
  final int id;
  const OrderInfoScreen({super.key, required this.id});

  @override
  State<OrderInfoScreen> createState() => _OrderInfoScreenState();
}

class _OrderInfoScreenState extends State<OrderInfoScreen> {
  @override
  void initState() {
    BlocProvider.of<OrderInfoBloc>(context).add(
      GetOrderInfoEvent(
        id: widget.id,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderInfoBloc, OrderInfoState>(
        builder: (context, state) {
      if (state is OrderInfoLoaded) {
        return Stack(
          children: [
            Scaffold(
              appBar: _buildAppBar(state),
              body: _buildBody(state),
            ),
            _buildAppBarButton(context, state),
          ],
        );
      } else if (state is OrderInfoLoading) {
        return const Scaffold(
          appBar: MyAppBar(title: 'Заказ #'),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return const SizedBox();
    });
  }

  Positioned _buildAppBarButton(BuildContext context, OrderInfoLoaded state) {
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

  Padding _buildBody(OrderInfoLoaded state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            _buildTitle(state),
            const SizedBox(height: 16),
            _buildPopularList(state),
            const SizedBox(
              height: 16,
            ),
            _buildBonusTitle(state),
            const SizedBox(height: 16),
            _buildCostTitle(state),
            const SizedBox(
              height: 24,
            ),
            const SizedBox(height: 16)
          ],
        ),
      ),
    );
  }

  CustomText _buildCostTitle(OrderInfoLoaded state) =>
      CustomText(firstText: 'Итого: ', secondText: '${state.order.totalSum} c');

  CustomText _buildBonusTitle(OrderInfoLoaded state) {
    return  CustomText(
        firstText: 'Бонусы к списанию: ', secondText: '${state.order.createdAt} c');
  }

  Text _buildTitle(OrderInfoLoaded state) {
    return Text(
      'NeoCafe Derzhinka, ${state.order.createdAt}',
      style: AppFonts.s16w600.copyWith(color: AppColors.black),
    );
  }

  ListView _buildPopularList(OrderInfoLoaded state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.order.iTO.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: PopularMenuContainer(
          onTap: () {},
          buttonWidget: const SizedBox(),
          name:
              "${state.order.iTO[index].name} x ${state.order.iTO[index].quantity}",
          price: '${state.order.iTO[index].totalPrice}',
          quantity: 10,
        ),
      ),
    );
  }

  MyAppBar _buildAppBar(OrderInfoLoaded state) {
    return MyAppBar(
      title: 'Заказ #${state.order.orderNumber}',
    );
  }
}
