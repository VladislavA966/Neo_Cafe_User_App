import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/menu_container.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/popular_manu_container.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/screens/menu_screen.dart';
import 'package:neo_cafe_24/features/order_history/presentation/view/orders_screen.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/controller/bloc/cart_bloc.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/widgets/first_allert_dialog.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/widgets/opacity_button.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int counter = 0;
  int? currentIndex = 0;

  @override
  void initState() {
    BlocProvider.of<CartBloc>(context).add(
      CartItemsRequested(),
    );
    super.initState();
  }

  double calculateTotal(CartLoadSuccess state) {
    double total = 0;
    for (var item in state.items) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: _buildAppBar(context),
          body: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoadSuccess) {
                if (state.items.isEmpty) {
                  return _buildEmptyCartScreen();
                } else {
                  return _buildBody(context, state);
                }
              } else if (state is CartLoadFailure) {}
              return _buildEmptyCartScreen();
            },
          ),
        ),
        _buildAppBarButto(context)
      ],
    );
  }

  Positioned _buildAppBarButto(BuildContext context) {
    return Positioned(
      top: 60,
      right: 0,
      child: AppBarButton(
        icon: Image.asset(AppImages.clipBoard),
        onPressed: () => _goToOrderHistory(context),
      ),
    );
  }

  void _goToOrderHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OrdersHistoryScreen(),
      ),
    );
  }

  Center _buildEmptyCartScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Ваша корзина пуста',
            style: AppFonts.s20w600.copyWith(color: AppColors.black),
          ),
          Image.asset('assets/images/empty_cart.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: CustomButton(
              title: 'В меню',
              onPressed: () => _goToMenu(),
              height: 54,
            ),
          )
        ],
      ),
    );
  }

  void _goToMenu() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (counter) => const MenuScreen(),
      ),
    );
  }

  Padding _buildBody(BuildContext context, CartLoadSuccess state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            _buildCartList(state),
            const SizedBox(height: 20),
            _buildAddMoreButton(),
            const SizedBox(height: 41),
            _buildSummaryText(context, state),
            const SizedBox(height: 12),
            _buildOrderButton(),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }

  CustomButton _buildOrderButton() {
    return CustomButton(
        height: 54,
        title: 'Заказать',
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const FirstBonusDialog();
            },
          );
        });
  }

  RichText _buildSummaryText(BuildContext context, CartLoadSuccess state) {
    double total = calculateTotal(state);
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: 'Итого: ',
            style: AppFonts.s14w600.copyWith(
              color: AppColors.black,
            ),
          ),
          TextSpan(
            text: '${total.toInt()} c',
            style: AppFonts.s20w600.copyWith(
              color: AppColors.orange,
            ),
          ),
        ],
      ),
    );
  }

  OpacityButton _buildAddMoreButton() {
    return OpacityButton(
      title: 'Добавить еще',
      onPressed: () => _goToMenu(),
      borderColor: AppColors.orange,
    );
  }

  Expanded _buildCartList(CartLoadSuccess state) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.items.length,
        itemBuilder: (BuildContext context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: PopularMenuContainer(
            buttonWidget: Positioned(
              bottom: 5,
              right: 0,
              child: ButtonsRow(
                counter: state.items[index].quantity,
                onMinusTap: () =>
                    _removeItemFromCartEvent(context, state, index),
                onPlusTap: () {
                  BlocProvider.of<CartBloc>(context).add(
                    CartItemAdded(
                      state.items[index],
                    ),
                  );
                },
              ),
            ),
            onTap: () {},
            name: state.items[index].name,
            price: '${state.items[index].price}',
            quantity: state.items[index].quantity,
          ),
        ),
      ),
    );
  }

  void _removeItemFromCartEvent(
      BuildContext context, CartLoadSuccess state, int index) {
    setState(
      () {
        BlocProvider.of<CartBloc>(context)
            .add(CartItemRemoved(state.items[index].id));
      },
    );
  }
}

MyAppBar _buildAppBar(BuildContext context) {
  return MyAppBar(
    title: 'Корзина',
    centerTitle: false,
  );
}
