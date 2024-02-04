import 'package:neo_cafe_24/features/auth/create_new_proifle/data/data_source/sign_up_remote.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/repo/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final SignUpRemote remote;

  SignUpRepoImpl({required this.remote});
  @override
  Future<void> sendNewUserData(String name, String email, String date) {
    // TODO: implement sendNewUserData
    throw UnimplementedError();
  }

  @override
  Future<void> sendSignUpCode(String code) {
    // TODO: implement sendSignUpCode
    throw UnimplementedError();
  }
}
