import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/dependensies/di.dart';
import 'package:neo_cafe_24/core/recources/app_colors.dart';
import 'package:neo_cafe_24/core/recources/app_fonts.dart';
import 'package:neo_cafe_24/features/branches/data/data_source/local/branch_local_data.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/category_entity.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/controller/category_bloc/category_bloc.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/controller/menu_item/menu_item_bloc.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/screens/item_info_screen.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/branches_screen.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/main_screen_text_field.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/menu_container.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/widgets/popular_manu_container.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/screens/menu_screen.dart';
import 'package:neo_cafe_24/features/widgets/custom_app_bar.dart';
import 'package:neo_cafe_24/features/widgets/app_bar_button.dart';
import 'package:neo_cafe_24/features/widgets/custom_radius_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryBloc>(context).add(GetAllCategoriesEvent());

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      checkAndShowModal();
    });
  }

  Future<void> checkAndShowModal() async {
    var branchLocalData = getIt<BranchLocalData>();

    var branchId = await branchLocalData.getBranchId();

    if (branchId == null) {
      showCustomAlertDialog(context);
    }
  }

  void showCustomAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const BranchesWindow(),
    );
  }

  String _getTitleBasedOnTimeOfDay() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Доброе утро!';
    } else if (hour < 17) {
      return 'Добрый день!';
    } else {
      return 'Добрый вечер!';
    }
  }

  final controller = TextEditingController();
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(context),
        ),
        _buildSearchField(),
      ],
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryAllLoaded) {
                List<CategoryEntity> categories = state.model;
                List<CategoryEntity> firstRowCategories =
                    categories.take(2).toList();
                List<CategoryEntity> secondRowCategories =
                    categories.skip(2).take(3).toList();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 36,
                    ),
                    _buildTitleAndMenuButton(context),
                    _buildFirstCategoryRow(firstRowCategories),
                    const SizedBox(
                      height: 12,
                    ),
                    _buildSecondCategoryRow(secondRowCategories),
                    const SizedBox(
                      height: 24,
                    ),
                    _buildPopularTitle(),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildPopularItemsList(),
                  ],
                );
              } else if (state is CategoryAllLoading) {
                return const Center(
                  child: SingleChildScrollView(),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Expanded _buildPopularItemsList() {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: PopularMenuContainer(
            name: 'Крамельный раф',
            price: '${270}',
            quantity: 0,
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemInfoScreen(id: 1),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Text _buildPopularTitle() {
    return Text(
      'Популярное',
      style: AppFonts.s16w600.copyWith(
        color: AppColors.black,
      ),
    );
  }

  Row _buildSecondCategoryRow(List<CategoryEntity> categories) {
    List<Widget> categoryWidgets = [];
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(
        Expanded(
          child: GestureDetector(
            onTap: () => {
              BlocProvider.of<MenuItemBloc>(context).add(
                GetAllItemsEvent(
                  id: categories[i].id,
                ),
              ),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuScreen(i),
                ),
              ),
            },
            child: MenuContainer(
              title: categories[i].name,
              image: categories[i].image,
            ),
          ),
        ),
      );
      if (i < categories.length - 1) {
        categoryWidgets.add(const SizedBox(width: 10));
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categoryWidgets,
    );
  }

  Row _buildFirstCategoryRow(List<CategoryEntity> categories) {
    List<Widget> categoryWidgets = [];
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(
        Expanded(
          child: GestureDetector(
            onTap: () => {
              BlocProvider.of<MenuItemBloc>(context).add(
                GetAllItemsEvent(
                  id: categories[i].id,
                ),
              ),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuScreen(
                    i,
                  ),
                ),
              ),
            },
            child: MenuContainer(
              title: categories[i].name,
              image: categories[i].image,
            ),
          ),
        ),
      );

      if (i < categories.length - 1) {
        categoryWidgets.add(const SizedBox(width: 10));
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categoryWidgets,
    );
  }

  Row _buildTitleAndMenuButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Наше меню',
          style: AppFonts.s16w600,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuScreen(
                  0,
                ),
              ),
            );
          },
          child: Text(
            'Перейти к меню',
            style: AppFonts.s16w400.copyWith(color: AppColors.orange),
          ),
        ),
      ],
    );
  }

  MyAppBar _buildAppBar() {
    return MyAppBar(
      title: _getTitleBasedOnTimeOfDay(),
      centerTitle: false,
      actions: [
        AppBarButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  SearchField _buildSearchField() {
    return SearchField(
      controller: controller,
    );
  }
}
