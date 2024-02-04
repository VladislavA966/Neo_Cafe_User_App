import 'package:get_it/get_it.dart';
import 'package:neo_cafe_24/core/services/dio_settings.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/remote_data_source.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/data/repository_impl/sign_in_repo_impl.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/domain/repo/sign_in_repo.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/domain/use_case/sign_in_use_case.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/data/data_source/sign_up_remote.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/data/repository_impl/sign_up_repository_impl.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/repo/sign_up_repo.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/use_case/sign_up_use_case.dart';

final getIt = GetIt.instance;

void setupDependensies() {
  getIt.registerSingleton<DioSettings>(
    DioSettings(),
  );
  signInDependensy();
  signUpDependency();
}

void signUpDependency() {
  getIt.registerSingleton<SignUpRemote>(
    SignUpRemoteImpl(dio: getIt<DioSettings>().dio),
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
    SignInRemoteImpl(
      dio: getIt<DioSettings>().dio,
    ),
  );
  getIt.registerSingleton<SignInRepo>(
    SignInRepositotyImpl(
      remote: getIt<SignInRemote>(),
    ),
  );
  getIt.registerSingleton<SignInUseCase>(
    SignInUseCase(
      repo: getIt<SignInRepo>(),
    ),
  );
}
