import 'package:neo_cafe_24/features/auth/create_new_proifle/data/data_source/sign_up_remote.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/entity/token_entity.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/repo/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final SignUpRemote remote;

  SignUpRepoImpl({required this.remote});

  @override
  Future<void> sendNewUserData(String email) async {
    await remote.sendNewUserData({"email": email});
  }

  @override
  Future<void> sendSignUpCode(String email, String code) async {
    final dataSouce = await remote
        .sendSignUpCode({"email": email, "confirmation_code": code});
    // return TokenEntity(token: dataSouce.token);
  }
}
