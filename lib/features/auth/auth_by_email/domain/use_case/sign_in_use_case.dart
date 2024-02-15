import 'package:neo_cafe_24/features/auth/auth_by_email/domain/entity/token_entity.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/domain/repo/sign_in_repo.dart';

class SignInUseCase {
  final SignInRepo repo;

  SignInUseCase({required this.repo});
  Future<void> sendEmailCall(String email) async {
    return await repo.sendEmail(email);
  }

  Future<void> sendCodeCall(String email, String code) async {
    await repo.sendCode(email, code);
  }
}
