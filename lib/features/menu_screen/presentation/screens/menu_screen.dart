import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/core/recources/app_images.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/screens/item_info_screen.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/main_screen_text_field.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/controller/category_bloc/category_bloc.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/controller/menu_item/menu_item_bloc.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';
import 'package:neo_cafe_24/features/widgets/custom_radius_button.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final controller = TextEditingController();
  int selectedIndex = 0;
  @override
  void initState() {
    BlocProvider.of<MenuItemBloc>(context).add(GetAllItemsEvent());
    BlocProvider.of<CategoryBloc>(context).add(
      GetAllCategoriesEvent(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = 16.0 * 2;
    double spacing = 10.0;
    int crossAxisCount = 2;

    double totalSpacing = spacing * (crossAxisCount - 1) + padding;
    double itemWidth = (screenWidth - totalSpacing) / crossAxisCount;
    double itemHeight = 206.0;

    double childAspectRatio = itemWidth / itemHeight;

    return Stack(
      children: [
        Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(childAspectRatio),
        ),
        SearchField(controller: controller)
      ],
    );
  }

  Padding _buildBody(double childAspectRatio) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 48,
          ),
          _buildTitle(),
          const SizedBox(
            height: 12,
          ),
          _buildToggleButtonsList(),
          const SizedBox(
            height: 20,
          ),
          _buildMenuGrid(childAspectRatio)
        ],
      ),
    );
  }

  BlocBuilder _buildMenuGrid(double childAspectRatio) {
    return BlocBuilder<MenuItemBloc, MenuItemState>(
      builder: (context, state) {
        if (state is MenuItemLoaded) {
          return Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: (childAspectRatio),
              ),
              itemCount: state.model.length,
              itemBuilder: (BuildContext context, int index) {
                return MenuItem(
                  name: state.model[index].name,
                  price: state.model[index].pricePerUnit.toString(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemInfoScreen(
                          id: state.model[index].id,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        } else if (state is MenuItemError) {
          return Center(child: Text(state.errorText));
        }
        return const SizedBox();
      },
    );
  }

  BlocBuilder _buildToggleButtonsList() {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryAllLoaded) {
          return SizedBox(
            height: 38,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.model.length,
              itemBuilder: (context, index) {
                Color buttonColor =
                    selectedIndex == index ? Colors.orange : Colors.grey;
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      color: buttonColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              state.model[index].name,
                              style: AppFonts.s12w400,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is CategoryAllError) {
          Text(state.errorText);
        }
        return const SizedBox();
      },
    );
  }

  Text _buildTitle() {
    return Text(
      'Категории',
      style: AppFonts.s16w600.copyWith(color: AppColors.black),
    );
  }

  MyAppBar _buildAppBar() {
    return const MyAppBar(
      title: 'Меню: Держинка',
      centerTitle: false,
    );
  }
}

class MenuItem extends StatelessWidget {
  final Function() onTap;
  final String name;
  final String price;

  const MenuItem(
      {super.key,
      required this.onTap,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Image.asset(
                  AppImages.item,
                  width: double.infinity,
                  height: 110,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                name,
                style: AppFonts.s14w600.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$price c',
                      style:
                          AppFonts.s14w600.copyWith(color: AppColors.orange)),
                  const CustomRadiusButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
