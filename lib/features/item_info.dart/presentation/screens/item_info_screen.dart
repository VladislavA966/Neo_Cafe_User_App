import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/popular_manu_container.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/circle_button.dart';

class ItemInfoScreen extends StatefulWidget {
  const ItemInfoScreen({super.key});

  @override
  State<ItemInfoScreen> createState() => _ItemInfoScreenState();
}

class _ItemInfoScreenState extends State<ItemInfoScreen> {
  void setCounter() {
    if (counter >= 1) {
      counter--;
      setState(() {});
    }
    {
      null;
    }
  }

  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
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
          PopularMenuContainer(
            onTap: () {},
          ),
          const SizedBox(height: 12),
          PopularMenuContainer(
            onTap: () {},
          ),
          const SizedBox(height: 12),
          PopularMenuContainer(onTap: () {}),
          const SizedBox(height: 16),
          _buildTotalPrice(),
          const SizedBox(
            height: 11,
          ),
          _buildBtuttons()
        ],
      ),
    );
  }

  Row _buildBtuttons() {
    return Row(
      children: [
        CircleButton(
          onTap: () {
            setCounter();
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
          color: AppColors.orange,
          icon: Icons.add,
          onTap: () {
            counter++;
            setState(() {});
          },
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: CustomButton(
            title: 'В корзину',
            onPressed: () {},
            height: 55,
          ),
        )
      ],
    );
  }

  Row _buildTotalPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Text(
          '140 c',
          textAlign: TextAlign.end,
          style: AppFonts.s20w600.copyWith(color: AppColors.orange),
        ),
      ],
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

  Text _buildDescreption() {
    return Text(
      'Латте — шоколадное пирожное коричневого цвета, прямоугольные куски нарезанного шоколадного пирога.',
      style: AppFonts.s16w400.copyWith(color: AppColors.black),
    );
  }

  Text _buildTitle() {
    return Text(
      'Латте',
      style: AppFonts.s24w600.copyWith(
        color: AppColors.black,
      ),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
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
                leading: AppBarButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                backgroundColor: AppColors.mainColors,
                elevation: 0,
              ),
            ),
            Positioned.fill(
              child: Image.asset(
                AppImages.appBarBigImage,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
