import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/sign_in_remote.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/domain/repo/sign_in_repo.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/entity/token_entity.dart';

class SignInRepositotyImpl implements SignInRepo {
  final SignInRemote remote;

  SignInRepositotyImpl({required this.remote});
  @override
  Future<TokenEntity> sendCode(String email, String code) async {
    final tokenRemote = await remote
        .confirmLoginCode({"email": email, "confirmation_code": code});
    return TokenEntity(token: tokenRemote.token);
  }

  @override
  Future<void> sendEmail(String email) async {
    await remote.loginWithEmail({"email": email});
  }
}
