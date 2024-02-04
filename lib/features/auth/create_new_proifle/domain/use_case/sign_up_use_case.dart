import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/repo/sign_up_repo.dart';

class SignUpUseCase {
  final SignUpRepo repo;

  SignUpUseCase({required this.repo});
  Future<void> sendNewUserDataCall(
      String name, String email, String date) async {
    await repo.sendNewUserData(name, email, date);
  }

  Future<void> sendSignUpCode(String code) async {
    await repo.sendSignUpCode(code);
  }
}
