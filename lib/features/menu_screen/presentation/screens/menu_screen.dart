import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/branches/presentation/controller/branch_info/single_branch_bloc.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/screens/item_info_screen.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/main_screen_text_field.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/controller/category_bloc/category_bloc.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/controller/menu_item/menu_item_bloc.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/widgets/menu_item.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/widgets/toggle_button.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/domain/entity/cart_item_entity.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/controller/bloc/cart_bloc.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';
import 'package:neo_cafe_24/features/widgets/custom_radius_button.dart';

class MenuScreen extends StatefulWidget {
  final int initialId;

  const MenuScreen({super.key, this.initialId = 1});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final controller = TextEditingController();
  late int selectedId;

  @override
  void initState() {
    selectedId = widget.initialId;
    BlocProvider.of<CategoryBloc>(context).add(
      GetAllCategoriesEvent(),
    );
    BlocProvider.of<MenuItemBloc>(context).add(
      GetAllItemsEvent(id: widget.initialId),
    );
    BlocProvider.of<CartBloc>(context).add(CartStarted());

    super.initState();
  }

  void _onCategorySelected(int id) {
    setState(() {
      selectedId = id;
    });
    BlocProvider.of<MenuItemBloc>(context).add(GetAllItemsEvent(id: id));
  }

  double get childAspectRatio {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = 16.0 * 2;
    double spacing = 10.0;
    int crossAxisCount = 2;

    double totalSpacing = spacing * (crossAxisCount - 1) + padding;
    double itemWidth = (screenWidth - totalSpacing) / crossAxisCount;
    double itemHeight = 250.0;

    double childAspectRatio = itemWidth / itemHeight;
    return childAspectRatio;
  }

  String? branchName;

  @override
  Widget build(BuildContext context) {
    final branchState = context.read<SingleBranchBloc>().state;
    if (branchState is SingleBranchLoaded) {
      branchName = branchState.branch.branchName;
    }
    return Stack(
      children: [
        Scaffold(
          appBar: _buildAppBar(branchName),
          body: _buildBody(childAspectRatio),
        ),
        SearchField(controller: controller)
      ],
    );
  }

  Widget _buildBody(double childAspectRatio) {
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

  Widget _buildMenuGrid(double childAspectRatio) {
    return BlocConsumer<MenuItemBloc, MenuItemState>(
      listener: (context, state) {},
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
                childAspectRatio: childAspectRatio,
              ),
              itemCount: state.model.length,
              itemBuilder: (BuildContext context, int index) {
                return MenuItem(
                  button: _buildAddButton(
                    state,
                    index,
                    context,
                    state.model[index].id,
                    state.model[index].itemImage,
                    state.model[index].name,
                    state.model[index].pricePerUnit,
                  ),
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
        }
        return const SizedBox();
      },
    );
  }

  BlocBuilder _buildAddButton(
    MenuItemLoaded state,
    int index,
    BuildContext context,
    int id,
    String image,
    String name,
    int price,
  ) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoadSuccess) {
          final currentItem =
              state.items.firstWhereOrNull((item) => item.id == id);
          final itemCount = currentItem?.quantity ?? 0;
          return CustomRadiusButton(
            onPressed: () {
              if (itemCount == 0) {
                _addItemToCart(context, id, image, name, price);
              } else {
                _removeItemFromCart(context, currentItem);
              }
            },
            icon: itemCount == 0 ? Icons.add : Icons.shopping_cart,
          );
        }
        return const SizedBox();
      },
    );
  }

  void _removeItemFromCart(BuildContext context, CartItemEntity? currentItem) {
    context.read<CartBloc>().add(CartItemRemoved(currentItem?.id ?? 1));
  }

  void _addItemToCart(
      BuildContext context, int id, String image, String name, int price) {
    BlocProvider.of<CartBloc>(context).add(
      CartItemAdded(
        CartItemEntity(
          id: id,
          image: image,
          name: name,
          price: price,
          quantity: 1,
        ),
      ),
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
                final categoryId = state.model[index].id;
                Color textColor =
                    selectedId == categoryId ? Colors.white : Colors.black;
                Color buttonColor = selectedId == categoryId
                    ? AppColors.orange
                    : AppColors.grey;
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      _onCategorySelected(categoryId);
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

  MyAppBar _buildAppBar(String? branchName) {
    return MyAppBar(
      leading: AppBarButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textWhite,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: 'Меню: ',
      secondTitle: branchName,
    );
  }
}
