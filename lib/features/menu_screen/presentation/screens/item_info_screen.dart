import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/menu_container.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/popular_manu_container.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/controller/item_bloc/item_bloc.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/presentation/view/cart_screen.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/circle_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_radius_button.dart';

class ItemInfoScreen extends StatefulWidget {
  const ItemInfoScreen({super.key, required this.id});
  final int id;

  @override
  State<ItemInfoScreen> createState() => _ItemInfoScreenState();
}

class _ItemInfoScreenState extends State<ItemInfoScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ItemBloc>(context).add(
      GetItemEvent(id: widget.id),
    );
  }

  int summ = 0;
  int price = 0;
  int counter = 1;
  void incrementCounter() {
    setState(() {
      counter++;
      summ = price * counter;
    });
  }

  void decrementCounter() {
    if (counter > 1) {
      setState(() {
        counter--;
        summ = price * counter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Padding _buildBody() {
    return Padding(
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
          _buildBtuttons()
        ],
      ),
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
    );
  }

  Row _buildBtuttons() {
    return Row(
      children: [
        CircleButton(
          height: 40,
          width: 40,
          iconSize: 24,
          onTap: () {
            decrementCounter();
          },
          color: AppColors.grey,
          icon: Icons.remove,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '$counter',
            style: AppFonts.s32w600.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        CircleButton(
          height: 40,
          width: 40,
          iconSize: 24,
          color: AppColors.orange,
          icon: Icons.add,
          onTap: () {
            incrementCounter();
            setState(() {});
          },
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: CustomButton(
            title: 'В корзину',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (counter) => const CartScreen(),
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

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.23),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.coffeeBeans),
                  fit: BoxFit.cover,
                ),
              ),
              child: AppBar(
                backgroundColor: AppColors.mainColors,
                elevation: 0,
              ),
            ),
            Positioned.fill(
              child: BlocBuilder<ItemBloc, ItemState>(
                builder: (context, state) {
                  return Image.asset(
                    AppImages.appBarBigImage,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Positioned(
              top: 38,
              left: 32,
              child: AppBarButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}