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
import 'package:neo_cafe_24/features/menu_screen/data/data_source/menu_remote_data_dource.dart';
import 'package:neo_cafe_24/features/menu_screen/data/repository_impl/category_repository_impl.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/use_cases/category_use_case.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/use_cases/item_use_case.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/use_cases/menu_items_use_case.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/data/data_source/local/cart_local_data_source.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/data/model/cart_model.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/data/repository_impl/cart_repository_impl.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/domain/use_case/cart_use_case.dart';

final getIt = GetIt.instance;

void setupDependensies() {
  getIt.registerSingleton<LocalDataSource>(LocalDataSource());
  getIt.registerSingleton<DioSettings>(
    DioSettings(
      getIt<LocalDataSource>(),
    ),
  );

  signInDependensy();
  signUpDependency();
  manuDependency();
  cartDependency();
}

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

void manuDependency() {
  getIt.registerSingleton<MenuRemoteImpl>(
      MenuRemoteImpl(dio: getIt<DioSettings>().dio));
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

void cartDependency() {
  getIt.registerSingleton<CartLocalDataSourceImpl>(
    CartLocalDataSourceImpl(
      getIt<Box<CartModel>>(),
    ),
  );
  getIt.registerSingleton<CartRepositoryImpl>(
    CartRepositoryImpl(
      dataSource: getIt<CartLocalDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<CartUseCase>(
    CartUseCase(
      repo: getIt<CartRepositoryImpl>(),
    ),
  );
}
