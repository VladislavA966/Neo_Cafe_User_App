import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neo_cafe_24/core/dependensies/di.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/local_data_source/local_data_source.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/domain/use_case/sign_in_use_case.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/presentation/bloc/sign_in_bloc.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/use_case/sign_up_use_case.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/presentation/bloc/sign_up_bloc.dart';
import 'package:neo_cafe_24/features/branches/domain/use_case/get_all_branches_use_case.dart';
import 'package:neo_cafe_24/features/branches/domain/use_case/get_branch.dart';
import 'package:neo_cafe_24/features/branches/domain/use_case/get_branch_favourite_items.dart';
import 'package:neo_cafe_24/features/branches/domain/use_case/new_order_use_case.dart';
import 'package:neo_cafe_24/features/branches/presentation/controller/all_branches_bloc/all_branches_bloc.dart';
import 'package:neo_cafe_24/features/branches/presentation/controller/branch_favourite_items/branch_favourite_items_bloc.dart';
import 'package:neo_cafe_24/features/branches/presentation/controller/branch_info/single_branch_bloc.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/use_cases/category_use_case.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/use_cases/item_use_case.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/use_cases/menu_items_use_case.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/controller/category_bloc/category_bloc.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/controller/item_bloc/item_bloc.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/controller/menu_item/menu_item_bloc.dart';
import 'package:neo_cafe_24/features/order_history/domain/use_case/order_history_use_case.dart';
import 'package:neo_cafe_24/features/order_history/domain/use_case/order_info_use_case.dart';
import 'package:neo_cafe_24/features/order_history/presentation/controller/bloc/order_history_bloc.dart';
import 'package:neo_cafe_24/features/order_history/presentation/view/order_info_screen/bloc/order_info_bloc.dart';
import 'package:neo_cafe_24/features/profile/domain/use_case/edit_profile_use_case.dart';
import 'package:neo_cafe_24/features/profile/domain/use_case/profile_use_case.dart';
import 'package:neo_cafe_24/features/profile/presentation/controller/bloc/profile_bloc.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/domain/use_case/cart_use_case.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/controller/bloc/cart_bloc.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/controller/new_order_bloc/new_order_bloc.dart';
import 'package:neo_cafe_24/features/welcom_screen/presentation/welcome_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final blocs = [
      BlocProvider(
        create: (context) => SignInBloc(
          getIt<SignInUseCase>(),
          getIt<LocalDataSource>(),
        ),
      ),
      BlocProvider(
        create: (context) => SignUpBloc(
          getIt<SignUpUseCase>(),
          getIt<LocalDataSource>(),
        ),
      ),
      BlocProvider(
        create: (context) => CategoryBloc(
          getIt<CategoryUseCase>(),
        ),
      ),
      BlocProvider(
        create: (context) => MenuItemBloc(
          getIt<AllItemsUseCase>(),
          getIt<CartUseCase>(),
        ),
      ),
      BlocProvider(
        create: (context) => ItemBloc(
          getIt<ItemUseCase>(),
        ),
      ),
      BlocProvider(
        create: (context) => CartBloc(
          cartUseCase: getIt<CartUseCase>(),
        ),
      ),
      BlocProvider(
        create: (context) => AllBranchesBloc(
          getIt<GetAllBranchesUseCase>(),
        ),
      ),
      BlocProvider(
        create: (context) => SingleBranchBloc(
          getIt<BranchUseCase>(),
        ),
      ),
      BlocProvider(
        create: (context) => ProfileBloc(
          getIt<ProfileUseCase>(),
          getIt<EditProfileUseCase>(),
        ),
      ),
      BlocProvider(
        create: (context) => BranchFavouriteItemsBloc(
          getIt<GetFavouriteItemsUseCase>(),
        ),
      ),
      BlocProvider(
        create: (context) => NewOrderBloc(
          getIt<NewOrderUseCase>(),
        ),
      ),
      BlocProvider(
        create: (context) => OrderHistoryBloc(
          getIt<OrderHistoryUseCase>(),
        ),
      ),
      BlocProvider(
        create: (context) => OrderInfoBloc(
          getIt<OrderInfoUseCase>(),
        ),
      ),
    ];






    
    return MultiBlocProvider(
      providers: blocs,
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen(),
      ),
    );
  }
}
