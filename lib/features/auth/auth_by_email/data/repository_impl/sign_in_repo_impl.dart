import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/remote_data_source.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/domain/repo/sign_in_repo.dart';

class SignInRepositotyImpl implements SignInRepo {
  final SignInRemote remote;

  SignInRepositotyImpl({required this.remote});
  @override
  Future<void> sendCode(String code) {
    // TODO: implement sendCode
    throw UnimplementedError();
  }

  @override
  Future<void> sendEmail(String email) {
    // TODO: implement sendEmail
    throw UnimplementedError();
  }
}
