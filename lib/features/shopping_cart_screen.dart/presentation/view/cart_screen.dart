import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/auth/widgets/custom_button.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/menu_container.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/popular_manu_container.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';
import 'package:neo_cafe_24/features/widgets/custom_radius_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int counter = 0;
  int? currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(context),
        ),
        _buildToggleSwitch(),
      ],
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 64,
            ),
            _buildCartList(),
            const SizedBox(height: 20),
            _buildAddMoreButton(),
            const SizedBox(height: 41),
            _buildSummaryText(context),
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
      title: 'Заказать',
      onPressed: () {},
      height: 54,
    );
  }

  RichText _buildSummaryText(BuildContext context) {
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
            text: '720 c',
            style: AppFonts.s20w600.copyWith(
              color: AppColors.orange,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildAddMoreButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: AppColors.orange,
            ),
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        onPressed: () {},
        child: Text(
          'Добавить еще',
          style: AppFonts.s16w600.copyWith(
            color: Colors.orange,
          ),
        ),
      ),
    );
  }

  Expanded _buildCartList() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: PopularMenuContainer(
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
                        }),
                  ),
            onTap: () {},
          ),
        ),
      ),
    );
  }

  MyAppBar _buildAppBar() {
    return MyAppBar(
      actions: [
        AppBarButton(
          icon: Image.asset(AppImages.clipBoard),
          onPressed: () {},
        )
      ],
      title: 'Корзина',
      centerTitle: false,
    );
  }

  Positioned _buildToggleSwitch() {
    return Positioned(
      top: 156,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ToggleSwitch(
          minWidth: double.infinity,
          minHeight: 48,
          cornerRadius: 100,
          activeBgColors: const [
            [AppColors.orange],
            [AppColors.orange]
          ],
          activeFgColor: Colors.white,
          inactiveBgColor: AppColors.grey,
          inactiveFgColor: Colors.black,
          initialLabelIndex: currentIndex,
          totalSwitches: 2,
          labels: const ['Возьму с собой', 'В заведении'],
          radiusStyle: true,
          onToggle: (index) {
            currentIndex = index;
            setState(() {});
          },
        ),
      ),
    );
  }
}
