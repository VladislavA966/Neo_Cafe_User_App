import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/entity/token_entity.dart';

abstract class SignUpRepo {
  Future<void> sendNewUserData(String email);
  Future<void> sendSignUpCode(String email, String code);
}
