import 'package:neo_cafe_24/features/auth/auth_by_email/domain/repo/sign_in_repo.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/entity/token_entity.dart';

class SignInUseCase {
  final SignInRepo repo;

  SignInUseCase({required this.repo});
  Future<void> sendEmailCall(String email) async {
    return await repo.sendEmail(email);
  }

  Future<TokenEntity> sendCodeCall(String email, String code) async {
    return await repo.sendCode(email, code);
  }
}
