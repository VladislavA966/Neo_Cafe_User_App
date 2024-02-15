import 'package:neo_cafe_24/features/auth/auth_by_email/domain/entity/token_entity.dart';

abstract class SignInRepo {
  Future<void> sendEmail(String email);
  Future<void> sendCode(String email, String code);
}
