import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/entity/token_entity.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/repo/sign_up_repo.dart';

class SignUpUseCase {
  final SignUpRepo repo;

  SignUpUseCase({required this.repo});
  Future<void> sendNewUserDataCall(String email) async {
    await repo.sendNewUserData(email);
  }

  Future<void> sendSignUpCode(String email, String code) async {
     await repo.sendSignUpCode(email, code);
  }
}
