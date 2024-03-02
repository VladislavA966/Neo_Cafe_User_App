import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/screens/item_info_screen.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/main_screen_text_field.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/controller/category_bloc/category_bloc.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/controller/menu_item/menu_item_bloc.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/widgets/menu_item.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/widgets/toggle_button.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/domain/entity/cart_item_entity.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/presentation/controller/bloc/cart_bloc.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';

class MenuScreen extends StatefulWidget {
  int selectedIndex;
  MenuScreen(int i, {super.key, this.selectedIndex = 0});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final controller = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(
      GetAllCategoriesEvent(),
    );
    BlocProvider.of<CartBloc>(context).add(CartStarted());

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
    double itemHeight = 240.0;

    double childAspectRatio = itemWidth / itemHeight;
    bool isGrid = false;

    return Stack(
      children: [
        Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(childAspectRatio, isGrid),
        ),
        SearchField(controller: controller)
      ],
    );
  }

  Padding _buildBody(double childAspectRatio, bool isGrid) {
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

  BlocBuilder _buildListMenu(double childAspectRatio) {
    return BlocBuilder<MenuItemBloc, MenuItemState>(
      builder: (context, state) {
        if (state is MenuItemLoaded) {
          return _buildMenuGrid(childAspectRatio);
        } else if (state is MenuItemError) {
          return Center(child: Text(state.errorText));
        } else if (state is MenuItemLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const SizedBox();
      },
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
                  addTap: () {
                    final cartItem = CartItemEntity(
                        id: state.model[index].id,
                        image: state.model[index].itemImage,
                        name: state.model[index].name,
                        price: state.model[index].pricePerUnit,
                        quantity: 1);
                    BlocProvider.of<CartBloc>(context).add(
                      CartItemAdded(cartItem),
                    );
                  },
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
        } else if (state is MenuItemLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
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
                Color textColor =
                    widget.selectedIndex == index ? Colors.white : Colors.black;
                Color buttonColor = widget.selectedIndex == index
                    ? AppColors.orange
                    : AppColors.grey;
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<MenuItemBloc>(context).add(
                        GetAllItemsEvent(
                          id: state.model[index].id,
                        ),
                      );
                      widget.selectedIndex = index;
                      setState(() {});
                    },
                    child: ToggleButton(
                      textColor: textColor,
                      buttonColor: buttonColor,
                      name: state.model[index].name,
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
    return MyAppBar(
      leading: AppBarButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textWhite,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: 'Меню: Держинка',
    );
  }
}
