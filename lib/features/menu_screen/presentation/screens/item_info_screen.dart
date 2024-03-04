import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/dependensies/di.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/menu_container.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/popular_manu_container.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/item_entity.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/controller/item_bloc/item_bloc.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/widgets/info_app_bar.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/domain/entity/cart_item_entity.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/presentation/controller/bloc/cart_bloc.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/presentation/view/cart_screen.dart';
import 'package:neo_cafe_24/features/widgets/circle_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_radius_button.dart';
import 'package:neo_cafe_24/features/widgets/navigation_bar.dart';

class ItemInfoScreen extends StatefulWidget {
  const ItemInfoScreen({super.key, required this.id});
  final int id;

  @override
  State<ItemInfoScreen> createState() => _ItemInfoScreenState();
}

class _ItemInfoScreenState extends State<ItemInfoScreen> {
  final cartBloc = getIt<CartBloc>();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ItemBloc>(context).add(
      GetItemEvent(id: widget.id),
    );
    updateCounterFromCart();
  }

  void updateCounterFromCart() {
    final currentState = cartBloc.state;
    if (currentState is CartLoadSuccess) {
      final currentItem =
          currentState.items.firstWhereOrNull((item) => item.id == widget.id);
      if (currentItem != null) {
        setState(() {
          counter = currentItem.quantity;
          price = currentItem.price;
          summ = price * counter;
        });
      }
    }
  }

  int summ = 0;
  int price = 0;
  int counter = 1;
  void incrementCounter() {
    setState(() {});
  }

  void decrementCounter() {
    if (counter > 1) {
      setState(() {
        cartBloc.add(
          CartItemRemoved(
            widget.id,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        if (state is ItemLoaded) {
          return Scaffold(
            appBar: _buildAppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  _buildTitle(),
                  const SizedBox(
                    height: 24,
                  ),
                  _buildDescreption(),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildSecondTitle(),
                  const SizedBox(height: 16),
                  _buildFirstPopular(),
                  const SizedBox(height: 12),
                  _buildSecondPopular(),
                  const SizedBox(height: 16),
                  _buildThirdPopular(),
                  const SizedBox(height: 12),
                  _buildTotalPrice(),
                  const SizedBox(
                    height: 11,
                  ),
                  _buildButtons(context, state.item.id, state.item.name,
                      state.item.itemImage, state.item.pricePerUnit),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  PopularMenuContainer _buildThirdPopular() {
    return PopularMenuContainer(
      buttonWidget: counter == 0
          ? Positioned(
              right: 0,
              bottom: 0,
              child: CustomRadiusButton(
                onPressed: () {
                  counter = 1;
                  setState(() {});
                },
              ),
            )
          : Positioned(
              bottom: 5,
              right: 0,
              child: ButtonsRow(
                counter: counter,
                onMinusTap: () {
                  counter--;
                  setState(() {});
                },
                onPlusTap: () {
                  counter++;
                  setState(() {});
                },
              ),
            ),
      onTap: () {},
      name: 'Крамельный раф',
      price: '${270}',
      quantity: 0,
    );
  }

  PopularMenuContainer _buildSecondPopular() {
    return PopularMenuContainer(
      buttonWidget: counter == 0
          ? Positioned(
              right: 0,
              bottom: 0,
              child: CustomRadiusButton(
                onPressed: () {
                  counter = 1;
                  setState(() {});
                },
              ),
            )
          : Positioned(
              bottom: 5,
              right: 0,
              child: ButtonsRow(
                counter: counter,
                onMinusTap: () {
                  counter--;
                  setState(() {});
                },
                onPlusTap: () {
                  counter++;
                  setState(() {});
                },
              ),
            ),
      onTap: () {},
      name: 'Крамельный раф',
      price: '${270}',
      quantity: 0,
    );
  }

  PopularMenuContainer _buildFirstPopular() {
    return PopularMenuContainer(
      buttonWidget: counter == 0
          ? Positioned(
              right: 0,
              bottom: 0,
              child: CustomRadiusButton(
                onPressed: () {
                  counter = 1;
                  setState(() {});
                },
              ),
            )
          : Positioned(
              bottom: 5,
              right: 0,
              child: ButtonsRow(
                counter: counter,
                onMinusTap: () {
                  counter--;
                  setState(() {});
                },
                onPlusTap: () {
                  counter++;
                  setState(() {});
                },
              ),
            ),
      onTap: () {},
      name: 'Карамельный раф',
      price: '${270}',
      quantity: 0,
    );
  }

  Widget _buildButtons(BuildContext context, int itemId, String itemName,
      String itemImage, int itemPrice) {
    return Row(
      children: [
        CircleButton(
          height: 40,
          width: 40,
          iconSize: 24,
          onTap: () {
            // Отправляем событие удаления товара в CartBloc
            context.read<CartBloc>().add(CartItemRemoved(itemId));
          },
          color: AppColors.grey,
          icon: Icons.remove,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoadSuccess) {
                final currentItem =
                    state.items.firstWhereOrNull((item) => item.id == itemId);
                final itemCount = currentItem?.quantity ?? 0;
                return Text(
                  '$itemCount',
                  style: AppFonts.s32w600.copyWith(color: AppColors.black),
                );
              }
              return Text(
                '0', // Отображаем 0, если товар не найден или произошла ошибка
                style: AppFonts.s32w600.copyWith(color: AppColors.black),
              );
            },
          ),
        ),
        CircleButton(
          height: 40,
          width: 40,
          iconSize: 24,
          color: AppColors.orange,
          icon: Icons.add,
          onTap: () {
            context.read<CartBloc>().add(CartItemAdded(CartItemEntity(
                  id: itemId,
                  name: itemName,
                  image: itemImage,
                  price: itemPrice,
                  quantity: 1,
                )));
          },
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CustomButton(
            title: 'В корзину',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            height: 55,
          ),
        )
      ],
    );
  }

  BlocBuilder _buildTotalPrice() {
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        if (state is ItemLoaded) {
          price = state.item.pricePerUnit;
          if (counter == 1) {
            summ = price;
          }

          return Text(
            '$summ c',
            textAlign: TextAlign.end,
            style: AppFonts.s20w600.copyWith(color: AppColors.orange),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Text _buildSecondTitle() {
    return Text(
      'Приятное дополнение',
      style: AppFonts.s16w600.copyWith(
        color: AppColors.black,
      ),
    );
  }

  BlocBuilder _buildDescreption() {
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        if (state is ItemLoaded) {
          return Text(
            state.item.description,
            style: AppFonts.s16w400.copyWith(color: AppColors.black),
          );
        } else if (state is ItemError) {
          return Text(state.errorText);
        }
        return Text(
          'Латте — шоколадное пирожное коричневого цвета, прямоугольные куски нарезанного шоколадного пирога.',
          style: AppFonts.s16w400.copyWith(color: AppColors.black),
        );
      },
    );
  }

  BlocBuilder _buildTitle() {
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        if (state is ItemLoaded) {
          return Text(
            state.item.name,
            style: AppFonts.s24w600.copyWith(
              color: AppColors.black,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  InfoAppBar _buildAppBar() {
    return InfoAppBar(
      image: AppImages.appBarBigImage,
      appBarHeight: MediaQuery.of(context).size.height * 0.23,
    );
  }
}
