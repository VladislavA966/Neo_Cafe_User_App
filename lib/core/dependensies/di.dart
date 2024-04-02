import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:neo_cafe_24/core/services/dio_settings.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/local_data_source/local_data_source.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/sign_in_remote.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/data/repository_impl/sign_in_repo_impl.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/domain/repo/sign_in_repo.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/domain/use_case/sign_in_use_case.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/data/data_source/sign_up_remote.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/data/repository_impl/sign_up_repository_impl.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/repo/sign_up_repo.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/use_case/sign_up_use_case.dart';
import 'package:neo_cafe_24/features/branches/data/data_source/local/branch_local_data.dart';
import 'package:neo_cafe_24/features/branches/data/data_source/remote/branch_remote_data_source.dart';
import 'package:neo_cafe_24/features/branches/data/mapper/branch_to_entity.dart';
import 'package:neo_cafe_24/features/branches/data/mapper/branches_to_entity_mapper.dart';
import 'package:neo_cafe_24/features/branches/data/mapper/schedules_to_entity_mapper.dart';
import 'package:neo_cafe_24/features/branches/data/repository_impl/branch_repository_impl.dart';
import 'package:neo_cafe_24/features/branches/domain/use_case/get_all_branches_use_case.dart';
import 'package:neo_cafe_24/features/branches/domain/use_case/get_branch.dart';
import 'package:neo_cafe_24/features/branches/domain/use_case/get_branch_favourite_items.dart';
import 'package:neo_cafe_24/features/branches/domain/use_case/new_order_use_case.dart';
import 'package:neo_cafe_24/features/branches/presentation/controller/all_branches_bloc/all_branches_bloc.dart';
import 'package:neo_cafe_24/features/menu_screen/data/data_source/menu_remote_data_dource.dart';
import 'package:neo_cafe_24/features/menu_screen/data/repository_impl/category_repository_impl.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/use_cases/category_use_case.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/use_cases/item_use_case.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/use_cases/menu_items_use_case.dart';
import 'package:neo_cafe_24/features/order_history/data/remote_data/order_history_remote.dart';
import 'package:neo_cafe_24/features/order_history/data/repo_impl/order_history_repo_impl.dart';
import 'package:neo_cafe_24/features/order_history/domain/use_case/order_history_use_case.dart';
import 'package:neo_cafe_24/features/order_history/domain/use_case/order_info_use_case.dart';
import 'package:neo_cafe_24/features/profile/data/data_source/profile_data_source.dart';
import 'package:neo_cafe_24/features/order_history/data/mappers/ito_mapper.dart';
import 'package:neo_cafe_24/features/order_history/data/mappers/order_mapper.dart';
import 'package:neo_cafe_24/features/profile/data/mapper/profile_mapper.dart';
import 'package:neo_cafe_24/features/profile/data/repository_impl/profile_repository_impl.dart';
import 'package:neo_cafe_24/features/profile/domain/use_case/edit_profile_use_case.dart';
import 'package:neo_cafe_24/features/profile/domain/use_case/profile_use_case.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/data_source/local/cart_local_data_source.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/data_source/remote/new_order_remote.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/mapper/item_order_to_model_mapper.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/model/cart_model/cart_model.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/repository_impl/cart_repository_impl.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/repository_impl/new_order_repo_impl.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/domain/use_case/cart_use_case.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/presentation/controller/bloc/cart_bloc.dart';

final getIt = GetIt.instance;

void setupDependensies() {
  //Token
  getIt.registerSingleton<LocalDataSource>(LocalDataSource());
  getIt.registerSingleton<BranchLocalData>(
    BranchLocalData(),
  );
  //DioSettings
  getIt.registerSingleton<DioSettings>(
    DioSettings(
      getIt<LocalDataSource>(),
    ),
  );
  mappers();

  signInDependensy();
  signUpDependency();
  manuDependency();
  cartDependency();
  branchesDependency();
  blocDependencies();
  profileDependency();
  newOrderDependency();
  orderHistoryDependencies();
}

