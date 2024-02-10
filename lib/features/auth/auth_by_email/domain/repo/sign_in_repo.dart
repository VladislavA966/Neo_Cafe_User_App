import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/entity/token_entity.dart';

abstract class SignInRepo {
  Future<void> sendEmail(String email);
  Future<TokenEntity> sendCode(String email, String code);
}