//SignUp
void signUpDependency() {
  getIt.registerSingleton<SignUpRemote>(
    SignUpRemote(
      getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<SignUpRepo>(
    SignUpRepoImpl(
      remote: getIt<SignUpRemote>(),
    ),
  );
  getIt.registerSingleton<SignUpUseCase>(
    SignUpUseCase(
      repo: getIt<SignUpRepo>(),
    ),
  );
}

//SignIn
void signInDependensy() {
  getIt.registerSingleton<SignInRemote>(
    SignInRemote(
      getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<SignInRepo>(
    SignInRepositotyImpl(
      remote: getIt<SignInRemote>(),
      local: getIt<LocalDataSource>(),
    ),
  );
  getIt.registerSingleton<SignInUseCase>(
    SignInUseCase(
      repo: getIt<SignInRepo>(),
    ),
  );
}

//Menu
void manuDependency() {
  getIt.registerSingleton<MenuRemoteImpl>(
    MenuRemoteImpl(
      dio: getIt<DioSettings>().dio,
      local: getIt<BranchLocalData>(),
    ),
  );
  getIt.registerSingleton<MenuRepositoryImpl>(
    MenuRepositoryImpl(
      remote: getIt<MenuRemoteImpl>(),
    ),
  );
  getIt.registerSingleton<CategoryUseCase>(
    CategoryUseCase(
      repo: getIt<MenuRepositoryImpl>(),
    ),
  );
  getIt.registerSingleton<AllItemsUseCase>(
    AllItemsUseCase(
      repo: getIt<MenuRepositoryImpl>(),
    ),
  );
  getIt.registerSingleton<ItemUseCase>(
    ItemUseCase(
      repo: getIt<MenuRepositoryImpl>(),
    ),
  );
}

//Cart
void cartDependency() {
  getIt.registerSingleton<CartLocalDataSourceImpl>(CartLocalDataSourceImpl(
    getIt<Box<CartModel>>(),
  ));
  getIt.registerSingleton<CartRepositoryImpl>(CartRepositoryImpl(
    data: getIt<CartLocalDataSourceImpl>(),
  ));
  getIt.registerSingleton<CartUseCase>(
    CartUseCase(repo: getIt<CartRepositoryImpl>()),
  );
}

//Branches
void branchesDependency() {
  getIt.registerSingleton<BranchRemoteImpl>(
    BranchRemoteImpl(
      dio: getIt<DioSettings>().dio,
      localData: getIt<BranchLocalData>(),
    ),
  );
  getIt.registerSingleton<BranchRepositoryImpl>(
    BranchRepositoryImpl(
      remote: getIt<BranchRemoteImpl>(),
      branchesMapper: getIt<BranchesToEnityMapper>(),
      branchMapper: getIt<BranchToEntityMapper>(),
    ),
  );
  getIt.registerSingleton<GetAllBranchesUseCase>(
    GetAllBranchesUseCase(
      repo: getIt<BranchRepositoryImpl>(),
    ),
  );
  getIt.registerSingleton<BranchUseCase>(
    BranchUseCase(
      repo: getIt<BranchRepositoryImpl>(),
    ),
  );
  getIt.registerSingleton<GetFavouriteItemsUseCase>(
    GetFavouriteItemsUseCase(
      repo: getIt<BranchRepositoryImpl>(),
    ),
  );
}

//Blocs
void blocDependencies() {
  getIt.registerSingleton<AllBranchesBloc>(
    AllBranchesBloc(
      getIt<GetAllBranchesUseCase>(),
    ),
  );
  getIt.registerSingleton<CartBloc>(
    CartBloc(
      cartUseCase: getIt<CartUseCase>(),
    ),
  );
}
//Profile

void profileDependency() {
  getIt.registerSingleton<ProfileDataSourceImpl>(
    ProfileDataSourceImpl(
      local: getIt<LocalDataSource>(),
      dio: getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<ProfileRepositoryImpl>(
    ProfileRepositoryImpl(
      remote: getIt<ProfileDataSourceImpl>(),
      profileMapper: getIt<ProfileMapper>(),
    ),
  );
  getIt.registerSingleton<ProfileUseCase>(
    ProfileUseCase(
      repo: getIt<ProfileRepositoryImpl>(),
    ),
  );
  getIt.registerSingleton<EditProfileUseCase>(
    EditProfileUseCase(
      repo: getIt<ProfileRepositoryImpl>(),
    ),
  );
}

//NewOrder
void newOrderDependency() {
  getIt.registerSingleton<NewOrderRemoteImpl>(
    NewOrderRemoteImpl(
      dio: getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<NewOrderRepoImpl>(
    NewOrderRepoImpl(
      newOrderRemote: getIt<NewOrderRemoteImpl>(),
      cartLocal: getIt<CartLocalDataSourceImpl>(),
      branchLocal: getIt<BranchLocalData>(),
      itemMapper: getIt<ItemOrderToModelMapper>(),
    ),
  );
  getIt.registerSingleton<NewOrderUseCase>(
    NewOrderUseCase(
      repo: getIt<NewOrderRepoImpl>(),
    ),
  );
}

//OrderHistory
void orderHistoryDependencies() {
  getIt.registerSingleton<OrderHistoryRemoteDataImpl>(
    OrderHistoryRemoteDataImpl(
      dio: getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<OrderHistoryRepoImpl>(
    OrderHistoryRepoImpl(
      orderMapper: getIt<OrderMapper>(),
      remoteData: getIt<OrderHistoryRemoteDataImpl>(),
    ),
  );
  getIt.registerSingleton<OrderHistoryUseCase>(
    OrderHistoryUseCase(
      repo: getIt<OrderHistoryRepoImpl>(),
    ),
  );
  getIt.registerSingleton<OrderInfoUseCase>(
    OrderInfoUseCase(
      repo: getIt<OrderHistoryRepoImpl>(),
    ),
  );
}

//Mappers
void mappers() {
  getIt.registerSingleton<ItoMapper>(
    ItoMapper(),
  );
  getIt.registerSingleton<OrderMapper>(
    OrderMapper(
      itoMapper: getIt<ItoMapper>(),
    ),
  );
  getIt.registerSingleton<ProfileMapper>(
    ProfileMapper(
      orderMapper: getIt<OrderMapper>(),
    ),
  );
  getIt.registerSingleton<ItemOrderToModelMapper>(
    ItemOrderToModelMapper(),
  );
  getIt.registerSingleton<ScheDulesToEntityMapper>(ScheDulesToEntityMapper());
  getIt.registerSingleton<BranchToEntityMapper>(
    BranchToEntityMapper(
      schedulesMapper: getIt<ScheDulesToEntityMapper>(),
    ),
  );
  getIt.registerSingleton<BranchesToEnityMapper>(
    BranchesToEnityMapper(
      scheduleMapper: getIt<ScheDulesToEntityMapper>(),
    ),
  );
}
